import 'package:local_data_source/local_data_sorce.dart';

abstract class UserLocalDataSource {
  const UserLocalDataSource();

  Stream<User> get userStream;

  Stream<List<User>> get usersStream;

  List<User> get users;

  User get currentUser;

  Future<void> alterUser(User user);

  Future<void> delete(User user);

  Future<void> updateUser({
    required User oldUser,
    required User newUser,
  });

  Future<void> close();
}
