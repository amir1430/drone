import 'dart:async';

import 'package:auth_repository/src/model/account.dart';
import 'package:auth_repository/src/model/auth_status.dart';
import 'package:drone_dart/drone_dart.dart';
import 'package:local_data_source/local_data_sorce.dart';

part 'convetor.dart';

class AuthRepository {
  const AuthRepository({
    required this.dataSource,
  });

  final UserLocalDataSource dataSource;

  Stream<AuthenticationStatus> get authenticationStatus {
    return accountsStream.map((accounts) {
      if (accounts.isEmpty) {
        return AuthenticationStatus.unauthenticated();
      }
      return AuthenticationStatus.authenticated(
        accounts: accounts,
        currentAccount: accounts.currentAccount!,
      );
    });
    // yield AuthenticationStatus.unknown();
    // final acc = accounts;
    // if (acc.isEmpty) {
    //   yield AuthenticationStatus.unauthenticated();
    // } else {
    //   yield AuthenticationStatus.authenticated(
    //     accounts: accounts,
    //     currentAccount: accounts.currentAccount!,
    //   );
    // }

    // yield* accountsStream.map((accounts) {
    //   if (accounts.isEmpty) {
    //     return AuthenticationStatus.unauthenticated();
    //   }
    //   return AuthenticationStatus.authenticated(
    //     accounts: accounts,
    //     currentAccount: accounts.currentAccount!,
    //   );
    // });
  }

  List<Account> get accounts =>
      [...dataSource.users.map((user) => Account.fromUser(user: user))];

  Account get currentAccount => Account.fromUser(
        user: dataSource.currentUser,
      );

  Stream<Account> get accountStream =>
      dataSource.userStream.transform(_userToAccountTransformer);

  Stream<List<Account>> get accountsStream =>
      dataSource.usersStream.transform(_usersToAccountsTransformer);

  Future<void> changeAccount(Account account) =>
      dataSource.alterUser(account.user);

  Future<void> logIn(Account account) => dataSource.alterUser(account.user);

  Future<void> logOut(Account account) => dataSource.delete(account.user);

  Future<Account> getUserCredentials({
    required String token,
    required String server,
  }) async {
    try {
      final client = DroneClient(server: server, token: token);
      final droneUser = await client.userSection.info();
      final user = User.fromDroneUser(user: droneUser, server: server);
      return Account.fromUser(user: user);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateAccount({
    required Account oldAccount,
    required Account newAccount,
  }) async {
    await dataSource.updateUser(
      oldUser: oldAccount.user,
      newUser: newAccount.user,
    );
  }

  Future<void> checkAccounts() async {
    final accounts = this.accounts;
    for (final oldAccount in accounts) {
      try {
        final newAccount = await getUserCredentials(
            token: oldAccount.user.token, server: oldAccount.user.server);
        if (newAccount != oldAccount) {
          await dataSource.updateUser(
            oldUser: oldAccount.user,
            newUser: newAccount.user,
          );
        }
      } on DroneException catch (e) {
        e.whenOrNull(
          unauthorizedException: (message) async {
            await logOut(oldAccount);
          },
        );
      }
    }
  }

  Future<void> close() async {
    await dataSource.close();
  }
}
