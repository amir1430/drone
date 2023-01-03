import 'package:drone/core/core.dart';
import 'package:drone/core/widgets/simple_activity.dart';
import 'package:drone/features/app/router.dart';
import 'package:drone/features/builds/builds.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:repo_repository/repo_repository.dart';

class BuildsView extends StatelessWidget {
  const BuildsView({
    super.key,
    required this.owner,
    required this.repoName,
  });

  final String owner;
  final String repoName;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Scaffold(
          body: BlocConsumer<BuildsBloc, BuildsState>(
            listener: (context, state) {
              if (state.status == Status.failure) {
                showDroneSnackbar(
                  context,
                  message: 'Somthing went wrong.',
                  isError: true,
                );
              }
            },
            builder: (context, state) {
              if (state.status == Status.loading) {
                return const Center(child: CircularProgressIndicator());
              }

              return _BuildsView(
                builds: state.builds,
                owner: owner,
                repoName: repoName,
              );
              // if (state.status == Status.failure) {
              //   return DroneErrorWidget(
              //     message: 'Somthing went wrong',
              //     onRetry: () => context.read<BuildsBloc>().add(
              //           BuildsEvent.started(
              //             owner: owner,
              //             repoName: repoName,
              //           ),
              //         ),
              //   );
              // }
            },
          ),
        );
      },
    );
  }
}

class _BuildsView extends StatelessWidget {
  const _BuildsView({
    required this.builds,
    required this.owner,
    required this.repoName,
  });

  final List<DroneBuild> builds;
  final String owner;
  final String repoName;
  @override
  Widget build(BuildContext context) {
    if (builds.isEmpty) {
      return const Center(child: Text('No builds'));
    }
    return RefreshIndicator(
      onRefresh: () async {
        context
            .read<BuildsBloc>()
            .add(BuildsEvent.started(owner: owner, repoName: repoName));
        return;
      },
      child: CustomScrollView(
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(12),
            sliver: SliverToBoxAdapter(
              child: SizedBox(
                height: 200,
                child: Row(
                  children: [
                    Flexible(
                      flex: 4,
                      child: Material(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: BlocSelector<BuildsBloc, BuildsState,
                              List<DroneBuild>>(
                            selector: (state) {
                              return [
                                ...state.builds
                                    .sublist(
                                      0,
                                      builds.length <= 20 ? builds.length : 20,
                                    )
                                    .reversed
                              ];
                            },
                            builder: (context, latestBuilds) {
                              return DroneBarChart(
                                builds: [...latestBuilds],
                                callBack: (index) {
                                  final build = latestBuilds[index];
                                  BuildRotue(
                                    owner: owner,
                                    repoName: repoName,
                                    number: build.number,
                                  ).push(context);
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Flexible(
                      flex: 2,
                      child: Column(
                        children: [
                          Expanded(
                            child: Material(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              elevation: 4,
                              child: Center(
                                child: ListTile(
                                  title: Text(
                                    'Last status',
                                    style:
                                        context.caption!.copyWith(fontSize: 12),
                                  ),
                                  subtitle: BlocSelector<BuildsBloc,
                                      BuildsState, DroneStatus>(
                                    selector: (state) {
                                      return state.latestBuild.status;
                                    },
                                    builder: (context, status) {
                                      return Text(
                                        status.status,
                                        style: context.headline2!
                                            .copyWith(color: status.color),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Expanded(
                            child: Material(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              elevation: 4,
                              child: Center(
                                child: ListTile(
                                  title: Text(
                                    'Last status',
                                    style:
                                        context.caption!.copyWith(fontSize: 14),
                                  ),
                                  subtitle: BlocSelector<BuildsBloc,
                                      BuildsState, DroneStatus>(
                                    selector: (state) {
                                      return state.latestBuild.status;
                                    },
                                    builder: (context, status) {
                                      return Text(
                                        status.status,
                                        style: context.headline2!.copyWith(),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final build = builds[index];

                  return ListTile(
                    onTap: () {
                      final location = GoRouter.of(context).location.split('/');
                      final owner = location[2];
                      final repoName = location[3];
                      BuildRotue(
                        owner: owner,
                        repoName: repoName,
                        number: build.number,
                      ).push(context);
                    },
                    title: Row(
                      children: [
                        Expanded(
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: '# ${build.number}.',
                                  style: context.caption,
                                ),
                                TextSpan(
                                  text: build.message.trim(),
                                ),
                              ],
                            ),
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                    trailing: Tooltip(
                      message: build.status.status,
                      child: build.status.toIcon,
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const SizedBox(height: 4),
                        SimpleActivity(build),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            Icon(
                              build.deployTo == null
                                  ? build.target.targetToIcon()
                                  : build.deployTo!.targetToIcon(),
                              size: 14,
                              color: context.secondaryColor.withOpacity(.6),
                            ),
                            const SizedBox(width: 3),
                            Text(
                              '${build.deployTo ?? build.target},'
                              ' ${build.started.unixToHuman}',
                              style: context.caption?.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
                childCount: builds.length,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(
              vertical: 6,
              horizontal: 12,
            ),
            sliver: SliverToBoxAdapter(
              child: BlocBuilder<BuildsBloc, BuildsState>(
                buildWhen: (previous, current) =>
                    previous.isLoadingMore != current.isLoadingMore,
                builder: (context, state) {
                  if (state.isReachedMax) {
                    return const SizedBox.shrink();
                  }
                  return TextButton(
                    onPressed: state.isLoadingMore
                        ? null
                        : () {
                            context.read<BuildsBloc>().add(
                                  BuildsEvent.loadMoreBuilds(
                                    owner: owner,
                                    repoName: repoName,
                                  ),
                                );
                          },
                    child:
                        Text(state.isLoadingMore ? 'Loading...' : 'Show more'),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
