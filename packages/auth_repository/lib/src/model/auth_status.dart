import 'package:freezed_annotation/freezed_annotation.dart';

import '../../auth_repository.dart';

part 'auth_status.freezed.dart';

@freezed
class AuthenticationStatus with _$AuthenticationStatus {
  const factory AuthenticationStatus.unknown() = _Unknown;
  const factory AuthenticationStatus.authenticated({
    required List<Account> accounts,
    required Account currentAccount,
  }) = _Authenticated;
  const factory AuthenticationStatus.unauthenticated() = _Unauthenticated;
}
