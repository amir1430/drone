import 'package:drone/core/core.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:repo_repository/repo_repository.dart';

class SimpleActivity extends StatelessWidget {
  const SimpleActivity(this._build, {super.key});

  final DroneBuild _build;
  @override
  Widget build(BuildContext context) {
    final event = _build.event;

    switch (event) {
      case Event.cron:
        return _CronActivity(
          avatar: _build.authorAvatar,
          cron: _build.cron ?? '',
          actor: _build.sender,
        );
      case Event.pullRequest:
        return _PullRequestActivity(
          avatar: _build.authorAvatar,
          actor: _build.sender,
          action: _build.action,
          ref: _build.ref,
          branch: _build.target,
        );
      case Event.tag:
        return _TagActivity(
          avatar: _build.authorAvatar,
          actor: _build.sender,
          ref: _build.ref,
        );

      case Event.promote:
        return _PromoteActivity(
          avatar: _build.authorAvatar,
          target: _build.deployTo ?? '',
          trigger: _build.trigger,
          parent: _build.parent,
          number: _build.number,
        );
      case Event.rollback:
        return _RollbackActivity(
          avatar: _build.authorAvatar,
          target: _build.deployTo ?? '',
          trigger: _build.trigger,
          number: _build.number,
          actor: _build.sender,
          parent: _build.parent,
        );
      case Event.push:
        return _PushActivity(
          avatar: _build.authorAvatar,
          commit: _build.after,
          branch: _build.target,
          actor: _build.sender,
        );
    }
  }
}

class _ActivityBtn extends StatelessWidget {
  const _ActivityBtn({
    required this.onPressed,
    required this.label,
    required this.icon,
  });

  final VoidCallback onPressed;
  final Widget label;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: 20,
      ),
      label: label,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 6,
          vertical: 2,
        ),
      ),
    );
  }
}

abstract class _ActivityBase extends StatelessWidget {
  const _ActivityBase({
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 8,
      runSpacing: 10,
      children: [...children],
    );
  }
}

class _PushActivity extends _ActivityBase {
  _PushActivity({
    required this.avatar,
    required this.commit,
    required this.branch,
    required this.actor,
  }) : super(
          children: [
            UserTileWidget(
              size: const Size.square(35),
              child: Image.network(avatar),
            ),
            Text('$actor pushed'),
            _ActivityBtn(
              onPressed: () {},
              icon: Ionicons.git_commit,
              label: Text(commit.subStr8),
            ),
            // const Text('to'),
            // _ActivityBtn(
            //   onPressed: () {},
            //   icon: Ionicons.git_branch,
            //   label: Text(branch),
            // ),
          ],
        );

  final String avatar;
  final String commit;
  final String branch;
  final String actor;
}

class _PullRequestActivity extends _ActivityBase {
  _PullRequestActivity({
    required this.avatar,
    required this.actor,
    required this.action,
    required this.ref,
    required this.branch,
  }) : super(
          children: [
            UserTileWidget(
              size: const Size.square(35),
              child: Image.network(avatar),
            ),
            Text(
              '$actor ${action == 'opened' ? 'opened' : 'synchronized'}'
              ' pull request',
            ),
            _ActivityBtn(
              onPressed: () {},
              icon: Ionicons.git_pull_request,
              label: Text('# ${ref.extractNumber}'),
            ),
            // const Text('to'),
            // _ActivityBtn(
            //   onPressed: () {},
            //   icon: Ionicons.git_branch,
            //   label: Text(branch),
            // ),
          ],
        );

  final String avatar;
  final String actor;
  final String action;
  final String ref;
  final String branch;
}

class _TagActivity extends _ActivityBase {
  _TagActivity({
    required this.avatar,
    required this.actor,
    required this.ref,
  }) : super(
          children: [
            UserTileWidget(
              size: const Size.square(35),
              child: Image.network(avatar),
            ),
            Text(
              '$actor created',
            ),
            _ActivityBtn(
              onPressed: () {},
              icon: Ionicons.pricetag,
              label: Text(
                ref.replaceAll('refs/heads/', '')..replaceAll('refs/tags/', ''),
              ),
            ),
          ],
        );

  final String avatar;
  final String actor;
  final String ref;
}

class _PromoteActivity extends _ActivityBase {
  _PromoteActivity({
    required this.avatar,
    required this.target,
    required this.trigger,
    required this.parent,
    required this.number,
  }) : super(
          children: [
            UserTileWidget(
              size: const Size.square(35),
              child: Image.network(avatar),
            ),
            Text(
              '$trigger promoted build',
            ),
            _ActivityBtn(
              onPressed: () {},
              icon: Icons.numbers_rounded,
              label: Text('$parent'),
            ),
            // const Text('to'),
            // _ActivityBtn(
            //   onPressed: () {},
            //   icon: Ionicons.cube,
            //   label: Text(target),
            // ),
          ],
        );

  final String avatar;
  final String target;
  final String trigger;
  final int parent;
  final int number;
}

class _RollbackActivity extends _ActivityBase {
  _RollbackActivity({
    required this.avatar,
    required this.target,
    required this.trigger,
    required this.number,
    required this.actor,
    required this.parent,
  }) : super(
          children: [
            UserTileWidget(
              size: const Size.square(35),
              child: Image.network(avatar),
            ),
            Text(
              '$actor rolled back',
            ),
            _ActivityBtn(
              onPressed: () {},
              icon: Ionicons.cube,
              label: Text(target),
            ),
            // const Text('to'),
            // _ActivityBtn(
            //   onPressed: () {},
            //   icon: Icons.numbers_rounded,
            //   label: Text('$parent'),
            // ),
          ],
        );

  final String avatar;
  final String target;
  final String trigger;
  final String actor;
  final int parent;
  final int number;
}

class _CronActivity extends _ActivityBase {
  _CronActivity({
    required this.avatar,
    required this.cron,
    required this.actor,
  }) : super(
          children: [
            UserTileWidget(
              size: const Size.square(35),
              child: Image.network(avatar),
            ),
            Text(
              '$actor executed scheduled task',
            ),
            // const Text('to'),
            // _ActivityBtn(
            //   onPressed: () {},
            //   icon: Icons.timer_outlined,
            //   label: Text(cron),
            // ),
          ],
        );

  final String avatar;
  final String cron;
  final String actor;
}
