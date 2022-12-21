import 'package:local_data_source/local_data_sorce.dart';

abstract class UserLocalDataSource {
  const UserLocalDataSource();

  Stream<User?> get currentUserStream;

  Stream<List<User>> get usersStream;

  List<User> get users;

  User? get currentUser;

  User? getUserByToken(String token);

  Future<void> add(User user);

  Future<void> delete(User user);

  Future<void> update({
    required User oldUser,
    required User newUser,
  });

  Future<void> close();
}
