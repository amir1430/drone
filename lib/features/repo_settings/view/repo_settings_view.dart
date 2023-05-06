import 'package:drone/core/core.dart';
import 'package:drone/features/repo_settings/bloc/repo_setting_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:repo_repository/repo_repository.dart' as drone;

class SettingsView extends StatelessWidget {
  const SettingsView({
    super.key,
    required this.owner,
    required this.repoName,
  });

  final String owner;
  final String repoName;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RepoSettingsBloc, RepoSettingsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const Center(child: CircularProgressIndicator()),
          success: (repo) {
            if (!repo.active) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // const Text('Active repo first.'),
                    // const SizedBox(height: 12,),
                    if (repo.permissions != null && !repo.permissions!.admin)
                      const Text(
                        'Please contact the repository'
                        ' administrator to activate this repository.',
                      ),
                    if (repo.permissions != null && repo.permissions!.admin)
                      TextButton(
                        onPressed: () {
                          context.read<RepoSettingsBloc>().add(
                                RepoSettingsEvent.activeRepoRequested(
                                  owner: owner,
                                  repoName: repoName,
                                ),
                              );
                        },
                        child: const Text('Active repository'),
                      ),
                  ],
                ),
              );
            }
            return RepoSettingsBody(
              repo: repo,
              owner: owner,
              repoName: repoName,
            );
          },
          failure: (message) {
            return DroneErrorWidget(
              message: message,
              onRetry: () => context.read<RepoSettingsBloc>().add(
                    RepoSettingsEvent.started(
                      owner: owner,
                      repoName: repoName,
                    ),
                  ),
            );
          },
        );
      },
    );
  }
}

class RepoSettingsBody extends StatelessWidget {
  const RepoSettingsBody({
    super.key,
    required this.repo,
    required this.owner,
    required this.repoName,
  });

