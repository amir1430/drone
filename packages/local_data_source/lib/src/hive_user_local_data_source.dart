import 'dart:async';

import 'package:hive/hive.dart';
import 'package:local_data_source/local_data_sorce.dart';
import 'package:collection/collection.dart';
import 'package:rxdart/rxdart.dart';

class HiveUserLocalDataSource implements UserLocalDataSource {
  HiveUserLocalDataSource({
    required Box<User> userBox,
  }) : _userBox = userBox {
    _usersController = BehaviorSubject.seeded(users);
    _userController = BehaviorSubject();
    _userDeletedController = BehaviorSubject();
    _subscription = _userBox.watch().listen((event) {
      print(event.value);
      if (!event.deleted) {
        _userController.add(event.value as User);
      } else {
        if (users.isEmpty) {
          _usersController.add([]);
        }
        _userDeletedController.add(event.value as User);
      }
      _usersController.add(users);
    });
  }

  // controllers
  late final StreamController<List<User>> _usersController;
  late final StreamController<User> _userController;
  late final StreamController<User> _userDeletedController;
  late final StreamSubscription<BoxEvent> _subscription;

  // box
  final Box<User> _userBox;

  @override
  Stream<User> get userStream => _userController.stream;

  @override
  Stream<List<User>> get usersStream => _usersController.stream;

  @override
  List<User> get users => [..._userBox.values];

  @override
  User get currentUser =>
      _userBox.values.firstWhereOrNull((element) => element.isCurrentUser)!;

  @override
  Future<void> alterUser(User user) async {
    // final _getUser = _userBox.get(user.token, defaultValue: null);
    // if (_getUser == null) {
    //   print('_getUser != null');
    //   await _userBox.put(user.token, user);
    // }

    final usersMap = <String, User>{
      user.token: user..isCurrentUser = true,
      for (final item in users)
        if (item.token != user.token) item.token: item..isCurrentUser = false,
    };
    await _userBox.putAll(usersMap);
  }

  @override
  Future<void> delete(User user) async {
    try {
      final otherUsers = [
        for (final item in users)
          if (item.token != user.token) item,
      ];

      await _userBox.delete(user.token);
      if (otherUsers.isNotEmpty) {
        final currentUser = otherUsers[0]..isCurrentUser = true;
        await _userBox.put(currentUser.token, currentUser);
      }
    } catch (e) {
      return;
    }
  }

  @override
  Future<void> updateUser({
    required User oldUser,
    required User newUser,
  }) async {
    if (oldUser == newUser) {
      return;
    }
    if (oldUser.token != newUser.token) {
      await _userBox.delete(oldUser.token);
      return;
    }
    await _userBox.put(newUser.token, newUser);
  }

  @override
  Future<void> close() async {
    await _subscription.cancel();
    await _userController.close();
    await _usersController.close();
    await _userDeletedController.close();
  }
}

// @override
// Future<List<User>> alterUser(User user) async {
//   if (!user.isInBox) {
//     await _userBox.add(user..isCurrentUser = true);
//   }

//   final usersMap = <dynamic, User>{
//     for (var item in _userBox.values)
//       if (item.key != user.key)
//         item.key: item..isCurrentUser = false
//       else
//         user.key: user..isCurrentUser = true,
//   };

//   await _userBox.putAll(usersMap);
//   return users;
// }

// @override
// Future<List<User>> delete(User user) async {
//   try {
//     final otherUsers = [
//       for (final item in users)
//         if (item.key != user.key) item,
//     ];

//     if (otherUsers.isNotEmpty) {
//       final currentUser = otherUsers[0]..isCurrentUser = true;
//       await currentUser.save();
//     }
//     await user.delete();
//     return users;
//   } catch (e) {
//     return users;
//   }
// }

// @override
// Future<List<User>> updateUser({
//   required User oldUser,
//   required User newUser,
// }) async {
//   if (oldUser == newUser) {
//     return users;
//   }
//   if (oldUser.token != newUser.token) {
//     await oldUser.delete();
//   }
//   await newUser.save();
//   return users;
// }

