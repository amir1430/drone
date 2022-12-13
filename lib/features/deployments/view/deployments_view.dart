import 'package:drone/core/core.dart';
import 'package:drone/features/deployments/bloc/deployments_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeploymentsView extends StatelessWidget {
  const DeploymentsView({
    super.key,
    required this.owner,
    required this.repoName,
  });

  final String owner;
  final String repoName;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeploymentsBloc, DeploymentsState>(
      builder: (context, state) {
        return state.map(
          initial: (_) => const SizedBox.shrink(),
          loading: (_) => const Center(child: CircularProgressIndicator()),
          success: (data) {
            if (data.deployments.isEmpty) {
              return const Center(child: Text('No deployments'));
            }
            return ListView.separated(
              itemCount: data.deployments.length,
              itemBuilder: (BuildContext context, int index) {
                final deployment = data.deployments[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(deployment.authorAvatar),
                  ),
                  trailing: deployment.status.buildStatusToIcon,
                  title: Text('${deployment.sender}/ ${deployment.deployTo}'),
                  subtitle: Text(deployment.message),
                );
              },
              separatorBuilder: (context, _) {
                return const Divider();
              },
            );
          },
          failure: (message) => DroneErrorWidget(
            message: message,
            onRetry: () => context.read<DeploymentsBloc>().add(
                  DeploymentsEvent.started(owner: owner, repoName: repoName),
                ),
          ),
        );
      },
    );
  }
}
