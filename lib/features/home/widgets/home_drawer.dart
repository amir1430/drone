import 'package:drone/core/core.dart';
import 'package:drone/features/app/router.dart';
import 'package:drone/features/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: context.backgroundColor,
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(
              vertical: 14,
              horizontal: 8,
            ),
            sliver: SliverToBoxAdapter(
              child: ListTile(
                title: Text(
                  'Repositories',
                  style:
                      context.headline5?.copyWith(fontWeight: FontWeight.bold),
                ),
                trailing: BlocSelector<HomeBloc, HomeState, DrawerFilter>(
                  selector: (state) => state.filter,
                  builder: (context, state) {
                    return DropdownButton<DrawerFilter>(
                      value: state,
                      items: [
                        ...DrawerFilter.values.map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(e.name),
                          ),
                        )
                      ],
                      onChanged: (v) => context
                          .read<HomeBloc>()
                          .add(HomeEvent.filterChanged(filter: v!)),
                    );
                    // return Column(
                    //   children: [
                    //     ...DrawerFilter.values.map(
                    //       (e) => RadioListTile<DrawerFilter>(
                    //         title: Text(e.name),
                    //         value: e,
                    //         groupValue: state,
                    // onChanged: (v) => context
                    //     .read<HomeBloc>()
                    //     .add(HomeEvent.filterChanged(filter: v!)),
                    //       ),
                    //     )
                    //   ],
                    // );
                  },
                ),
              ),
              // child: Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Text(
              //       'Repositories',
              //       style: context.headline5
              //           ?.copyWith(fontWeight: FontWeight.bold),
              //     ),
              //     BlocSelector<HomeBloc, HomeState, DrawerFilter>(
              //       selector: (state) => state.filter,
              //       builder: (context, state) {
              //         return Column(
              //           children: [
              //             ...DrawerFilter.values.map(
              //               (e) => RadioListTile<DrawerFilter>(
              //                 title: Text(e.name),
              //                 value: e,
              //                 groupValue: state,
              //                 onChanged: (v) => context
              //                     .read<HomeBloc>()
              //                     .add(HomeEvent.filterChanged(filter: v!)),
              //               ),
              //             )
              //           ],
              //         );
              //       },
              //     )
              //   ],
              // ),
            ),
          ),
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final repo = state.drawerRepos[index];
                    return ListTile(
                      title: Text(
                        repo.slug,
                        maxLines: 2,
                        overflow: TextOverflow.clip,
                      ),
                      leading: repo.build == null
                          ? const Icon(Icons.minimize_outlined)
                          : repo.build!.status.buildStatusToIcon,
                      onTap: () {
                        RepoRoute(owner: repo.namespace, repoName: repo.name)
                            .push(context);
                      },
                    );
                  },
                  childCount: state.drawerRepos.length,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
