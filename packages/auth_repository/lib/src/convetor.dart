part of './auth_repository.dart';

final _usersToAccountsTransformer =
    StreamTransformer<List<User>, List<Account>>.fromHandlers(
  handleData: (users, sink) {
    sink.add(
        [...users.map((user) => Account.fromUser(user: user))]);
  },
);

final _userToAccountTransformer = StreamTransformer<User, Account>.fromHandlers(
  handleData: (user, sink) {
    sink.add(Account.fromUser(user: user));
  },
  
);
