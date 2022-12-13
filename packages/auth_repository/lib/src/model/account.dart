// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:local_data_source/local_data_sorce.dart';

import 'package:drone_dart/drone_dart.dart';

class Account with EquatableMixin {
  const Account({
    required this.user,
    required this.client,
  });

  final User user;
  final DroneClient client;

  factory Account.fromUser({required User user}) {
    return Account(
        user: user,
        client: DroneClient(
          server: user.server,
          token: user.token,
        ));
  }

  @override
  List<Object?> get props => [user, client];
}

extension AccountX on List<Account> {
  Account? get currentAccount =>
      firstWhereOrNull((account) => account.user.isCurrentUser);
}

extension UserX on List<User> {
  List<Account> toAccount() {
    return [...map((user) => Account.fromUser(user: user))];
  }
}
