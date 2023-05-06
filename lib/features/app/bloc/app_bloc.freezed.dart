// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
            NotificationContent content,
            NotificationSchedule? schedule,
            List<NotificationActionButton>? actionButtons)
        createNotification,
    required TResult Function(ReceivedAction action) notificationClicked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(
            NotificationContent content,
            NotificationSchedule? schedule,
            List<NotificationActionButton>? actionButtons)?
        createNotification,
    TResult? Function(ReceivedAction action)? notificationClicked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(
            NotificationContent content,
            NotificationSchedule? schedule,
            List<NotificationActionButton>? actionButtons)?
        createNotification,
    TResult Function(ReceivedAction action)? notificationClicked,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_CreateNotification value) createNotification,
    required TResult Function(_NotificationClicked value) notificationClicked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_CreateNotification value)? createNotification,
    TResult? Function(_NotificationClicked value)? notificationClicked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CreateNotification value)? createNotification,
    TResult Function(_NotificationClicked value)? notificationClicked,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppEventCopyWith<$Res> {
  factory $AppEventCopyWith(AppEvent value, $Res Function(AppEvent) then) =
      _$AppEventCopyWithImpl<$Res, AppEvent>;
}

/// @nodoc
class _$AppEventCopyWithImpl<$Res, $Val extends AppEvent>
    implements $AppEventCopyWith<$Res> {
  _$AppEventCopyWithImpl(this._value, this._then);

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
    extends _$AppEventCopyWithImpl<$Res, _$_Started>
    implements _$$_StartedCopyWith<$Res> {
  __$$_StartedCopyWithImpl(_$_Started _value, $Res Function(_$_Started) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started();

  @override
  String toString() {
    return 'AppEvent.started()';
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
    required TResult Function(
            NotificationContent content,
            NotificationSchedule? schedule,
            List<NotificationActionButton>? actionButtons)
        createNotification,
    required TResult Function(ReceivedAction action) notificationClicked,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(
            NotificationContent content,
            NotificationSchedule? schedule,
            List<NotificationActionButton>? actionButtons)?
        createNotification,
    TResult? Function(ReceivedAction action)? notificationClicked,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(
            NotificationContent content,
            NotificationSchedule? schedule,
            List<NotificationActionButton>? actionButtons)?
        createNotification,
    TResult Function(ReceivedAction action)? notificationClicked,
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
    required TResult Function(_CreateNotification value) createNotification,
    required TResult Function(_NotificationClicked value) notificationClicked,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_CreateNotification value)? createNotification,
    TResult? Function(_NotificationClicked value)? notificationClicked,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CreateNotification value)? createNotification,
    TResult Function(_NotificationClicked value)? notificationClicked,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements AppEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc
abstract class _$$_CreateNotificationCopyWith<$Res> {
  factory _$$_CreateNotificationCopyWith(_$_CreateNotification value,
          $Res Function(_$_CreateNotification) then) =
      __$$_CreateNotificationCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {NotificationContent content,
      NotificationSchedule? schedule,
      List<NotificationActionButton>? actionButtons});
}

/// @nodoc
class __$$_CreateNotificationCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$_CreateNotification>
    implements _$$_CreateNotificationCopyWith<$Res> {
  __$$_CreateNotificationCopyWithImpl(
      _$_CreateNotification _value, $Res Function(_$_CreateNotification) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? schedule = freezed,
    Object? actionButtons = freezed,
  }) {
    return _then(_$_CreateNotification(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as NotificationContent,
      schedule: freezed == schedule
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as NotificationSchedule?,
      actionButtons: freezed == actionButtons
          ? _value._actionButtons
          : actionButtons // ignore: cast_nullable_to_non_nullable
              as List<NotificationActionButton>?,
    ));
  }
}

/// @nodoc

class _$_CreateNotification implements _CreateNotification {
  const _$_CreateNotification(
      {required this.content,
      this.schedule,
      final List<NotificationActionButton>? actionButtons})
      : _actionButtons = actionButtons;

