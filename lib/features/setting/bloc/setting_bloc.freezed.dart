// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'setting_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SettingEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Account account) logoutRequested,
    required TResult Function(Account account) changeUser,
    required TResult Function() addNewUser,
    required TResult Function(String value) tokenChanged,
    required TResult Function(String value) serverChanged,
    required TResult Function(Account account) updateAccount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Account account)? logoutRequested,
    TResult? Function(Account account)? changeUser,
    TResult? Function()? addNewUser,
    TResult? Function(String value)? tokenChanged,
    TResult? Function(String value)? serverChanged,
    TResult? Function(Account account)? updateAccount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Account account)? logoutRequested,
    TResult Function(Account account)? changeUser,
    TResult Function()? addNewUser,
    TResult Function(String value)? tokenChanged,
    TResult Function(String value)? serverChanged,
    TResult Function(Account account)? updateAccount,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_LogoutRequested value) logoutRequested,
    required TResult Function(_ChangeUser value) changeUser,
    required TResult Function(_AddNewUser value) addNewUser,
    required TResult Function(_TokenChanged value) tokenChanged,
    required TResult Function(_ServerChanged value) serverChanged,
    required TResult Function(_UpdateAccount value) updateAccount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_LogoutRequested value)? logoutRequested,
    TResult? Function(_ChangeUser value)? changeUser,
    TResult? Function(_AddNewUser value)? addNewUser,
    TResult? Function(_TokenChanged value)? tokenChanged,
    TResult? Function(_ServerChanged value)? serverChanged,
    TResult? Function(_UpdateAccount value)? updateAccount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LogoutRequested value)? logoutRequested,
    TResult Function(_ChangeUser value)? changeUser,
    TResult Function(_AddNewUser value)? addNewUser,
    TResult Function(_TokenChanged value)? tokenChanged,
    TResult Function(_ServerChanged value)? serverChanged,
    TResult Function(_UpdateAccount value)? updateAccount,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingEventCopyWith<$Res> {
  factory $SettingEventCopyWith(
          SettingEvent value, $Res Function(SettingEvent) then) =
      _$SettingEventCopyWithImpl<$Res, SettingEvent>;
}

/// @nodoc
class _$SettingEventCopyWithImpl<$Res, $Val extends SettingEvent>
    implements $SettingEventCopyWith<$Res> {
  _$SettingEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_StartedCopyWith<$Res> {
  factory _$$_StartedCopyWith(
          _$_Started value, $Res Function(_$_Started) then) =
      __$$_StartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_StartedCopyWithImpl<$Res>
    extends _$SettingEventCopyWithImpl<$Res, _$_Started>
    implements _$$_StartedCopyWith<$Res> {
  __$$_StartedCopyWithImpl(_$_Started _value, $Res Function(_$_Started) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started();

  @override
  String toString() {
    return 'SettingEvent.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Account account) logoutRequested,
    required TResult Function(Account account) changeUser,
    required TResult Function() addNewUser,
    required TResult Function(String value) tokenChanged,
    required TResult Function(String value) serverChanged,
    required TResult Function(Account account) updateAccount,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Account account)? logoutRequested,
    TResult? Function(Account account)? changeUser,
    TResult? Function()? addNewUser,
    TResult? Function(String value)? tokenChanged,
    TResult? Function(String value)? serverChanged,
    TResult? Function(Account account)? updateAccount,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Account account)? logoutRequested,
    TResult Function(Account account)? changeUser,
    TResult Function()? addNewUser,
    TResult Function(String value)? tokenChanged,
    TResult Function(String value)? serverChanged,
    TResult Function(Account account)? updateAccount,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_LogoutRequested value) logoutRequested,
    required TResult Function(_ChangeUser value) changeUser,
    required TResult Function(_AddNewUser value) addNewUser,
    required TResult Function(_TokenChanged value) tokenChanged,
    required TResult Function(_ServerChanged value) serverChanged,
    required TResult Function(_UpdateAccount value) updateAccount,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_LogoutRequested value)? logoutRequested,
    TResult? Function(_ChangeUser value)? changeUser,
    TResult? Function(_AddNewUser value)? addNewUser,
    TResult? Function(_TokenChanged value)? tokenChanged,
    TResult? Function(_ServerChanged value)? serverChanged,
    TResult? Function(_UpdateAccount value)? updateAccount,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LogoutRequested value)? logoutRequested,
    TResult Function(_ChangeUser value)? changeUser,
    TResult Function(_AddNewUser value)? addNewUser,
    TResult Function(_TokenChanged value)? tokenChanged,
    TResult Function(_ServerChanged value)? serverChanged,
    TResult Function(_UpdateAccount value)? updateAccount,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements SettingEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc
