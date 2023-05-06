part of 'app_bloc.dart';

@freezed
class AppState with _$AppState {
  const factory AppState.unknown() = Unknown;
  const factory AppState.authenticated({
    required List<User> users,
    required User currentUser,
    String? deferredPath,
  }) = Authenticated;
  const factory AppState.unAuthenticated() = UnAuthenticated;
}

extension AppStateX on AppState {
  Authenticated? get asAuthenticated => mapOrNull(
        authenticated: (data) => data,
      );
}
