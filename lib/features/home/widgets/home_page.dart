import 'package:auth_repository/auth_repository.dart';
import 'package:drone/core/core.dart';
import 'package:drone/features/app/app.dart';
import 'package:drone/features/app/router.dart';
import 'package:drone/features/home/home.dart';
import 'package:drone/features/home/widgets/sync_repos_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = useTextEditingController();

    return BlocListener<AppBloc, AppState>(
      listener: (_, state) {
        state.mapOrNull(
          authenticated: (_) {
            searchController.clear();
          },
        );
      },
      child: Column(
        children: [
          DroneAppBar(
            title: DroneTextField(
              elevation: 0,
              label: 'search',
              controller: searchController,
              color: context.theme.scaffoldBackgroundColor.withOpacity(.3),
              onChange: (value) => context
                  .read<HomeBloc>()
                  .add(HomeEvent.onSearched(value: value)),
            ),
            leading: IconBtn(
              color: context.secondaryColor,
              icon: Ionicons.grid_outline,
              toolTip: 'Repositories',
              onPressed: () => context.openDrawer,
            ),
            actions: [
              const SyncReposBtn(),
              BlocBuilder<AppBloc, AppState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: SizedBox.shrink,
                    authenticated: (users, current, _) => Padding(
                      padding: const EdgeInsets.all(8),
                      child: UserTileWidget(
                        size: const Size.square(40),
                        color: Color(current.color),
                        elevation: 4,
                        child: Center(
                          child: Text(
                            current.nickName[0].toUpperCase(),
                            style: context.headline2!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                        onTap: () => SettingsRoute().push(context),
                        // onTap: () => context.toDialog(
                        //   child: const SettingView(),
                        // ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          Expanded(
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state.status == HomeStatus.initial) {
                  return const SizedBox.shrink();
                }
                if (state.status == HomeStatus.loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state.status == HomeStatus.failure) {
                  return DroneErrorWidget(
                    message: state.failureMessage!,
                    onRetry: () =>
                        context.read<HomeBloc>().add(const HomeEvent.started()),
                  );
                }
                final reposWithBuild = state.homeRepos.reposWithBuild;
                return RefreshIndicator(
                  onRefresh: () async {
                    context.read<HomeBloc>().add(const HomeEvent.started());
                    return;
                  },
                  child: GridView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 1.2,
                    ),
                    itemCount: reposWithBuild.length,
                    itemBuilder: (BuildContext context, int index) {
                      final repo = reposWithBuild[index];
                      return RepoWidget(repo);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