abstract class _$$_LogoutRequestedCopyWith<$Res> {
  factory _$$_LogoutRequestedCopyWith(
          _$_LogoutRequested value, $Res Function(_$_LogoutRequested) then) =
      __$$_LogoutRequestedCopyWithImpl<$Res>;
  @useResult
  $Res call({Account account});
}

/// @nodoc
class __$$_LogoutRequestedCopyWithImpl<$Res>
    extends _$SettingEventCopyWithImpl<$Res, _$_LogoutRequested>
    implements _$$_LogoutRequestedCopyWith<$Res> {
  __$$_LogoutRequestedCopyWithImpl(
      _$_LogoutRequested _value, $Res Function(_$_LogoutRequested) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? account = null,
  }) {
    return _then(_$_LogoutRequested(
      account: null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account,
    ));
  }
}

/// @nodoc

class _$_LogoutRequested implements _LogoutRequested {
  const _$_LogoutRequested({required this.account});

  @override
  final Account account;

  @override
  String toString() {
    return 'SettingEvent.logoutRequested(account: $account)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LogoutRequested &&
            (identical(other.account, account) || other.account == account));
  }

  @override
  int get hashCode => Object.hash(runtimeType, account);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LogoutRequestedCopyWith<_$_LogoutRequested> get copyWith =>
      __$$_LogoutRequestedCopyWithImpl<_$_LogoutRequested>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Account account) logoutRequested,
    required TResult Function(Account account) changeUser,
    required TResult Function() addNewUser,
    required TResult Function(String value) tokenChanged,
    required TResult Function(String value) serverChanged,
    required TResult Function(Account account) updateAccount,
  }) {
    return logoutRequested(account);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Account account)? logoutRequested,
    TResult? Function(Account account)? changeUser,
    TResult? Function()? addNewUser,
    TResult? Function(String value)? tokenChanged,
    TResult? Function(String value)? serverChanged,
    TResult? Function(Account account)? updateAccount,
  }) {
    return logoutRequested?.call(account);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Account account)? logoutRequested,
    TResult Function(Account account)? changeUser,
    TResult Function()? addNewUser,
    TResult Function(String value)? tokenChanged,
    TResult Function(String value)? serverChanged,
    TResult Function(Account account)? updateAccount,
    required TResult orElse(),
  }) {
    if (logoutRequested != null) {
      return logoutRequested(account);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_LogoutRequested value) logoutRequested,
    required TResult Function(_ChangeUser value) changeUser,
    required TResult Function(_AddNewUser value) addNewUser,
    required TResult Function(_TokenChanged value) tokenChanged,
    required TResult Function(_ServerChanged value) serverChanged,
    required TResult Function(_UpdateAccount value) updateAccount,
  }) {
    return logoutRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_LogoutRequested value)? logoutRequested,
    TResult? Function(_ChangeUser value)? changeUser,
    TResult? Function(_AddNewUser value)? addNewUser,
    TResult? Function(_TokenChanged value)? tokenChanged,
    TResult? Function(_ServerChanged value)? serverChanged,
    TResult? Function(_UpdateAccount value)? updateAccount,
  }) {
    return logoutRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LogoutRequested value)? logoutRequested,
    TResult Function(_ChangeUser value)? changeUser,
    TResult Function(_AddNewUser value)? addNewUser,
    TResult Function(_TokenChanged value)? tokenChanged,
    TResult Function(_ServerChanged value)? serverChanged,
    TResult Function(_UpdateAccount value)? updateAccount,
    required TResult orElse(),
  }) {
    if (logoutRequested != null) {
      return logoutRequested(this);
    }
    return orElse();
  }
}

abstract class _LogoutRequested implements SettingEvent {
  const factory _LogoutRequested({required final Account account}) =
      _$_LogoutRequested;

