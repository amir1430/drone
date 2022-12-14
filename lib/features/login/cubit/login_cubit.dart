import 'dart:math';

import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:drone_dart/drone_dart.dart';
import 'package:flutter/material.dart';
import 'package:form_input/form_input.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(LoginState(color: _randomColor()));

  final AuthRepository _authRepository;
  // TODO:// update user info when app loaded

  void serverInputFieldChanged(String server) {
    final _server = ServerField.dirty(server);
    emit(
      state.copyWith(
        server: _server,
        status: Formz.validate([_server, state.token, state.nickName]),
      ),
    );
  }

  void tokenInputFieldChanged(String token) {
    final _token = TokenField.dirty(token);
    emit(
      state.copyWith(
        token: _token,
        status: Formz.validate([_token, state.server, state.nickName]),
      ),
    );
  }

  void nickNameInputFieldChanged(String nickName) {
    final _nickName = NickNameField.dirty(nickName);
    emit(
      state.copyWith(
        nickName: _nickName,
        status: Formz.validate([_nickName, state.token, state.server]),
      ),
    );
  }

  Future<void> login() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      final account = await _authRepository.getUserCredentials(
        token: state.token.value,
        server: state.server.value,
        nickName: state.nickName.value,
        color: state.color!.value,
      );

      await _authRepository.logIn(account);
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on DroneException catch (e) {
      emit(
        state.copyWith(
          status: FormzStatus.submissionFailure,
          error: e.message,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: FormzStatus.submissionFailure,
          error: '$e',
        ),
      );
    }
  }
}
