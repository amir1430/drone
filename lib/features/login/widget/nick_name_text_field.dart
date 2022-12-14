import 'package:drone/core/core.dart';
import 'package:drone/features/login/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_input/form_input.dart';

class NickNameTextField extends StatelessWidget {
  const NickNameTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) =>
          previous.nickName.value != current.nickName.value,
      builder: (context, state) {
        return DroneTextField(
          onChange: context.read<LoginCubit>().nickNameInputFieldChanged,
          label: 'Nick Name',
          errorText:
              state.nickName.invalid ? NickNameFieldError.invalid.text : null,
        );
      },
    );
  }
}
