part of 'app_bloc.dart';

// @freezed
// class AppState with _$AppState {
//   const factory AppState.unknown() = Unknown;
//   const factory AppState.authenticated({
//     required List<Account> accounts,
//     required Account currentAccount,
//   }) = Authenticated;
//   const factory AppState.unAuthenticated() = UnAuthenticated;
// }

extension AuthenticatedX on Authenticated {
  DroneClient get currentClient => currentUser.client;
}

extension AppStateX on AuthenticationStatus {
  Authenticated? get asAuthenticated => mapOrNull(
        authenticated: (data) => data,
      );
}
