import 'dart:math';

import 'package:auth_repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_input/form_input.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repo_repository/repo_repository.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(LoginState(color: _randomColor()));

  final AuthRepository _authRepository;
  // TODO:// update user info when app loaded

  void serverInputFieldChanged(String server) {
    final server0 = ServerField.dirty(server);
    emit(
      state.copyWith(server: server0),
    );
  }

  void tokenInputFieldChanged(String token) {
    final token0 = TokenField.dirty(token);
    emit(
      state.copyWith(token: token0),
    );
  }

  void nickNameInputFieldChanged(String nickName) {
    final nickName0 = NickNameField.dirty(nickName);
    emit(
      state.copyWith(nickName: nickName0),
    );
  }

  Future<void> login() async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      final account = await _authRepository.getUserCredentials(
        token: state.token.value,
        server: state.server.value,
        nickName: state.nickName.value,
        color: state.color!.value,
      );

      await _authRepository.logIn(account);
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } on DroneException catch (e) {
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.failure,
          error: e.message,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.failure,
          error: '$e',
        ),
      );
    }
  }
}
