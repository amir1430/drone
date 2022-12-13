// import 'package:drone/core/core.dart';
// import 'package:drone/features/repos/bloc/repos_bloc.dart';
// import 'package:drone_dart/drone_dart.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';

// class ReposWithBuildView extends StatelessWidget {
//   const ReposWithBuildView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ReposBloc, ReposState>(
//       builder: (context, state) {
//         return state.when(
//           initial: SizedBox.shrink,
//           loading: () => const Center(
//             child: CircularProgressIndicator(),
//           ),
//           loaded: (repos) {
//             final reposWithBuild = repos.reposWithBuild;
//             return GridView.builder(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 12,
//                 mainAxisSpacing: 12,
//                 childAspectRatio: 1.2,
//               ),
//               itemCount: reposWithBuild.length,
//               itemBuilder: (BuildContext context, int index) {
//                 final repo = reposWithBuild[index];
//                 return RepoWidget(repo);
//               },
//             );
//           },
//           failure: (e) => Center(
//             child: Text(e),
//           ),
//         );
//       },
//     );
//   }
// }

// class RepoWidget extends StatelessWidget {
//   const RepoWidget(
//     this.repo, {
//     super.key,
//   });

//   final DroneRepo repo;
//   @override
//   Widget build(BuildContext context) {
//     final repoName = repo.name;
//     final namespace = repo.namespace;
//     final build = repo.build!;
//     final status = build.status;
//     final deployTo = build.deployTo;
//     final branch = build.target;
//     final target = deployTo ?? branch;
//     final startedAt = build.started;
//     final message = build.message;

//     return SquareBtn(
//       onPressed: () => context
//           .goNamed('repo', extra: repo, params: {'a': 'aaaa', 'b': 'bbbb'}),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Flexible(
//                   flex: 8,
//                   fit: FlexFit.tight,
//                   child: Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text.rich(
//                       TextSpan(
//                         children: [
//                           TextSpan(
//                             text: '$namespace/ \n',
//                             style: context.caption?.copyWith(height: 1.2),
//                           ),
//                           TextSpan(
//                             text: repoName,
//                             style: context.headline5?.copyWith(height: 1.2),
//                           ),
//                         ],
//                       ),
//                       overflow: TextOverflow.ellipsis,
//                       maxLines: 3,
//                     ),
//                   ),
//                 ),
//                 Flexible(
//                   child: Align(
//                     alignment: Alignment.topRight,
//                     child: status.buildStatusToIcon,
//                   ),
//                 )
//               ],
//             ),
//             const Spacer(),
//             Text(
//               message,
//               maxLines: 1,
//               style: context.caption!.copyWith(fontSize: 14),
//             ),
//             Row(
//               children: [
//                 Icon(
//                   target.targetToIcon(),
//                   size: 14,
//                   color: context.secondaryColor.withOpacity(.6),
//                 ),
//                 const SizedBox(width: 4),
//                 Expanded(
//                   // width: double.infinity,
//                   child: Text(
//                     '$target, ${startedAt.unixToHuman}',
//                     style: context.caption?.copyWith(
//                       fontSize: 12,
//                       fontWeight: FontWeight.w500,
//                     ),
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
