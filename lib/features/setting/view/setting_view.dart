// ignore_for_file: use_build_context_synchronously

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:drone/core/core.dart';
import 'package:drone/features/app/app.dart';
import 'package:drone/features/login/login.dart';
import 'package:drone/features/setting/bloc/setting_bloc.dart';
import 'package:drone/sl.dart';
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
    return BlocProvider<SettingBloc>(
      create: (context) => sl()..add(const SettingEvent.started()),
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

        if (state.status.isFailure) {
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
              title: BlocBuilder<AppBloc, AppState>(
                buildWhen: (previous, current) {
                  return previous.asAuthenticated!.currentUser !=
                      current.asAuthenticated!.currentUser;
                },
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: SizedBox.shrink,
                    authenticated: (users, currentUser, _) {
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
                      if (state.isValid) {
                        return IconBtn(
                          icon: Ionicons.checkmark,
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
                      if (state.status.isInProgress) {
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
                      BlocSelector<SettingBloc, SettingState, NickNameField>(
                        selector: (state) => state.nickName,
                        builder: (context, nickName) {
                          return DroneTextField(
                            color: Colors.transparent,
                            controller: nickNameController,
                            label: 'Nick name',
                            errorText: nickName.displayError?.text,
                            onChange: (value) {
                              context
                                  .read<SettingBloc>()
                                  .add(SettingEvent.nickNameChanged(value));
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 12),
                      BlocSelector<SettingBloc, SettingState, ServerField>(
                        selector: (state) => state.server,
                        builder: (context, server) {
                          return DroneTextField(
                            color: Colors.transparent,
                            controller: serverController,
                            label: 'Server',
                            errorText: server.displayError?.text,
                            onChange: (value) {
                              context
                                  .read<SettingBloc>()
                                  .add(SettingEvent.serverChanged(value));
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 12),
                      BlocSelector<SettingBloc, SettingState, TokenField>(
                        selector: (state) => state.token,
                        builder: (context, token) {
                          return DroneTextField(
                            color: Colors.transparent,
                            controller: tokenController,
                            label: 'Token',
                            errorText: token.displayError?.text,
                            onChange: (value) {
                              context
                                  .read<SettingBloc>()
                                  .add(SettingEvent.tokenChanged(value));
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 12),
                      BlocSelector<SettingBloc, SettingState, bool>(
                        selector: (state) {
                          return state.isNotificationEnable;
                        },
                        builder: (context, value) {
                          return SwitchListTile(
                            title: const Text('Enable Notifications'),
                            value: value,
                            onChanged: (v) {
                              context.read<SettingBloc>().add(
                                    SettingEvent.changeIsNotificationEnable(
                                      value: !value,
                                    ),
                                  );

                              if (!value) {
                                handlePermissionToSendNotifications(context);
                              }
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

Future<void> handlePermissionToSendNotifications(
  BuildContext context,
) async {
  const channelKey = AppConstants.channelKey;
  final permissionList = <NotificationPermission>[
    NotificationPermission.Alert,
    NotificationPermission.Light,
    NotificationPermission.Provisional,
    NotificationPermission.Sound,
  ];

  var permissionsAllowed = await AwesomeNotifications().checkPermissionList(
    channelKey: channelKey,
    permissions: permissionList,
  );

  if (permissionsAllowed.length == permissionList.length) return;

  final permissionsNeeded =
      permissionList.toSet().difference(permissionsAllowed.toSet()).toList();

  final lockedPermissions =
      await AwesomeNotifications().shouldShowRationaleToRequest(
    channelKey: channelKey,
    permissions: permissionsNeeded,
  );

  if (lockedPermissions.isEmpty) {
    // Request the permission through native resources.
    await AwesomeNotifications().requestPermissionToSendNotifications(
      channelKey: channelKey,
      permissions: permissionsNeeded,
    );

    permissionsAllowed = await AwesomeNotifications().checkPermissionList(
      channelKey: channelKey,
      permissions: permissionsNeeded,
    );
  } else {
    await showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xfffbfbfb),
        title: const Text(
          'Required notification permission',
          textAlign: TextAlign.center,
          maxLines: 2,
          style: TextStyle(fontSize: 22),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              lockedPermissions
                  .join(', ')
                  .replaceAll('NotificationPermission.', ''),
              maxLines: 2,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Deny',
              style: TextStyle(fontSize: 18),
            ),
          ),
          TextButton(
            onPressed: () async {
              await AwesomeNotifications().requestPermissionToSendNotifications(
                channelKey: channelKey,
                permissions: lockedPermissions,
              );

              permissionsAllowed =
                  await AwesomeNotifications().checkPermissionList(
                channelKey: channelKey,
                permissions: lockedPermissions,
              );

              Navigator.pop(context);
            },
            child: const Text(
              'Allow',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
