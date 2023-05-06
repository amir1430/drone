import 'package:drone/features/login/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed: state.status.isInProgress || state.isNotValid
              ? null
              : () {
                  FocusScope.of(context).unfocus();
                  context.read<LoginCubit>().login();
                },
          child: Text(
            state.status.isInProgress ? 'Loading ...' : 'Login',
          ),
        );
      },
    );
  }
}
