import 'dart:async';

import 'package:auth_repository/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_input/form_input.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repo_repository/repo_repository.dart';

part 'setting_bloc.freezed.dart';
part 'setting_event.dart';
part 'setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const SettingState()) {
    on<_Started>(_onStarted);
    on<_AddNewUser>(_onAddNewUser);
    on<_LogoutRequested>(_onLogoutRequested);
    on<_ChangeUser>(_onChangeUserRequested);
    on<_NickNameChanged>(_onNickNameChanged);
    on<_ServerChanged>(_onServerChanged);
    on<_TokenChanged>(_onTokenChanged);
    on<_ChangeIsNotificationEnable>(_onChangeIsNotificationEnable);
    on<_UpdateUser>(_onUpdateAccount);
  }

  final AuthRepository _authRepository;

  Future<void> _onAddNewUser(
    _AddNewUser event,
    Emitter<SettingState> emit,
  ) async {
    if (state.status.isInProgress) {
      return;
    }
    emit(const SettingState(inNewUser: true));
  }

  Future<void> _onStarted(
    _Started event,
    Emitter<SettingState> emit,
  ) async {
    final currentUser = _authRepository.currentUser;
    emit(SettingState.fromUser(currentUser!));

    await emit.forEach<AuthenticationStatus>(
      _authRepository.authenticationStatus,
      onData: (status) {
        return status.maybeWhen(
          authenticated: (_, current) {
            return SettingState.fromUser(current);
          },
          orElse: () => state,
        );
      },
    );
  }

  Future<void> _onLogoutRequested(
    _LogoutRequested event,
    Emitter<SettingState> emit,
  ) async {
    try {
      await _authRepository.logOut(event.user);
      // emit(const _LogoutSuccess());
    } catch (e) {
      emit(state.copyWith(errorMessage: '$e'));
      // emit(_Failure(error: '$e'));
    }
  }

  Future<void> _onChangeIsNotificationEnable(
    _ChangeIsNotificationEnable event,
    Emitter<SettingState> emit,
  ) async {
    emit(state.copyWith(isNotificationEnable: event.value));
    final x = _authRepository.getUserByToken(state.token.value);
    await _authRepository.updateUser(
      oldUser: x!,
      newUser: x.copyWith(
        enabaleNotification: event.value,
      ),
    );
  }

  Future<void> _onChangeUserRequested(
    _ChangeUser event,
    Emitter<SettingState> emit,
  ) async {
    if (state.isNotValid) {
      return;
    }
    try {
      if (_authRepository.currentUser != event.user) {
        await _authRepository.changeUser(event.user);
        return;
        // emit(const _ChangeUserSuccess());
      }
      if (state.inNewUser) {
        return emit(
          state.copyWith(
            inNewUser: false,
            server: ServerField.dirty(event.user.server),
            token: TokenField.dirty(event.user.token),
          ),
        );
      }
    } catch (e) {
      emit(state.copyWith(errorMessage: '$e'));
      // emit(_Failure(error: '$e'));
    }
  }

  Future<void> _onUpdateAccount(
    _UpdateUser event,
    Emitter<SettingState> emit,
  ) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      final newUser = await _authRepository.getUserCredentials(
        token: state.token.value,
        server: state.server.value,
        nickName: state.nickName.value,
        color: event.user.color,
      );

      await _authRepository.updateUser(
        oldUser: event.user,
        newUser: newUser,
      );
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } on DroneException catch (e) {
      emit(
        state.copyWith(
          server: ServerField.pure(event.user.server),
          token: TokenField.pure(event.user.token),
          errorMessage: e.message,
          status: FormzSubmissionStatus.failure,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          server: ServerField.pure(event.user.server),
          token: TokenField.pure(event.user.token),
          errorMessage: '$e',
        ),
      );
    }
  }

  Future<void> _onNickNameChanged(
    _NickNameChanged event,
    Emitter<SettingState> emit,
  ) async {
    final nickName = NickNameField.dirty(event.value);
    emit(
      state.copyWith(nickName: nickName),
    );
  }

  Future<void> _onServerChanged(
    _ServerChanged event,
    Emitter<SettingState> emit,
  ) async {
    final server = ServerField.dirty(event.value);
    emit(
      state.copyWith(server: server),
    );
  }

  Future<void> _onTokenChanged(
    _TokenChanged event,
    Emitter<SettingState> emit,
  ) async {
    final token = TokenField.dirty(event.value);
    emit(
      state.copyWith(token: token),
    );
  }
}