  Account get account;
  @JsonKey(ignore: true)
  _$$_LogoutRequestedCopyWith<_$_LogoutRequested> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ChangeUserCopyWith<$Res> {
  factory _$$_ChangeUserCopyWith(
          _$_ChangeUser value, $Res Function(_$_ChangeUser) then) =
      __$$_ChangeUserCopyWithImpl<$Res>;
  @useResult
  $Res call({Account account});
}

/// @nodoc
class __$$_ChangeUserCopyWithImpl<$Res>
    extends _$SettingEventCopyWithImpl<$Res, _$_ChangeUser>
    implements _$$_ChangeUserCopyWith<$Res> {
  __$$_ChangeUserCopyWithImpl(
      _$_ChangeUser _value, $Res Function(_$_ChangeUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? account = null,
  }) {
    return _then(_$_ChangeUser(
      account: null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account,
    ));
  }
}

/// @nodoc

class _$_ChangeUser implements _ChangeUser {
  const _$_ChangeUser({required this.account});

  @override
  final Account account;

  @override
  String toString() {
    return 'SettingEvent.changeUser(account: $account)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeUser &&
            (identical(other.account, account) || other.account == account));
  }

  @override
  int get hashCode => Object.hash(runtimeType, account);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeUserCopyWith<_$_ChangeUser> get copyWith =>
      __$$_ChangeUserCopyWithImpl<_$_ChangeUser>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Account account) logoutRequested,
    required TResult Function(Account account) changeUser,
    required TResult Function() addNewUser,
    required TResult Function(String value) tokenChanged,
    required TResult Function(String value) serverChanged,
    required TResult Function(Account account) updateAccount,
  }) {
    return changeUser(account);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Account account)? logoutRequested,
    TResult? Function(Account account)? changeUser,
    TResult? Function()? addNewUser,
    TResult? Function(String value)? tokenChanged,
    TResult? Function(String value)? serverChanged,
    TResult? Function(Account account)? updateAccount,
  }) {
    return changeUser?.call(account);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Account account)? logoutRequested,
    TResult Function(Account account)? changeUser,
    TResult Function()? addNewUser,
    TResult Function(String value)? tokenChanged,
    TResult Function(String value)? serverChanged,
    TResult Function(Account account)? updateAccount,
    required TResult orElse(),
  }) {
    if (changeUser != null) {
      return changeUser(account);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_LogoutRequested value) logoutRequested,
    required TResult Function(_ChangeUser value) changeUser,
    required TResult Function(_AddNewUser value) addNewUser,
    required TResult Function(_TokenChanged value) tokenChanged,
    required TResult Function(_ServerChanged value) serverChanged,
    required TResult Function(_UpdateAccount value) updateAccount,
  }) {
    return changeUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_LogoutRequested value)? logoutRequested,
    TResult? Function(_ChangeUser value)? changeUser,
    TResult? Function(_AddNewUser value)? addNewUser,
    TResult? Function(_TokenChanged value)? tokenChanged,
    TResult? Function(_ServerChanged value)? serverChanged,
    TResult? Function(_UpdateAccount value)? updateAccount,
  }) {
    return changeUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LogoutRequested value)? logoutRequested,
    TResult Function(_ChangeUser value)? changeUser,
    TResult Function(_AddNewUser value)? addNewUser,
    TResult Function(_TokenChanged value)? tokenChanged,
    TResult Function(_ServerChanged value)? serverChanged,
    TResult Function(_UpdateAccount value)? updateAccount,
    required TResult orElse(),
  }) {
    if (changeUser != null) {
      return changeUser(this);
    }
    return orElse();
  }
}

abstract class _ChangeUser implements SettingEvent {
  const factory _ChangeUser({required final Account account}) = _$_ChangeUser;

