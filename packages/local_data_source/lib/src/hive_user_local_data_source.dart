import 'dart:async';

import 'package:hive/hive.dart';
import 'package:local_data_source/local_data_sorce.dart';
import 'package:local_data_source/src/constants.dart';
import 'package:collection/collection.dart';
import 'package:rxdart/rxdart.dart';

class HiveUserLocalDataSource implements UserLocalDataSource {
  HiveUserLocalDataSource({
    required Box<User> userBox,
  }) : _userBox = userBox {
    _userOperationsController = BehaviorSubject();
    _usersController = BehaviorSubject.seeded(users);
    _currentUserController = BehaviorSubject.seeded(currentUser);

    _currentUserSubscription =
        _userBox.watch(key: LocalDataSourceKeys.currentUser).listen((event) {
      final _currentUser = currentUser;
      _currentUserController.sink.add(_currentUser);
      _usersController.sink.add(users);
    });
  }

  // controllers
  late final StreamController<List<User>> _usersController;
  late final StreamController<User?> _currentUserController;
  late final StreamController<UserLocalDataSourceEvent>
      _userOperationsController;

  // stream subscriptions
  late final StreamSubscription<BoxEvent> _currentUserSubscription;

  // hive boxs
  final Box<User> _userBox;

  @override
  Stream<User?> get currentUserStream => _currentUserController.stream;

  @override
  Stream<List<User>> get usersStream => _usersController.stream;

  @override
  Stream<UserLocalDataSourceEvent> get userOperationsStream =>
      _userOperationsController.stream.startWithMany(users
          .map((user) => UserLocalDataSourceEvent(
              operation: Operation.initial, user: user))
          .toList());

  @override
  List<User> get users => _userBox
      .toMap()
      .entries
      .map((e) => e.key != LocalDataSourceKeys.currentUser ? e.value : null)
      .whereNotNull()
      .toList();

  @override
  User? get currentUser => _userBox.get(LocalDataSourceKeys.currentUser);

  @override
  Future<void> add(User user, {bool sync = true}) async {
    await _userBox.putAll({
      LocalDataSourceKeys.currentUser: user,
      user.token: user,
    });

    if (sync) {
      _userOperationsController.sink.add(UserLocalDataSourceEvent(
        operation: Operation.add,
        user: user,
      ));
    }
  }

  @override
  Future<void> delete(User user, {bool sync = true}) async {
    await _userBox.delete(user.token);

    final _currentUser = currentUser;
    if (_currentUser != null && _currentUser == user) {
      final _newCurrent =
          users.firstWhereOrNull((element) => element != _currentUser);
      if (_newCurrent != null) {
        await _userBox.put(LocalDataSourceKeys.currentUser, _newCurrent);
      } else {
        await _userBox.delete(LocalDataSourceKeys.currentUser);
      }
    }

    if (sync) {
      _userOperationsController.sink.add(UserLocalDataSourceEvent(
        operation: Operation.delete,
        user: user,
      ));
    }
  }

  @override
  Future<void> update({
    required User oldUser,
    required User newUser,
  }) async {
    await add(newUser, sync: false);
    if (oldUser.token != newUser.token) {
      await delete(oldUser, sync: false);
    }

    _userOperationsController.sink.add(UserLocalDataSourceEvent(
      operation: Operation.update,
      user: newUser,
      oldUser: oldUser,
    ));
  }

  @override
  User? getUserByToken(String token) {
    return _userBox.get(token);
  }

  @override
  Future<void> close() async {
    await _currentUserController.close();
    await _usersController.close();

    await _currentUserSubscription.cancel();
  }
}
