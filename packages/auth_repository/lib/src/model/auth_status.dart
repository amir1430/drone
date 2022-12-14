import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:local_data_source/local_data_sorce.dart';

part 'auth_status.freezed.dart';

@freezed
class AuthenticationStatus with _$AuthenticationStatus {
  const factory AuthenticationStatus.unknown() = UnknownAuthenticationStatus;
  const factory AuthenticationStatus.authenticated({
    required List<User> users,
    required User currentUser,
  }) = Authenticated;
  const factory AuthenticationStatus.unAuthenticated() = UnAuthenticated;
}
