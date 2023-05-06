import 'package:drone/core/core.dart';
import 'package:drone/features/login/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_input/form_input.dart';

class ServerTextField extends StatelessWidget {
  const ServerTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<LoginCubit, LoginState, ServerField>(
      selector: (state) => state.server,
      builder: (context, server) {
        return DroneTextField(
          onChange: context.read<LoginCubit>().serverInputFieldChanged,
          label: 'Server',
          errorText: server.displayError?.text,
        );
      },
    );
  }
}
