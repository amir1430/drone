import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:drone_dart/drone_dart.dart';
import 'package:form_input/form_input.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const LoginState());

  final AuthRepository _authRepository;
  // TODO:// update user info when app loaded

  void serverInputFieldChanged(String server) {
    final _server = ServerField.dirty(server);
    emit(
      state.copyWith(
        server: _server,
        status: Formz.validate([_server, state.token]),
      ),
    );
  }

  void tokenInputFieldChanged(String token) {
    final _token = TokenField.dirty(token);
    emit(
      state.copyWith(
        token: _token,
        status: Formz.validate([_token, state.server]),
      ),
    );
  }

  Future<void> login({
    required String token,
    required String server,
  }) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      final account = await _authRepository.getUserCredentials(
        token: token,
        server: server,
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