  @override
  final NotificationContent content;
  @override
  final NotificationSchedule? schedule;
  final List<NotificationActionButton>? _actionButtons;
  @override
  List<NotificationActionButton>? get actionButtons {
    final value = _actionButtons;
    if (value == null) return null;
    if (_actionButtons is EqualUnmodifiableListView) return _actionButtons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AppEvent.createNotification(content: $content, schedule: $schedule, actionButtons: $actionButtons)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateNotification &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.schedule, schedule) ||
                other.schedule == schedule) &&
            const DeepCollectionEquality()
                .equals(other._actionButtons, _actionButtons));
  }

  @override
  int get hashCode => Object.hash(runtimeType, content, schedule,
      const DeepCollectionEquality().hash(_actionButtons));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateNotificationCopyWith<_$_CreateNotification> get copyWith =>
      __$$_CreateNotificationCopyWithImpl<_$_CreateNotification>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
            NotificationContent content,
            NotificationSchedule? schedule,
            List<NotificationActionButton>? actionButtons)
        createNotification,
    required TResult Function(ReceivedAction action) notificationClicked,
  }) {
    return createNotification(content, schedule, actionButtons);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(
            NotificationContent content,
            NotificationSchedule? schedule,
            List<NotificationActionButton>? actionButtons)?
        createNotification,
    TResult? Function(ReceivedAction action)? notificationClicked,
  }) {
    return createNotification?.call(content, schedule, actionButtons);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(
            NotificationContent content,
            NotificationSchedule? schedule,
            List<NotificationActionButton>? actionButtons)?
        createNotification,
    TResult Function(ReceivedAction action)? notificationClicked,
    required TResult orElse(),
  }) {
    if (createNotification != null) {
      return createNotification(content, schedule, actionButtons);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_CreateNotification value) createNotification,
    required TResult Function(_NotificationClicked value) notificationClicked,
  }) {
    return createNotification(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_CreateNotification value)? createNotification,
    TResult? Function(_NotificationClicked value)? notificationClicked,
  }) {
    return createNotification?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CreateNotification value)? createNotification,
    TResult Function(_NotificationClicked value)? notificationClicked,
    required TResult orElse(),
  }) {
    if (createNotification != null) {
      return createNotification(this);
    }
    return orElse();
  }
}

abstract class _CreateNotification implements AppEvent {
  const factory _CreateNotification(
          {required final NotificationContent content,
          final NotificationSchedule? schedule,
          final List<NotificationActionButton>? actionButtons}) =
      _$_CreateNotification;

  NotificationContent get content;
  NotificationSchedule? get schedule;
  List<NotificationActionButton>? get actionButtons;
  @JsonKey(ignore: true)
  _$$_CreateNotificationCopyWith<_$_CreateNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_NotificationClickedCopyWith<$Res> {
  factory _$$_NotificationClickedCopyWith(_$_NotificationClicked value,
          $Res Function(_$_NotificationClicked) then) =
      __$$_NotificationClickedCopyWithImpl<$Res>;
  @useResult
  $Res call({ReceivedAction action});
}

/// @nodoc
class __$$_NotificationClickedCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$_NotificationClicked>
    implements _$$_NotificationClickedCopyWith<$Res> {
  __$$_NotificationClickedCopyWithImpl(_$_NotificationClicked _value,
      $Res Function(_$_NotificationClicked) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = null,
  }) {
    return _then(_$_NotificationClicked(
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as ReceivedAction,
    ));
  }
}

/// @nodoc

class _$_NotificationClicked implements _NotificationClicked {
  const _$_NotificationClicked({required this.action});

  @override
  final ReceivedAction action;

