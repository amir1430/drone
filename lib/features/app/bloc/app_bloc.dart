import 'dart:async';

import 'package:auth_repository/auth_repository.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:drone/core/core.dart';
import 'package:drone/features/app/router.dart';
import 'package:drone/sl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notification_repository/notification_repository.dart';
import 'package:repo_repository/repo_repository.dart';

part 'app_bloc.freezed.dart';
part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({
    required AuthRepository authRepository,
    required NotificationRepository notificationRepository,
  })  : _authRepository = authRepository,
        _notificationRepository = notificationRepository,
        super(const AppState.unknown()) {
    _droneEventSubscription = _notificationRepository.droneEventStream.listen(
      (event) {
        add(
          _CreateNotification(
            content: NotificationContent(
              summary: 'New build',
              id: event.repo.id,
              channelKey: AppConstants.channelKey,
              notificationLayout: NotificationLayout.Messaging,
              title: '${event.repo.namespace} ${event.repo.name}',
              body: '#${event.repo.build?.number ?? ''}'
                  ' ${event.repo.build?.status.status ?? ''}',
              roundedBigPicture: true,
              payload: {
                'token': event.token,
                'owner': event.repo.namespace,
                'repoName': event.repo.name,
                'number': event.repo.build?.number.toString()
              },
            ),
          ),
        );
      },
    );

    _receivedActionSubscription =
        _notificationRepository.receivedActionStream.listen(
      (event) {
        add(_NotificationClicked(action: event));
      },
    );

    on<_Started>(_onStarted);
    on<_CreateNotification>(_onCreateNotification);
    on<_NotificationClicked>(_onNotificationClicked);
  }

  late final StreamSubscription<DroneEvent> _droneEventSubscription;
  late final StreamSubscription<ReceivedAction> _receivedActionSubscription;

  final AuthRepository _authRepository;
  final NotificationRepository _notificationRepository;

  Future<void> _onStarted(
    _Started event,
    Emitter<AppState> emit,
  ) async {
    await sl.allReady();

    await emit.forEach(
      _authRepository.authenticationStatus,
      onData: (AuthenticationStatus status) {
        return status.when(
          unknown: AppState.unknown,
          authenticated: (users, currentUser) => Authenticated(
            users: users,
            currentUser: currentUser,
          ),
          unAuthenticated: AppState.unAuthenticated,
        );
      },
    );
  }

  Future<void> _onCreateNotification(
    _CreateNotification event,
    Emitter<AppState> emit,
  ) async {
    await _notificationRepository.createNotification(
      content: event.content,
      actionButtons: event.actionButtons,
      schedule: event.schedule,
    );
  }

  Future<void> _onNotificationClicked(
    _NotificationClicked event,
    Emitter<AppState> emit,
  ) async {
    final user = event.action.payload?['token'];

    if (user != null) {
      final currentUser = _authRepository.currentUser;
      final notiUser = _authRepository.getUserByToken(user);

      if (currentUser != null && notiUser != null && currentUser != notiUser) {
        await _authRepository.changeUser(notiUser);
      }

      if (state.asAuthenticated != null) {
        final owner = event.action.payload?['owner'];
        final repoName = event.action.payload?['repoName'];
        final number = event.action.payload?['number'];
        if (owner != null && repoName != null) {
          if (number == null) {
            emit(
              state.asAuthenticated!.copyWith(
                deferredPath:
                    RepoRoute(owner: owner, repoName: repoName).location,
              ),
            );
          } else {
            final num = int.tryParse(number);
            emit(
              state.asAuthenticated!.copyWith(
                deferredPath:
                    BuildRotue(owner: owner, repoName: repoName, number: num!)
                        .location,
              ),
            );
          }

          await Future<void>.delayed(const Duration(milliseconds: 500));
          emit(
            state.asAuthenticated!.copyWith(
              deferredPath: null,
            ),
          );
        }
      }
    }
  }

  @override
  Future<void> close() async {
    await _authRepository.close();
    await _droneEventSubscription.cancel();
    await _receivedActionSubscription.cancel();
    return super.close();
  }
}
