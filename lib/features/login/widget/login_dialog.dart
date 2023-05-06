import 'package:drone/core/core.dart';
import 'package:drone/features/login/cubit/login_cubit.dart';
import 'package:drone/features/login/widget/nick_name_text_field.dart';
import 'package:drone/features/login/widget/server_text_field.dart';
import 'package:drone/features/login/widget/submit_button.dart';
import 'package:drone/features/login/widget/token_text_field.dart';
import 'package:drone/sl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:formz/formz.dart';

class NewAccountDiolog extends HookWidget {
  const NewAccountDiolog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => sl(),
      child: const _NewAccountDiolog(),
    );
  }
}

class _NewAccountDiolog extends HookWidget {
  const _NewAccountDiolog();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status == FormzSubmissionStatus.failure) {
          showDroneSnackbar(context, message: state.error!, isError: true);
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SizedBox(height: 32),
              ServerTextField(),
              SizedBox(height: 16),
              TokenTextField(),
              SizedBox(height: 16),
              NickNameTextField(),
              SizedBox(height: 14),
              SubmitButton()
            ],
          ),
        ),
      ),
    );
  }
}
