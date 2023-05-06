import 'package:drone/core/core.dart';
import 'package:drone/features/login/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_input/form_input.dart';

class NickNameTextField extends StatelessWidget {
  const NickNameTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<LoginCubit, LoginState, NickNameField>(
      selector: (state) => state.nickName,
      builder: (context, nickName) {
        return DroneTextField(
          onChange: context.read<LoginCubit>().nickNameInputFieldChanged,
          label: 'Nick Name',
          errorText: nickName.displayError?.text,
        );
      },
    );
  }
}
