import 'package:drone/features/login/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return ElevatedButton(
          onPressed: !state.status.isValidated
              ? null
              : () {
                  FocusScope.of(context).unfocus();

                  context.read<LoginCubit>().login();
                },
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(48),
          ),
          child: Text(
            state.status == FormzStatus.submissionInProgress
                ? 'Loading ...'
                : 'Login',
          ),
        );
      },
    );
  }
}
