import 'package:drone/core/core.dart';
import 'package:drone/features/app/router.dart';
import 'package:drone_dart/drone_dart.dart';
import 'package:flutter/material.dart';

class RepoWidget extends StatelessWidget {
  const RepoWidget(
    this.repo, {
    super.key,
  });

  final DroneRepo repo;

  @override
  Widget build(BuildContext context) {
    final repoName = repo.name;
    final namespace = repo.namespace;
    final build = repo.build!;
    final status = build.status;
    final deployTo = build.deployTo;
    final branch = build.target;
    final target = deployTo ?? branch;
    final started = build.started;
    final message = build.message;

    return SquareBtn(
      onPressed: () =>
          RepoRoute(owner: namespace, repoName: repoName).push(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 8,
                  fit: FlexFit.tight,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '$namespace/ \n',
                            style: context.caption?.copyWith(height: 1.2),
                          ),
                          TextSpan(
                            text: repoName,
                            style: context.headline5?.copyWith(height: 1.2),
                          ),
                        ],
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ),
                ),
                Flexible(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Tooltip(
                      message: status.status,
                      child: status.toIcon,
                    ),
                  ),
                )
              ],
            ),
            const Spacer(),
            Text(
              message,
              maxLines: 1,
              style: context.caption!.copyWith(fontSize: 14),
            ),
            Row(
              children: [
                Icon(
                  target.targetToIcon(),
                  size: 14,
                  color: context.secondaryColor.withOpacity(.6),
                ),
                const SizedBox(width: 4),
                Expanded(
                  // width: double.infinity,
                  child: Text(
                    '$target, ${started.unixToHuman}',
                    style: context.caption?.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