  Account get account;
  @JsonKey(ignore: true)
  _$$_ChangeUserCopyWith<_$_ChangeUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AddNewUserCopyWith<$Res> {
  factory _$$_AddNewUserCopyWith(
          _$_AddNewUser value, $Res Function(_$_AddNewUser) then) =
      __$$_AddNewUserCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AddNewUserCopyWithImpl<$Res>
    extends _$SettingEventCopyWithImpl<$Res, _$_AddNewUser>
    implements _$$_AddNewUserCopyWith<$Res> {
  __$$_AddNewUserCopyWithImpl(
      _$_AddNewUser _value, $Res Function(_$_AddNewUser) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_AddNewUser implements _AddNewUser {
  const _$_AddNewUser();

  @override
  String toString() {
    return 'SettingEvent.addNewUser()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_AddNewUser);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Account account) logoutRequested,
    required TResult Function(Account account) changeUser,
    required TResult Function() addNewUser,
    required TResult Function(String value) tokenChanged,
    required TResult Function(String value) serverChanged,
    required TResult Function(Account account) updateAccount,
  }) {
    return addNewUser();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Account account)? logoutRequested,
    TResult? Function(Account account)? changeUser,
    TResult? Function()? addNewUser,
    TResult? Function(String value)? tokenChanged,
    TResult? Function(String value)? serverChanged,
    TResult? Function(Account account)? updateAccount,
  }) {
    return addNewUser?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Account account)? logoutRequested,
    TResult Function(Account account)? changeUser,
    TResult Function()? addNewUser,
    TResult Function(String value)? tokenChanged,
    TResult Function(String value)? serverChanged,
    TResult Function(Account account)? updateAccount,
    required TResult orElse(),
  }) {
    if (addNewUser != null) {
      return addNewUser();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_LogoutRequested value) logoutRequested,
    required TResult Function(_ChangeUser value) changeUser,
    required TResult Function(_AddNewUser value) addNewUser,
    required TResult Function(_TokenChanged value) tokenChanged,
    required TResult Function(_ServerChanged value) serverChanged,
    required TResult Function(_UpdateAccount value) updateAccount,
  }) {
    return addNewUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_LogoutRequested value)? logoutRequested,
    TResult? Function(_ChangeUser value)? changeUser,
    TResult? Function(_AddNewUser value)? addNewUser,
    TResult? Function(_TokenChanged value)? tokenChanged,
    TResult? Function(_ServerChanged value)? serverChanged,
    TResult? Function(_UpdateAccount value)? updateAccount,
  }) {
    return addNewUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LogoutRequested value)? logoutRequested,
    TResult Function(_ChangeUser value)? changeUser,
    TResult Function(_AddNewUser value)? addNewUser,
    TResult Function(_TokenChanged value)? tokenChanged,
    TResult Function(_ServerChanged value)? serverChanged,
    TResult Function(_UpdateAccount value)? updateAccount,
    required TResult orElse(),
  }) {
    if (addNewUser != null) {
      return addNewUser(this);
    }
    return orElse();
  }
}

abstract class _AddNewUser implements SettingEvent {
  const factory _AddNewUser() = _$_AddNewUser;
}

