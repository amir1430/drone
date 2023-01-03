import 'package:drone/core/core.dart';
import 'package:drone/features/branches/bloc/branches_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BranchesView extends StatelessWidget {
  const BranchesView({
    super.key,
    required this.owner,
    required this.repoName,
  });

  final String owner;
  final String repoName;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BranchesBloc, BranchesState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const Center(child: CircularProgressIndicator()),
          success: (branches) {
            if (branches.isEmpty) {
              return const Center(child: Text('No branches'));
            }
            return RefreshIndicator(
              onRefresh: () async {
                context.read<BranchesBloc>().add(
                      BranchesEvent.started(owner: owner, repoName: repoName),
                    );
              },
              child: ListView.builder(
                itemCount: branches.length,
                itemBuilder: (BuildContext context, int index) {
                  final branch = branches[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(branch.authorAvatar),
                    ),
                    trailing: branch.status.toIcon,
                    title: Text(
                      branch.message,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text('${branch.target}, ${branch.sender}'),
                  );
                },
              ),
            );
          },
          failure: (message) => DroneErrorWidget(
            message: message,
            onRetry: () => context
                .read<BranchesBloc>()
                .add(BranchesEvent.started(owner: owner, repoName: repoName)),
          ),
        );
      },
    );
  }
}
