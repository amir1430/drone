import 'package:auth_repository/auth_repository.dart';
import 'package:drone/core/core.dart';
import 'package:drone/features/login/cubit/login_cubit.dart';
import 'package:drone/features/login/widget/server_text_field.dart';
import 'package:drone/features/login/widget/token_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:formz/formz.dart';

class NewAccountDiolog extends HookWidget {
  const NewAccountDiolog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          LoginCubit(authRepository: context.read<AuthRepository>()),
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
        if (state.status == FormzStatus.submissionFailure) {
          // Navigator.of(context).pop();
          showDroneSnackbar(context, message: state.error!, isError: true);
        }
        //  else if (state.status == FormzStatus.submissionSuccess) {
        //   Navigator.of(context).pop();
        // }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Add new account',
                    style: context.headline4,
                  ),
                  const SizedBox(height: 32),
                  const ServerTextField(),
                  const SizedBox(height: 16),
                  const TokenTextField(),
                  const SizedBox(height: 14),
                  ElevatedButton(
                    onPressed: !state.status.isValidated
                        ? null
                        : () {
                            FocusScope.of(context).unfocus();

                            context.read<LoginCubit>().login(
                                  server: state.server.value,
                                  token: state.token.value,
                                );
                          },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(48),
                    ),
                    child: Text(
                      state.status == FormzStatus.submissionInProgress
                          ? 'Saving...'
                          : 'Save',
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