  @override
  String toString() {
    return 'AppEvent.notificationClicked(action: $action)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotificationClicked &&
            (identical(other.action, action) || other.action == action));
  }

  @override
  int get hashCode => Object.hash(runtimeType, action);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotificationClickedCopyWith<_$_NotificationClicked> get copyWith =>
      __$$_NotificationClickedCopyWithImpl<_$_NotificationClicked>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
            NotificationContent content,
            NotificationSchedule? schedule,
            List<NotificationActionButton>? actionButtons)
        createNotification,
    required TResult Function(ReceivedAction action) notificationClicked,
  }) {
    return notificationClicked(action);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(
            NotificationContent content,
            NotificationSchedule? schedule,
            List<NotificationActionButton>? actionButtons)?
        createNotification,
    TResult? Function(ReceivedAction action)? notificationClicked,
  }) {
    return notificationClicked?.call(action);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(
            NotificationContent content,
            NotificationSchedule? schedule,
            List<NotificationActionButton>? actionButtons)?
        createNotification,
    TResult Function(ReceivedAction action)? notificationClicked,
    required TResult orElse(),
  }) {
    if (notificationClicked != null) {
      return notificationClicked(action);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_CreateNotification value) createNotification,
    required TResult Function(_NotificationClicked value) notificationClicked,
  }) {
    return notificationClicked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_CreateNotification value)? createNotification,
    TResult? Function(_NotificationClicked value)? notificationClicked,
  }) {
    return notificationClicked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CreateNotification value)? createNotification,
    TResult Function(_NotificationClicked value)? notificationClicked,
    required TResult orElse(),
  }) {
    if (notificationClicked != null) {
      return notificationClicked(this);
    }
    return orElse();
  }
}

abstract class _NotificationClicked implements AppEvent {
  const factory _NotificationClicked({required final ReceivedAction action}) =
      _$_NotificationClicked;

  ReceivedAction get action;
  @JsonKey(ignore: true)
  _$$_NotificationClickedCopyWith<_$_NotificationClicked> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AppState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unknown,
    required TResult Function(
            List<User> users, User currentUser, String? deferredPath)
        authenticated,
    required TResult Function() unAuthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unknown,
    TResult? Function(List<User> users, User currentUser, String? deferredPath)?
        authenticated,
    TResult? Function()? unAuthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function(List<User> users, User currentUser, String? deferredPath)?
        authenticated,
    TResult Function()? unAuthenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Unknown value) unknown,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(UnAuthenticated value) unAuthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Unknown value)? unknown,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(UnAuthenticated value)? unAuthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Unknown value)? unknown,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(UnAuthenticated value)? unAuthenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res, AppState>;
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res, $Val extends AppState>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UnknownCopyWith<$Res> {
  factory _$$UnknownCopyWith(_$Unknown value, $Res Function(_$Unknown) then) =
      __$$UnknownCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnknownCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$Unknown>
    implements _$$UnknownCopyWith<$Res> {
  __$$UnknownCopyWithImpl(_$Unknown _value, $Res Function(_$Unknown) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Unknown implements Unknown {
  const _$Unknown();

  @override
  String toString() {
    return 'AppState.unknown()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Unknown);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unknown,
    required TResult Function(
            List<User> users, User currentUser, String? deferredPath)
        authenticated,
    required TResult Function() unAuthenticated,
  }) {
    return unknown();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unknown,
    TResult? Function(List<User> users, User currentUser, String? deferredPath)?
        authenticated,
    TResult? Function()? unAuthenticated,
  }) {
    return unknown?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function(List<User> users, User currentUser, String? deferredPath)?
        authenticated,
    TResult Function()? unAuthenticated,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Unknown value) unknown,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(UnAuthenticated value) unAuthenticated,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Unknown value)? unknown,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(UnAuthenticated value)? unAuthenticated,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Unknown value)? unknown,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(UnAuthenticated value)? unAuthenticated,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class Unknown implements AppState {
  const factory Unknown() = _$Unknown;
}

/// @nodoc
abstract class _$$AuthenticatedCopyWith<$Res> {
  factory _$$AuthenticatedCopyWith(
          _$Authenticated value, $Res Function(_$Authenticated) then) =
      __$$AuthenticatedCopyWithImpl<$Res>;
  @useResult
  $Res call({List<User> users, User currentUser, String? deferredPath});
}

