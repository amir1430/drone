import 'dart:async';

import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:form_input/form_input.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:local_data_source/local_data_sorce.dart';
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
    on<_ServerChanged>(_onServerChanged);
    on<_TokenChanged>(_onTokenChanged);
    on<_UpdateUser>(_onUpdateAccount);
  }

  final AuthRepository _authRepository;

  Future<void> _onAddNewUser(
    _AddNewUser event,
    Emitter<SettingState> emit,
  ) async {
    if (state.status.isSubmissionInProgress) {
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

  Future<void> _onChangeUserRequested(
    _ChangeUser event,
    Emitter<SettingState> emit,
  ) async {
    if (state.status.isSubmissionInProgress) {
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
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      final newUser = await _authRepository.getUserCredentials(
        token: state.token.value,
        server: state.server.value,
      );

      await _authRepository.updateUser(
        oldUser: event.user,
        newUser: newUser,
      );
    } on DroneException catch (e) {
      emit(
        state.copyWith(
          server: ServerField.pure(event.user.server),
          token: TokenField.pure(event.user.token),
          errorMessage: e.message,
          status: FormzStatus.submissionFailure,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          server: ServerField.pure(event.user.server),
          token: TokenField.pure(event.user.token),
          errorMessage: '$e',
          status: FormzStatus.submissionFailure,
        ),
      );
    }
  }

  Future<void> _onServerChanged(
    _ServerChanged event,
    Emitter<SettingState> emit,
  ) async {
    final _server = ServerField.dirty(event.value);
    emit(
      state.copyWith(
        server: _server,
        status: Formz.validate(
          [_server, state.token],
        ),
      ),
    );
  }

  Future<void> _onTokenChanged(
    _TokenChanged event,
    Emitter<SettingState> emit,
  ) async {
    final _token = TokenField.dirty(event.value);
    emit(
      state.copyWith(
        token: _token,
        status: Formz.validate(
          [_token, state.server],
        ),
      ),
    );
  }
}
