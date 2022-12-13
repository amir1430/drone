import 'package:drone/core/core.dart';
import 'package:drone/features/login/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_input/form_input.dart';

class TokenTextField extends StatelessWidget {
  const TokenTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) =>
          previous.token.value != current.token.value,
      builder: (context, state) {
        return DroneTextField(
          onChange: context.read<LoginCubit>().tokenInputFieldChanged,
          label: 'Token',
          errorText: state.token.invalid ? TokenFieldError.invalid.text : null,
        );
      },
    );
  }
}