/// @nodoc
class __$$AuthenticatedCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$Authenticated>
    implements _$$AuthenticatedCopyWith<$Res> {
  __$$AuthenticatedCopyWithImpl(
      _$Authenticated _value, $Res Function(_$Authenticated) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = null,
    Object? currentUser = null,
    Object? deferredPath = freezed,
  }) {
    return _then(_$Authenticated(
      users: null == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<User>,
      currentUser: null == currentUser
          ? _value.currentUser
          : currentUser // ignore: cast_nullable_to_non_nullable
              as User,
      deferredPath: freezed == deferredPath
          ? _value.deferredPath
          : deferredPath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$Authenticated implements Authenticated {
  const _$Authenticated(
      {required final List<User> users,
      required this.currentUser,
      this.deferredPath})
      : _users = users;

  final List<User> _users;
  @override
  List<User> get users {
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  @override
  final User currentUser;
  @override
  final String? deferredPath;

  @override
  String toString() {
    return 'AppState.authenticated(users: $users, currentUser: $currentUser, deferredPath: $deferredPath)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Authenticated &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            (identical(other.currentUser, currentUser) ||
                other.currentUser == currentUser) &&
            (identical(other.deferredPath, deferredPath) ||
                other.deferredPath == deferredPath));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_users), currentUser, deferredPath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthenticatedCopyWith<_$Authenticated> get copyWith =>
      __$$AuthenticatedCopyWithImpl<_$Authenticated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unknown,
    required TResult Function(
            List<User> users, User currentUser, String? deferredPath)
        authenticated,
    required TResult Function() unAuthenticated,
  }) {
    return authenticated(users, currentUser, deferredPath);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unknown,
    TResult? Function(List<User> users, User currentUser, String? deferredPath)?
        authenticated,
    TResult? Function()? unAuthenticated,
  }) {
    return authenticated?.call(users, currentUser, deferredPath);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function(List<User> users, User currentUser, String? deferredPath)?
        authenticated,
    TResult Function()? unAuthenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(users, currentUser, deferredPath);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Unknown value) unknown,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(UnAuthenticated value) unAuthenticated,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Unknown value)? unknown,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(UnAuthenticated value)? unAuthenticated,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Unknown value)? unknown,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(UnAuthenticated value)? unAuthenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class Authenticated implements AppState {
  const factory Authenticated(
      {required final List<User> users,
      required final User currentUser,
      final String? deferredPath}) = _$Authenticated;

  List<User> get users;
  User get currentUser;
  String? get deferredPath;
  @JsonKey(ignore: true)
  _$$AuthenticatedCopyWith<_$Authenticated> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnAuthenticatedCopyWith<$Res> {
  factory _$$UnAuthenticatedCopyWith(
          _$UnAuthenticated value, $Res Function(_$UnAuthenticated) then) =
      __$$UnAuthenticatedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnAuthenticatedCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$UnAuthenticated>
    implements _$$UnAuthenticatedCopyWith<$Res> {
  __$$UnAuthenticatedCopyWithImpl(
      _$UnAuthenticated _value, $Res Function(_$UnAuthenticated) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UnAuthenticated implements UnAuthenticated {
  const _$UnAuthenticated();

  @override
  String toString() {
    return 'AppState.unAuthenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnAuthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unknown,
    required TResult Function(
            List<User> users, User currentUser, String? deferredPath)
        authenticated,
    required TResult Function() unAuthenticated,
  }) {
    return unAuthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unknown,
    TResult? Function(List<User> users, User currentUser, String? deferredPath)?
        authenticated,
    TResult? Function()? unAuthenticated,
  }) {
    return unAuthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function(List<User> users, User currentUser, String? deferredPath)?
        authenticated,
    TResult Function()? unAuthenticated,
    required TResult orElse(),
  }) {
    if (unAuthenticated != null) {
      return unAuthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Unknown value) unknown,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(UnAuthenticated value) unAuthenticated,
  }) {
    return unAuthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Unknown value)? unknown,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(UnAuthenticated value)? unAuthenticated,
  }) {
    return unAuthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Unknown value)? unknown,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(UnAuthenticated value)? unAuthenticated,
    required TResult orElse(),
  }) {
    if (unAuthenticated != null) {
      return unAuthenticated(this);
    }
    return orElse();
  }
}

abstract class UnAuthenticated implements AppState {
  const factory UnAuthenticated() = _$UnAuthenticated;
}
