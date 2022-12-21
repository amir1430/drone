import 'package:drone/core/core.dart';
import 'package:drone/features/build/bloc/build_log_bloc/build_log_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repo_repository/repo_repository.dart';

class BuildLogDialog extends StatelessWidget {
  const BuildLogDialog({
    super.key,
    required this.owner,
    required this.name,
    required this.number,
    required this.stageNum,
    required this.stepNum,
    required this.stageName,
    required this.stepName,
  });

  final String stageNum;
  final String stepNum;
  final String stageName;
  final String stepName;
  final String owner;
  final String name;
  final int number;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BuildLogBloc(
        repoRepository: context.read<RepoRepository>(),
        number: number,
        stage: stageNum,
        step: stepNum,
        owner: owner,
        name: name,
      ),
      lazy: false,
      child: Scaffold(
        appBar: DroneAppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$name/$stageName/$stepName',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                '# $number',
                style: context.caption,
              ),
            ],
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<BuildLogBloc, BuildLogState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const Expanded(child: SizedBox.shrink()),
                  loading: () {
                    return const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  },
                  success: (logs) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: logs.length,
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 8,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            children: [
                              Expanded(
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '${index + 1}. ',
                                        style: context.caption
                                            ?.copyWith(color: Colors.black54),
                                      ),
                                      TextSpan(
                                        text: logs[index].out.trim(),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  },
                  failure: (message) {
                    return Expanded(
                      child: DroneErrorWidget(
                        message: message,
                        onRetry: () => context.read<BuildLogBloc>().add(
                              const BuildLogEvent.started(),
                            ),
                      ),
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
