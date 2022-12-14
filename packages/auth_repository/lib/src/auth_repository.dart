import 'dart:async';

import 'package:auth_repository/src/model/auth_status.dart';
import 'package:drone_dart/drone_dart.dart';
import 'package:local_data_source/local_data_sorce.dart';

class AuthRepository {
  const AuthRepository({
    required this.dataSource,
  });

  final UserLocalDataSource dataSource;

  Stream<AuthenticationStatus> get authenticationStatus {
    return userStream.map((current) {
      if (current == null) {
        return AuthenticationStatus.unAuthenticated();
      }
      return AuthenticationStatus.authenticated(
          users: users, currentUser: current);
    });
  }

  List<User> get users => [...dataSource.users];

  User? get currentUser => dataSource.currentUser;

  Stream<User?> get userStream => dataSource.currentUserStream;

  Stream<List<User>> get usersStream => dataSource.usersStream;

  Future<void> changeUser(User user) => dataSource.add(user);

  Future<void> logIn(User user) => dataSource.add(user);

  Future<void> logOut(User user) => dataSource.delete(user);

  Future<User> getUserCredentials({
    required String token,
    required String server,
  }) async {
    try {
      final client = DroneClient(server: server, token: token);
      final droneUser = await client.userSection.info();
      final user = User.fromDroneUser(user: droneUser, server: server);
      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateUser({
    required User oldUser,
    required User newUser,
  }) async {
    await dataSource.update(
      oldUser: oldUser,
      newUser: newUser,
    );
  }

  Future<void> checkUsers() async {
    final users = this.users;
    for (final user in users) {
      try {
        final newUser =
            await getUserCredentials(token: user.token, server: user.server);
        if (newUser != user) {
          await dataSource.update(
            oldUser: user,
            newUser: newUser,
          );
        }
      } on DroneException catch (e) {
        e.whenOrNull(
          unauthorizedException: (message) async {
            await logOut(user);
          },
        );
      }
    }
  }

  Future<void> close() async {
    await dataSource.close();
  }
}

extension UserX on User {
  DroneClient get client => DroneClient(server: server, token: token);
}
