import 'dart:async';

import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:drone_dart/drone_dart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_bloc.freezed.dart';
part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const Unknown()) {
    on<_Started>(_onStarted);
  }

  final AuthRepository _authRepository;

  Future<void> _onStarted(
    _Started event,
    Emitter<AppState> emit,
  ) async {
    await emit.forEach(
      _authRepository.authenticationStatus,
      onData: (AuthenticationStatus status) {
        return status.when(
          unknown: Unknown.new,
          authenticated: (accounts, currentAccount) => Authenticated(
            accounts: accounts,
            currentAccount: currentAccount,
          ),
          unauthenticated: UnAuthenticated.new,
        );
      },
    );
  }

  @override
  Future<void> close() async {
    await _authRepository.close();
    return super.close();
  }
}