/// @nodoc
abstract class _$$_TokenChangedCopyWith<$Res> {
  factory _$$_TokenChangedCopyWith(
          _$_TokenChanged value, $Res Function(_$_TokenChanged) then) =
      __$$_TokenChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$_TokenChangedCopyWithImpl<$Res>
    extends _$SettingEventCopyWithImpl<$Res, _$_TokenChanged>
    implements _$$_TokenChangedCopyWith<$Res> {
  __$$_TokenChangedCopyWithImpl(
      _$_TokenChanged _value, $Res Function(_$_TokenChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$_TokenChanged(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_TokenChanged implements _TokenChanged {
  const _$_TokenChanged(this.value);

  @override
  final String value;

  @override
  String toString() {
    return 'SettingEvent.tokenChanged(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TokenChanged &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TokenChangedCopyWith<_$_TokenChanged> get copyWith =>
      __$$_TokenChangedCopyWithImpl<_$_TokenChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Account account) logoutRequested,
    required TResult Function(Account account) changeUser,
    required TResult Function() addNewUser,
    required TResult Function(String value) tokenChanged,
    required TResult Function(String value) serverChanged,
    required TResult Function(Account account) updateAccount,
  }) {
    return tokenChanged(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Account account)? logoutRequested,
    TResult? Function(Account account)? changeUser,
    TResult? Function()? addNewUser,
    TResult? Function(String value)? tokenChanged,
    TResult? Function(String value)? serverChanged,
    TResult? Function(Account account)? updateAccount,
  }) {
    return tokenChanged?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Account account)? logoutRequested,
    TResult Function(Account account)? changeUser,
    TResult Function()? addNewUser,
    TResult Function(String value)? tokenChanged,
    TResult Function(String value)? serverChanged,
    TResult Function(Account account)? updateAccount,
    required TResult orElse(),
  }) {
    if (tokenChanged != null) {
      return tokenChanged(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_LogoutRequested value) logoutRequested,
    required TResult Function(_ChangeUser value) changeUser,
    required TResult Function(_AddNewUser value) addNewUser,
    required TResult Function(_TokenChanged value) tokenChanged,
    required TResult Function(_ServerChanged value) serverChanged,
    required TResult Function(_UpdateAccount value) updateAccount,
  }) {
    return tokenChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_LogoutRequested value)? logoutRequested,
    TResult? Function(_ChangeUser value)? changeUser,
    TResult? Function(_AddNewUser value)? addNewUser,
    TResult? Function(_TokenChanged value)? tokenChanged,
    TResult? Function(_ServerChanged value)? serverChanged,
    TResult? Function(_UpdateAccount value)? updateAccount,
  }) {
    return tokenChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LogoutRequested value)? logoutRequested,
    TResult Function(_ChangeUser value)? changeUser,
    TResult Function(_AddNewUser value)? addNewUser,
    TResult Function(_TokenChanged value)? tokenChanged,
    TResult Function(_ServerChanged value)? serverChanged,
    TResult Function(_UpdateAccount value)? updateAccount,
    required TResult orElse(),
  }) {
    if (tokenChanged != null) {
      return tokenChanged(this);
    }
    return orElse();
  }
}

abstract class _TokenChanged implements SettingEvent {
  const factory _TokenChanged(final String value) = _$_TokenChanged;

  String get value;
  @JsonKey(ignore: true)
  _$$_TokenChangedCopyWith<_$_TokenChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ServerChangedCopyWith<$Res> {
  factory _$$_ServerChangedCopyWith(
          _$_ServerChanged value, $Res Function(_$_ServerChanged) then) =
      __$$_ServerChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$_ServerChangedCopyWithImpl<$Res>
    extends _$SettingEventCopyWithImpl<$Res, _$_ServerChanged>
    implements _$$_ServerChangedCopyWith<$Res> {
  __$$_ServerChangedCopyWithImpl(
      _$_ServerChanged _value, $Res Function(_$_ServerChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$_ServerChanged(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ServerChanged implements _ServerChanged {
  const _$_ServerChanged(this.value);

  @override
  final String value;

  @override
  String toString() {
    return 'SettingEvent.serverChanged(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ServerChanged &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ServerChangedCopyWith<_$_ServerChanged> get copyWith =>
      __$$_ServerChangedCopyWithImpl<_$_ServerChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Account account) logoutRequested,
    required TResult Function(Account account) changeUser,
    required TResult Function() addNewUser,
    required TResult Function(String value) tokenChanged,
    required TResult Function(String value) serverChanged,
    required TResult Function(Account account) updateAccount,
  }) {
    return serverChanged(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Account account)? logoutRequested,
    TResult? Function(Account account)? changeUser,
    TResult? Function()? addNewUser,
    TResult? Function(String value)? tokenChanged,
    TResult? Function(String value)? serverChanged,
    TResult? Function(Account account)? updateAccount,
  }) {
    return serverChanged?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Account account)? logoutRequested,
    TResult Function(Account account)? changeUser,
    TResult Function()? addNewUser,
    TResult Function(String value)? tokenChanged,
    TResult Function(String value)? serverChanged,
    TResult Function(Account account)? updateAccount,
    required TResult orElse(),
  }) {
    if (serverChanged != null) {
      return serverChanged(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_LogoutRequested value) logoutRequested,
    required TResult Function(_ChangeUser value) changeUser,
    required TResult Function(_AddNewUser value) addNewUser,
    required TResult Function(_TokenChanged value) tokenChanged,
    required TResult Function(_ServerChanged value) serverChanged,
    required TResult Function(_UpdateAccount value) updateAccount,
  }) {
    return serverChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_LogoutRequested value)? logoutRequested,
    TResult? Function(_ChangeUser value)? changeUser,
    TResult? Function(_AddNewUser value)? addNewUser,
    TResult? Function(_TokenChanged value)? tokenChanged,
    TResult? Function(_ServerChanged value)? serverChanged,
    TResult? Function(_UpdateAccount value)? updateAccount,
  }) {
    return serverChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LogoutRequested value)? logoutRequested,
    TResult Function(_ChangeUser value)? changeUser,
    TResult Function(_AddNewUser value)? addNewUser,
    TResult Function(_TokenChanged value)? tokenChanged,
    TResult Function(_ServerChanged value)? serverChanged,
    TResult Function(_UpdateAccount value)? updateAccount,
    required TResult orElse(),
  }) {
    if (serverChanged != null) {
      return serverChanged(this);
    }
    return orElse();
  }
}

