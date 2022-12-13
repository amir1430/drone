import 'package:drone/core/core.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:repo_repository/repo_repository.dart';

// TODO: refactor to builder pattern

class SimpleActivity extends StatelessWidget {
  const SimpleActivity(this._build, {super.key});

  final DroneBuild _build;
  @override
  Widget build(BuildContext context) {
    final number = _build.number;
    final event = _build.event;
    final action = _build.action;
    final actor = _build.sender;
    final avatar = _build.authorAvatar;
    final commit = _build.after;
    final branch = _build.target;
    final target = _build.deployTo;
    final cron = _build.cron;
    final parent = _build.parent;
    final ref = _build.ref;
    final trigger = _build.trigger;

    if (event == Event.cron) {
      return _CronActivity(
        avatar: avatar,
        cron: cron ?? '',
        actor: actor,
      );
    }
    if (event == Event.promote) {
      return _PromoteActivity(
        avatar: avatar,
        target: target ?? '',
        trigger: trigger,
        parent: parent,
        number: number,
      );
    }
    if (event == Event.pullRequest) {
      return _PullRequestActivity(
        avatar: avatar,
        actor: actor,
        action: action,
        ref: ref,
        branch: branch,
      );
    }
    if (event == Event.rollback) {
      return _RollbackActivity(
        avatar: avatar,
        target: target ?? '',
        trigger: trigger,
        number: number,
        actor: actor,
        parent: parent,
      );
    }
    if (event == Event.tag) {
      return _TagActivity(avatar: avatar, actor: actor, ref: ref);
    }
    return _PushActivity(
      avatar: avatar,
      commit: commit,
      branch: branch,
      actor: actor,
    );
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

class _PushActivity extends StatelessWidget {
  const _PushActivity({
    required this.avatar,
    required this.commit,
    required this.branch,
    required this.actor,
  });

  final String avatar;
  final String commit;
  final String branch;
  final String actor;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      runSpacing: 8,
      children: [
        UserTileWidget(
          size: const Size.square(35),
          child: Image.network(avatar),
        ),
        const SizedBox(width: 6),
        Text('$actor pushed'),
        const SizedBox(width: 6),
        _ActivityBtn(
          onPressed: () {},
          icon: Ionicons.git_commit,
          label: Text(commit.subStr8),
        ),
        const SizedBox(width: 6),
        const Text('to'),
        const SizedBox(width: 6),
        _ActivityBtn(
          onPressed: () {},
          icon: Ionicons.git_branch,
          label: Text(branch),
        ),
      ],
    );
  }
}

class _PullRequestActivity extends StatelessWidget {
  const _PullRequestActivity({
    required this.avatar,
    required this.actor,
    required this.action,
    required this.ref,
    required this.branch,
  });

  final String avatar;
  final String actor;
  final String action;
  final String ref;
  final String branch;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      runSpacing: 8,
      children: [
        UserTileWidget(
          size: const Size.square(35),
          child: Image.network(avatar),
        ),
        const SizedBox(width: 6),
        Text(
          '$actor ${action == 'opened' ? 'opened' : 'synchronized'} pull request',
        ),
        const SizedBox(width: 6),
        _ActivityBtn(
          onPressed: () {},
          icon: Ionicons.git_pull_request,
          label: Text('# ${ref.extractNumber}'),
        ),
        const SizedBox(width: 6),
        const Text('to'),
        const SizedBox(width: 6),
        _ActivityBtn(
          onPressed: () {},
          icon: Ionicons.git_branch,
          label: Text(branch),
        ),
      ],
    );
  }
}

class _TagActivity extends StatelessWidget {
  const _TagActivity({
    required this.avatar,
    required this.actor,
    required this.ref,
  });

  final String avatar;
  final String actor;
  final String ref;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      runSpacing: 8,
      children: [
        UserTileWidget(
          size: const Size.square(35),
          child: Image.network(avatar),
        ),
        const SizedBox(width: 6),
        Text(
          '$actor created',
        ),
        const SizedBox(width: 6),
        _ActivityBtn(
          onPressed: () {},
          icon: Ionicons.pricetag,
          label: Text(
            ref.replaceAll('refs/heads/', '')..replaceAll('refs/tags/', ''),
          ),
        ),
      ],
    );
  }
}

class _PromoteActivity extends StatelessWidget {
  const _PromoteActivity({
    required this.avatar,
    required this.target,
    required this.trigger,
    required this.parent,
    required this.number,
  });

  final String avatar;
  final String target;
  final String trigger;
  final int parent;
  final int number;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      runSpacing: 8,
      children: [
        UserTileWidget(
          size: const Size.square(35),
          child: Image.network(avatar),
        ),
        const SizedBox(width: 6),
        Text(
          '$trigger promoted build',
        ),
        const SizedBox(width: 6),
        _ActivityBtn(
          onPressed: () {},
          icon: Icons.numbers_rounded,
          label: Text('$parent'),
        ),
        const SizedBox(width: 6),
        const Text('to'),
        const SizedBox(width: 6),
        _ActivityBtn(
          onPressed: () {},
          icon: Ionicons.cube,
          label: Text(target),
        ),
      ],
    );
  }
}

class _RollbackActivity extends StatelessWidget {
  const _RollbackActivity({
    required this.avatar,
    required this.target,
    required this.trigger,
    required this.number,
    required this.actor,
    required this.parent,
  });

  final String avatar;
  final String target;
  final String trigger;
  final String actor;
  final int parent;
  final int number;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      runSpacing: 8,
      children: [
        UserTileWidget(
          size: const Size.square(35),
          child: Image.network(avatar),
        ),
        const SizedBox(width: 6),
        Text(
          '$actor rolled back',
        ),
        const SizedBox(width: 6),
        _ActivityBtn(
          onPressed: () {},
          icon: Ionicons.cube,
          label: Text(target),
        ),
        const SizedBox(width: 6),
        const Text('to'),
        const SizedBox(width: 6),
        _ActivityBtn(
          onPressed: () {},
          icon: Icons.numbers_rounded,
          label: Text('$parent'),
        ),
      ],
    );
  }
}

class _CronActivity extends StatelessWidget {
  const _CronActivity({
    required this.avatar,
    required this.cron,
    required this.actor,
  });

  final String avatar;
  final String cron;
  final String actor;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      runSpacing: 8,
      children: [
        UserTileWidget(
          size: const Size.square(35),
          child: Image.network(avatar),
        ),
        const SizedBox(width: 6),
        Text(
          '$actor executed scheduled task',
        ),
        const SizedBox(width: 6),
        const Text('to'),
        const SizedBox(width: 6),
        _ActivityBtn(
          onPressed: () {},
          icon: Icons.timer_outlined,
          label: Text(cron),
        ),
      ],
    );
  }
}
