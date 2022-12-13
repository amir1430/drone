import 'package:drone/features/builds/bloc/builds_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class NewBuildDialog extends HookWidget {
  const NewBuildDialog({
    super.key,
    required this.homeBloc,
  });
  final BuildsBloc homeBloc;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: homeBloc,
      child: Builder(
        builder: (context) {
          return Dialog(
            child: Text(context.read<BuildsBloc>().state.toString()),
          );
        },
      ),
    );
  }
}
