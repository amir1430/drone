import 'package:drone/core/core.dart';
import 'package:drone/features/login/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_input/form_input.dart';

class ServerTextField extends StatelessWidget {
  const ServerTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) =>
          previous.server.value != current.server.value,
      builder: (context, state) {
        return DroneTextField(
          onChange: context.read<LoginCubit>().serverInputFieldChanged,
          label: 'Server',
          errorText:
              state.server.invalid ? ServerFieldError.invalid.text : null,
        );
      },
    );
  }
}
