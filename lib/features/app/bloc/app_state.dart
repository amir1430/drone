part of 'app_bloc.dart';

@freezed
class AppState with _$AppState {
  const factory AppState.unknown() = Unknown;
  const factory AppState.authenticated({
    required List<Account> accounts,
    required Account currentAccount,
  }) = Authenticated;
  const factory AppState.unAuthenticated() = UnAuthenticated;
}

extension AuthenticatedX on Authenticated {
  // Account get currentAccount =>
  //     accounts.firstWhere((accounts) => accounts.user.isCurrentUser);
  DroneClient get currentClient => currentAccount.client;
}

extension AppStateX on AppState {
  Authenticated? get asAuthenticated => mapOrNull(
        authenticated: (data) => data,
      );
}