abstract class _ServerChanged implements SettingEvent {
  const factory _ServerChanged(final String value) = _$_ServerChanged;

  String get value;
  @JsonKey(ignore: true)
  _$$_ServerChangedCopyWith<_$_ServerChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpdateAccountCopyWith<$Res> {
  factory _$$_UpdateAccountCopyWith(
          _$_UpdateAccount value, $Res Function(_$_UpdateAccount) then) =
      __$$_UpdateAccountCopyWithImpl<$Res>;
  @useResult
  $Res call({Account account});
}

/// @nodoc
class __$$_UpdateAccountCopyWithImpl<$Res>
    extends _$SettingEventCopyWithImpl<$Res, _$_UpdateAccount>
    implements _$$_UpdateAccountCopyWith<$Res> {
  __$$_UpdateAccountCopyWithImpl(
      _$_UpdateAccount _value, $Res Function(_$_UpdateAccount) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? account = null,
  }) {
    return _then(_$_UpdateAccount(
      account: null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account,
    ));
  }
}

/// @nodoc

class _$_UpdateAccount implements _UpdateAccount {
  const _$_UpdateAccount({required this.account});

  @override
  final Account account;

  @override
  String toString() {
    return 'SettingEvent.updateAccount(account: $account)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateAccount &&
            (identical(other.account, account) || other.account == account));
  }

  @override
  int get hashCode => Object.hash(runtimeType, account);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateAccountCopyWith<_$_UpdateAccount> get copyWith =>
      __$$_UpdateAccountCopyWithImpl<_$_UpdateAccount>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Account account) logoutRequested,
    required TResult Function(Account account) changeUser,
    required TResult Function() addNewUser,
    required TResult Function(String value) tokenChanged,
    required TResult Function(String value) serverChanged,
    required TResult Function(Account account) updateAccount,
  }) {
    return updateAccount(account);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Account account)? logoutRequested,
    TResult? Function(Account account)? changeUser,
    TResult? Function()? addNewUser,
    TResult? Function(String value)? tokenChanged,
    TResult? Function(String value)? serverChanged,
    TResult? Function(Account account)? updateAccount,
  }) {
    return updateAccount?.call(account);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Account account)? logoutRequested,
    TResult Function(Account account)? changeUser,
    TResult Function()? addNewUser,
    TResult Function(String value)? tokenChanged,
    TResult Function(String value)? serverChanged,
    TResult Function(Account account)? updateAccount,
    required TResult orElse(),
  }) {
    if (updateAccount != null) {
      return updateAccount(account);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_LogoutRequested value) logoutRequested,
    required TResult Function(_ChangeUser value) changeUser,
    required TResult Function(_AddNewUser value) addNewUser,
    required TResult Function(_TokenChanged value) tokenChanged,
    required TResult Function(_ServerChanged value) serverChanged,
    required TResult Function(_UpdateAccount value) updateAccount,
  }) {
    return updateAccount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_LogoutRequested value)? logoutRequested,
    TResult? Function(_ChangeUser value)? changeUser,
    TResult? Function(_AddNewUser value)? addNewUser,
    TResult? Function(_TokenChanged value)? tokenChanged,
    TResult? Function(_ServerChanged value)? serverChanged,
    TResult? Function(_UpdateAccount value)? updateAccount,
  }) {
    return updateAccount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LogoutRequested value)? logoutRequested,
    TResult Function(_ChangeUser value)? changeUser,
    TResult Function(_AddNewUser value)? addNewUser,
    TResult Function(_TokenChanged value)? tokenChanged,
    TResult Function(_ServerChanged value)? serverChanged,
    TResult Function(_UpdateAccount value)? updateAccount,
    required TResult orElse(),
  }) {
    if (updateAccount != null) {
      return updateAccount(this);
    }
    return orElse();
  }
}

