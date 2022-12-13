import 'dart:async';

import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
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
    on<_ServerChanged>(_onServerChanged);
    on<_TokenChanged>(_onTokenChanged);
    on<_UpdateAccount>(_onUpdateAccount);
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
    final currentAccount = _authRepository.currentAccount;
    emit(SettingState.fromAccount(currentAccount));

    await emit.forEach<AuthenticationStatus>(
      _authRepository.authenticationStatus,
      onData: (status) {
        return status.maybeMap(
          authenticated: (value) {
            return SettingState.fromAccount(value.currentAccount);
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
      await _authRepository.logOut(event.account);
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
      if (!event.account.user.isCurrentUser) {
        await _authRepository.changeAccount(event.account);
        return;
        // emit(const _ChangeUserSuccess());
      }
      if (state.inNewUser) {
        return emit(
          state.copyWith(
            inNewUser: false,
            server: ServerField.dirty(event.account.user.server),
            token: TokenField.dirty(event.account.user.token),
          ),
        );
      }
    } catch (e) {
      emit(state.copyWith(errorMessage: '$e'));
      // emit(_Failure(error: '$e'));
    }
  }

  Future<void> _onUpdateAccount(
    _UpdateAccount event,
    Emitter<SettingState> emit,
  ) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      final newUser = await _authRepository.getUserCredentials(
        token: state.token.value,
        server: state.server.value,
      );

      await _authRepository.updateAccount(
        oldAccount: event.account,
        newAccount: newUser,
      );
    } on DroneException catch (e) {
      emit(
        state.copyWith(
          server: ServerField.pure(event.account.user.server),
          token: TokenField.pure(event.account.user.token),
          errorMessage: e.message,
          status: FormzStatus.submissionFailure,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          server: ServerField.pure(event.account.user.server),
          token: TokenField.pure(event.account.user.token),
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