  final drone.DroneRepo repo;
  final String owner;
  final String repoName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ListView(
        children: [
          // Text(repo.toString()),
          const Text('Project Webhooks'),
          SwitchListTile(
            value: repo.ignorePullRequests,
            title: const Text('Disable Pull Requests'),
            onChanged: (_) => context.read<RepoSettingsBloc>().add(
                  const RepoSettingsEvent.disablePullRequestClicked(),
                ),
          ),
          SwitchListTile(
            value: repo.ignoreForks,
            title: const Text('Disable forks'),
            onChanged: (_) => context.read<RepoSettingsBloc>().add(
                  const RepoSettingsEvent.disableForksClicked(),
                ),
          ),
          const SizedBox(height: 12),
          const Text('Project Settings'),
          SwitchListTile(
            value: repo.protected,
            title: const Text('Protected'),
            onChanged: (_) => context.read<RepoSettingsBloc>().add(
                  const RepoSettingsEvent.changeProtectedClicked(),
                ),
          ),
          // if (repo.permissions!.admin)
          SwitchListTile(
            value: repo.trusted,
            title: const Text('Trusted'),
            onChanged: (_) => context.read<RepoSettingsBloc>().add(
                  const RepoSettingsEvent.changeTrustedClicked(),
                ),
          ),
          // if (repo.permissions!.admin)
          SwitchListTile(
            value: repo.autoCancelPullRequests,
            title: const Text('Auto cancel pull requests'),
            onChanged: (_) => context.read<RepoSettingsBloc>().add(
                  const RepoSettingsEvent.changeAutoCancelPullRequestsClicked(),
                ),
          ),
          // if (repo.permissions!.admin)
          SwitchListTile(
            value: repo.autoCancelPushes,
            title: const Text('Auto cancel pushes'),
            onChanged: (_) => context.read<RepoSettingsBloc>().add(
                  const RepoSettingsEvent.changeAutoCancelPushesClicked(),
                ),
          ),
          const Text('Project Visibility'),
          RadioListTile<drone.Visibility>(
            title: const Text('Private'),
            value: drone.Visibility.private,
            groupValue: repo.visibility,
            onChanged: (v) => context.read<RepoSettingsBloc>().add(
                  RepoSettingsEvent.changeVisibilityClicked(
                    visibility: v!,
                  ),
                ),
          ),
          RadioListTile<drone.Visibility>(
            title: const Text('Public'),
            value: drone.Visibility.public,
            groupValue: repo.visibility,
            onChanged: (v) => context.read<RepoSettingsBloc>().add(
                  RepoSettingsEvent.changeVisibilityClicked(
                    visibility: v!,
                  ),
                ),
          ),
          RadioListTile<drone.Visibility>(
            title: const Text('Internal'),
            value: drone.Visibility.internal,
            groupValue: repo.visibility,
            onChanged: (v) => context.read<RepoSettingsBloc>().add(
                  RepoSettingsEvent.changeVisibilityClicked(
                    visibility: v!,
                  ),
                ),
          ),
          TextFormField(
            initialValue: repo.configPath,
            onChanged: (value) => context
                .read<RepoSettingsBloc>()
                .add(RepoSettingsEvent.configPathChanged(value: value)),
            decoration: const InputDecoration(labelText: 'Configuration'),
          ),
          DropdownButton<Timeout>(
            value: repo.timeout.toTimeout,
            items: [
              ...Timeout.values.map(
                (e) => DropdownMenuItem(
                  value: e,
                  child: Text(e.text),
                ),
              )
            ],
            onChanged: (timeout) => context
                .read<RepoSettingsBloc>()
                .add(RepoSettingsEvent.changeTimeout(timeout: timeout!)),
          ),
          const SizedBox(height: 12),
          BlocListener<RepoSettingsBloc, RepoSettingsState>(
            // listenWhen: (previous, current) =>
            //     current.maybeWhen(failure: (_) => true, orElse: () => false),
            listener: (context, state) {
              // state.whenOrNull(
              //   failure: (message) => showDroneSnackbar(
              //     context,
              //     isError: true,
              //     message: message,
              //   ),
              //   success: (repo) => showDroneSnackbar(
              //     context,
              //     message: 'Changes have been saved.',
              //   ),
              // );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => context.read<RepoSettingsBloc>().add(
                        RepoSettingsEvent.updateRepoRequested(
                          owner: owner,
                          repoName: repoName,
                        ),
                      ),
                  child: const Text('Save Changes'),
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(foregroundColor: Colors.red),
                  icon: const Icon(
                    Ionicons.remove_circle_outline,
                  ),
                  label: const Text(
                    'Disable',
                  ),
                  onPressed: () => context.read<RepoSettingsBloc>().add(
                        RepoSettingsEvent.disableRepoRequested(
                          owner: owner,
                          repoName: repoName,
                        ),
                      ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}



// @JsonEnum()
// enum Timeout {
//   @JsonValue(15)
//   min15(15, '15 minutes'),
//   @JsonValue(30)
//   min30(30, '30 minutes'),
//   @JsonValue(60)
//   min60(60, '60 minutes'),
//   @JsonValue(90)
//   min90(90, '90 minutes'),
//   @JsonValue(120)
//   h2(120, '120 minutes'),
//   @JsonValue(180)
//   h3(180, '180 minutes'),
//   @JsonValue(240)
//   h4(240, '240 minutes'),
//   @JsonValue(300)
//   h5(300, '300 minutes'),
//   @JsonValue(360)
//   h6(360, '360 minutes'),
//   @JsonValue(420)
//   h7(420, '420 minutes'),
//   @JsonValue(480)
//   h8(480, '480 minutes'),
//   @JsonValue(540)
//   h9(540, '540 minutes'),
//   @JsonValue(600)
//   h10(600, '600 minutes'),
//   @JsonValue(660)
//   h11(660, '660 minutes'),
//   @JsonValue(720)
//   h12(720, '720 minutes'),
//   @JsonValue(1080)
//   h18(1080, '1080 minutes'),
//   @JsonValue(1440)
//   h24(1440, '1440 minutes'),
//   @JsonValue(2880)
//   h48(2880, '2880 minutes'),
//   @JsonValue(4320)
//   h72(4320, '4320 minutes');

//   const Timeout(this.value, this.text);
//   final int value;
//   final String text;
// }