abstract class _UpdateAccount implements SettingEvent {
  const factory _UpdateAccount({required final Account account}) =
      _$_UpdateAccount;

  Account get account;
  @JsonKey(ignore: true)
  _$$_UpdateAccountCopyWith<_$_UpdateAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SettingState {
  FormzStatus get status => throw _privateConstructorUsedError;
  TokenField get token => throw _privateConstructorUsedError;
  ServerField get server => throw _privateConstructorUsedError;
  bool get inNewUser => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingStateCopyWith<SettingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingStateCopyWith<$Res> {
  factory $SettingStateCopyWith(
          SettingState value, $Res Function(SettingState) then) =
      _$SettingStateCopyWithImpl<$Res, SettingState>;
  @useResult
  $Res call(
      {FormzStatus status,
      TokenField token,
      ServerField server,
      bool inNewUser,
      String? errorMessage});
}

/// @nodoc
class _$SettingStateCopyWithImpl<$Res, $Val extends SettingState>
    implements $SettingStateCopyWith<$Res> {
  _$SettingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? token = null,
    Object? server = null,
    Object? inNewUser = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as TokenField,
      server: null == server
          ? _value.server
          : server // ignore: cast_nullable_to_non_nullable
              as ServerField,
      inNewUser: null == inNewUser
          ? _value.inNewUser
          : inNewUser // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SettingStateCopyWith<$Res>
    implements $SettingStateCopyWith<$Res> {
  factory _$$_SettingStateCopyWith(
          _$_SettingState value, $Res Function(_$_SettingState) then) =
      __$$_SettingStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormzStatus status,
      TokenField token,
      ServerField server,
      bool inNewUser,
      String? errorMessage});
}

/// @nodoc
class __$$_SettingStateCopyWithImpl<$Res>
    extends _$SettingStateCopyWithImpl<$Res, _$_SettingState>
    implements _$$_SettingStateCopyWith<$Res> {
  __$$_SettingStateCopyWithImpl(
      _$_SettingState _value, $Res Function(_$_SettingState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? token = null,
    Object? server = null,
    Object? inNewUser = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_SettingState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as TokenField,
      server: null == server
          ? _value.server
          : server // ignore: cast_nullable_to_non_nullable
              as ServerField,
      inNewUser: null == inNewUser
          ? _value.inNewUser
          : inNewUser // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_SettingState extends _SettingState {
  const _$_SettingState(
      {this.status = FormzStatus.pure,
      this.token = const TokenField.pure(),
      this.server = const ServerField.pure(),
      this.inNewUser = false,
      this.errorMessage})
      : super._();

  @override
  @JsonKey()
  final FormzStatus status;
  @override
  @JsonKey()
  final TokenField token;
  @override
  @JsonKey()
  final ServerField server;
  @override
  @JsonKey()
  final bool inNewUser;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'SettingState(status: $status, token: $token, server: $server, inNewUser: $inNewUser, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SettingState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.server, server) || other.server == server) &&
            (identical(other.inNewUser, inNewUser) ||
                other.inNewUser == inNewUser) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, token, server, inNewUser, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SettingStateCopyWith<_$_SettingState> get copyWith =>
      __$$_SettingStateCopyWithImpl<_$_SettingState>(this, _$identity);
}

abstract class _SettingState extends SettingState {
  const factory _SettingState(
      {final FormzStatus status,
      final TokenField token,
      final ServerField server,
      final bool inNewUser,
      final String? errorMessage}) = _$_SettingState;
  const _SettingState._() : super._();

  @override
  FormzStatus get status;
  @override
  TokenField get token;
  @override
  ServerField get server;
  @override
  bool get inNewUser;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_SettingStateCopyWith<_$_SettingState> get copyWith =>
      throw _privateConstructorUsedError;
}
