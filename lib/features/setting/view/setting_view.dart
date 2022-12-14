import 'package:auth_repository/auth_repository.dart';
import 'package:drone/core/core.dart';
import 'package:drone/features/app/app.dart';
import 'package:drone/features/login/login.dart';
import 'package:drone/features/setting/bloc/setting_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_input/form_input.dart';
import 'package:formz/formz.dart';
import 'package:ionicons/ionicons.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingBloc(
        authRepository: context.read<AuthRepository>(),
      )..add(const SettingEvent.started()),
      // child: const _SettingBody(),
      child: const _SettingBody(),
    );
  }
}

class _SettingBody extends HookWidget {
  const _SettingBody();

  @override
  Widget build(BuildContext context) {
    final tokenController = useTextEditingController();
    final serverController = useTextEditingController();
    final nickNameController = useTextEditingController();

    return BlocListener<SettingBloc, SettingState>(
      listener: (context, state) {
        serverController.text = state.server.value;
        tokenController.text = state.token.value;
        nickNameController.text = state.nickName.value;

        if (state.status.isSubmissionFailure) {
          showDroneSnackbar(
            context,
            message: state.errorMessage ?? 'Somthig went wrong',
            isError: true,
          );
        }
      },
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DroneAppBar(
              title: BlocBuilder<AppBloc, AuthenticationStatus>(
                buildWhen: (previous, current) {
                  return previous.asAuthenticated!.currentUser !=
                      current.asAuthenticated!.currentUser;
                },
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: SizedBox.shrink,
                    authenticated: (users, currentUser) {
                      return SizedBox(
                        height: const DroneAppBar().preferredSize.height,
                        child: ListView.builder(
                          padding: const EdgeInsets.only(
                            // left: 18,
                            top: 2,
                            bottom: 2,
                          ),
                          itemCount: users.length + 1,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            if (index < users.length) {
                              final user = users[index];
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: UserTileWidget(
                                      color: Color(user.color),
                                      size: Size.square(
                                        const DroneAppBar()
                                                .preferredSize
                                                .height *
                                            .8,
                                      ),
                                      shape: user == currentUser
                                          ? RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            )
                                          : null,
                                      side: BorderSide(
                                        color: context.primaryColor
                                            .withOpacity(.2),
                                        width: user == currentUser ? 4 : 0,
                                      ),
                                      elevation: user == currentUser ? 3 : 2,
                                      child: Center(
                                        child: Text(
                                          user.nickName[0].toUpperCase(),
                                          style: context.headline2!
                                              .copyWith(color: Colors.white),
                                        ),
                                      ),
                                      // child: ClipRRect(
                                      //   child: Image.network(
                                      //     user.avatarUrl,
                                      //     fit: BoxFit.cover,
                                      //   ),
                                      // ),
                                      onTap: () {
                                        context.read<SettingBloc>().add(
                                              SettingEvent.changeUser(
                                                user: user,
                                                color: user.color,
                                              ),
                                            );
                                      },
                                    ),
                                  ),
                                ],
                              );
                            }
                            return IconBtn(
                              onPressed: () {
                                context
                                    .read<SettingBloc>()
                                    .add(const SettingEvent.addNewUser());
                              },
                              icon: Ionicons.add,
                            );
                          },
                        ),
                      );
                    },
                  );
                },
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: BlocBuilder<SettingBloc, SettingState>(
                    builder: (context, state) {
                      if (state.status == FormzStatus.valid) {
                        return IconBtn(
                          icon: state.status == FormzStatus.valid
                              ? Ionicons.checkmark
                              : Icons.abc,
                          onPressed: () {
                            final currentUser = context
                                .read<AppBloc>()
                                .state
                                .asAuthenticated!
                                .currentUser;

                            context.read<SettingBloc>().add(
                                  SettingEvent.updateUser(
                                    user: currentUser,
                                  ),
                                );
                          },
                        );
                      }
                      if (state.status == FormzStatus.submissionInProgress) {
                        return Transform.scale(
                          scale: .6,
                          child:
                              const CircularProgressIndicator(strokeWidth: 5),
                        );
                      }

                      return const SizedBox.shrink();
                    },
                  ),
                ),
              ],
            ),
            BlocBuilder<SettingBloc, SettingState>(
              builder: (context, state) {
                if (state.inNewUser) return const NewAccountDiolog();
                return Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    children: [
                      BlocBuilder<SettingBloc, SettingState>(
                        buildWhen: (previous, current) =>
                            previous.nickName != current.nickName,
                        builder: (context, state) {
                          return DroneTextField(
                            border: const UnderlineInputBorder(
                              borderSide: BorderSide(width: 2),
                            ),
                            color: Colors.transparent,
                            elevation: 0,
                            controller: nickNameController,
                            label: 'Nick name',
                            errorText: state.nickName.invalid
                                ? NickNameFieldError.invalid.name
                                : null,
                            onChange: (value) {
                              context
                                  .read<SettingBloc>()
                                  .add(SettingEvent.nickNameChanged(value));
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 12),
                      BlocBuilder<SettingBloc, SettingState>(
                        buildWhen: (previous, current) =>
                            previous.server != current.server,
                        builder: (context, state) {
                          return DroneTextField(
                            border: const UnderlineInputBorder(
                              borderSide: BorderSide(width: 2),
                            ),
                            color: Colors.transparent,
                            elevation: 0,
                            controller: serverController,
                            label: 'Server',
                            errorText: state.server.invalid
                                ? ServerFieldError.invalid.name
                                : null,
                            onChange: (value) {
                              context
                                  .read<SettingBloc>()
                                  .add(SettingEvent.serverChanged(value));
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 12),
                      BlocBuilder<SettingBloc, SettingState>(
                        buildWhen: (previous, current) =>
                            previous.token != current.token,
                        builder: (context, state) {
                          return DroneTextField(
                            color: Colors.transparent,
                            elevation: 0,
                            border: const UnderlineInputBorder(),
                            controller: tokenController,
                            label: 'Token',
                            errorText: state.token.invalid
                                ? TokenFieldError.invalid.name
                                : null,
                            onChange: (value) {
                              context
                                  .read<SettingBloc>()
                                  .add(SettingEvent.tokenChanged(value));
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 12),
                      ListTile(
                        title: const Text('Logout'),
                        leading: Icon(
                          Ionicons.log_out_outline,
                          color: context.iconColor,
                        ),
                        onTap: () {
                          final state =
                              context.read<AppBloc>().state.asAuthenticated;
                          showAlertDialog(
                            context,
                            title: 'Are you sure',
                            acceptText: 'Logout',
                            onAccept: () => context.read<SettingBloc>().add(
                                  SettingEvent.logoutRequested(
                                    user: state!.currentUser,
                                  ),
                                ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
