import 'package:drone/core/core.dart';
import 'package:drone/features/login/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_input/form_input.dart';

class TokenTextField extends StatelessWidget {
  const TokenTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<LoginCubit, LoginState, TokenField>(
      selector: (state) => state.token,
      builder: (context, token) {
        return DroneTextField(
          onChange: context.read<LoginCubit>().tokenInputFieldChanged,
          label: 'Token',
          errorText: token.displayError?.text,
        );
      },
    );
  }
}
