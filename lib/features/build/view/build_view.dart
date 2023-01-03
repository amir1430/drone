import 'package:drone/core/core.dart';
import 'package:drone/features/app/router.dart';
import 'package:drone/features/build/build.dart';
import 'package:drone/sl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:repo_repository/repo_repository.dart';

class BuildView extends HookWidget {
  const BuildView({
    super.key,
    required this.name,
    required this.owner,
    required this.number,
  });

  final String name;
  final String owner;
  final int number;

  @override
  Widget build(BuildContext context) {
    final animCont =
        useAnimationController(duration: const Duration(milliseconds: 500));
    final x = Tween<double>(begin: 0, end: 60).animate(animCont);
    final w = useAnimation(x);

    return BlocProvider<BuildBloc>(
      create: (context) => sl()
        ..add(BuildEvent.started(number: number, owner: owner, repoName: name)),
      child: BlocListener<BuildBloc, BuildState>(
        listener: (context, state) {
          state.whenOrNull(
            success: (_) => animCont.forward(),
          );
        },
        child: Builder(
          builder: (context) {
            return Scaffold(
              appBar: DroneAppBar(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name),
                    Text(
                      '# $number',
                      style: context.caption,
                    ),
                  ],
                ),
                // title: ListTile(
                //   title: Text(name),
                //   subtitle: Text('# '),
                // ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(w),
                  child: BlocBuilder<BuildBloc, BuildState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: SizedBox.new,
                        success: (build) {
                          String _printDuration(Duration duration) {
                            String oneDigits(int n) =>
                                n.toString().padLeft(1, '0');
                            final min =
                                oneDigits(duration.inMinutes.remainder(60));
                            final sec =
                                oneDigits(duration.inSeconds.remainder(60));
                            return '${min}m ${sec}s';
                          }

                          final created = DateTime.fromMillisecondsSinceEpoch(
                            build.created * 1000,
                          );
                          final finished = DateTime.fromMillisecondsSinceEpoch(
                            build.finished * 1000,
                          );

                          final diff = finished.difference(created);

                          final formattedCreated =
                              DateFormat('MMM d, yyyy, hh:mm a')
                                  .format(created);
                          return Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(
                                  Ionicons.time_outline,
                                  color: context.theme.colorScheme.primary,
                                ),
                                const SizedBox(width: 4),
                                Text(_printDuration(diff)),
                                const SizedBox(width: 12),
                                Icon(
                                  Ionicons.calendar_outline,
                                  color: context.theme.colorScheme.primary,
                                ),
                                const SizedBox(width: 4),
                                Text(formattedCreated),
                                const SizedBox(width: 8),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: BlocBuilder<BuildBloc, BuildState>(
                      builder: (context, state) {
                        return state.when(
                          initial: SizedBox.shrink,
                          loading: () {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                          failure: (e) => DroneErrorWidget(
                            message: e,
                            onRetry: () {
                              context.read<BuildBloc>().add(
                                    BuildEvent.started(
                                      owner: owner,
                                      repoName: name,
                                      number: number,
                                    ),
                                  );
                            },
                          ),
                          success: (build) {
                            return ListView.builder(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              itemCount: build.stages.length,
                              itemBuilder: (BuildContext context, int index) {
                                final stage = build.stages[index];
                                final steps = stage.steps;

                                final time = TimeFormatter.unixDifferenceToMmSs(
                                  end: stage.stopped,
                                  start: stage.started,
                                );
                                return ExpansionTile(
                                  leading: stage.status.toIcon,
                                  trailing: Text(time),
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  tilePadding:
                                      const EdgeInsets.fromLTRB(12, 12, 12, 0),
                                  title: Text(stage.name),
                                  childrenPadding: const EdgeInsets.only(
                                    left: 12,
                                    top: 8,
                                    bottom: 8,
                                  ),
                                  children: [
                                    ...steps.map((step) {
                                      final time =
                                          TimeFormatter.unixDifferenceToMmSs(
                                        end: step.stopped,
                                        start: step.started,
                                      );

                                      return ListTile(
                                        title: Text(step.name),
                                        leading: step.status.toIcon,
                                        trailing: Text(time),
                                        onTap: () {
                                          if (step.status ==
                                              DroneStatus.skipped) {
                                            return;
                                          }
                                          final location = GoRouter.of(context)
                                              .location
                                              .split('/');
                                          final owner = location[2];
                                          final repoName = location[3];
                                          LogRoute(
                                            owner: owner,
                                            repoName: repoName,
                                            number: number,
                                            stageName: stage.name,
                                            stageNum: '${stage.number}',
                                            stepName: step.name,
                                            stepNum: '${step.number}',
                                          ).push(context);
                                        },
                                      );
                                    })
                                  ],
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
