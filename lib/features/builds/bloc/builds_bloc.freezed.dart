// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'builds_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BuildsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String owner, String repoName) started,
    required TResult Function(String owner, String repoName) loadMoreBuilds,
    required TResult Function(DroneRepo repo) newBuild,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String owner, String repoName)? started,
    TResult? Function(String owner, String repoName)? loadMoreBuilds,
    TResult? Function(DroneRepo repo)? newBuild,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String owner, String repoName)? started,
    TResult Function(String owner, String repoName)? loadMoreBuilds,
    TResult Function(DroneRepo repo)? newBuild,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_LoadMoreBuilds value) loadMoreBuilds,
    required TResult Function(_NewBuild value) newBuild,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_LoadMoreBuilds value)? loadMoreBuilds,
    TResult? Function(_NewBuild value)? newBuild,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LoadMoreBuilds value)? loadMoreBuilds,
    TResult Function(_NewBuild value)? newBuild,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BuildsEventCopyWith<$Res> {
  factory $BuildsEventCopyWith(
          BuildsEvent value, $Res Function(BuildsEvent) then) =
      _$BuildsEventCopyWithImpl<$Res, BuildsEvent>;
}

/// @nodoc
class _$BuildsEventCopyWithImpl<$Res, $Val extends BuildsEvent>
    implements $BuildsEventCopyWith<$Res> {
  _$BuildsEventCopyWithImpl(this._value, this._then);

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
  @useResult
  $Res call({String owner, String repoName});
}

/// @nodoc
class __$$_StartedCopyWithImpl<$Res>
    extends _$BuildsEventCopyWithImpl<$Res, _$_Started>
    implements _$$_StartedCopyWith<$Res> {
  __$$_StartedCopyWithImpl(_$_Started _value, $Res Function(_$_Started) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? owner = null,
    Object? repoName = null,
  }) {
    return _then(_$_Started(
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as String,
      repoName: null == repoName
          ? _value.repoName
          : repoName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started({required this.owner, required this.repoName});

  @override
  final String owner;
  @override
  final String repoName;

  @override
  String toString() {
    return 'BuildsEvent.started(owner: $owner, repoName: $repoName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Started &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.repoName, repoName) ||
                other.repoName == repoName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, owner, repoName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StartedCopyWith<_$_Started> get copyWith =>
      __$$_StartedCopyWithImpl<_$_Started>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String owner, String repoName) started,
    required TResult Function(String owner, String repoName) loadMoreBuilds,
    required TResult Function(DroneRepo repo) newBuild,
  }) {
    return started(owner, repoName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String owner, String repoName)? started,
    TResult? Function(String owner, String repoName)? loadMoreBuilds,
    TResult? Function(DroneRepo repo)? newBuild,
  }) {
    return started?.call(owner, repoName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String owner, String repoName)? started,
    TResult Function(String owner, String repoName)? loadMoreBuilds,
    TResult Function(DroneRepo repo)? newBuild,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(owner, repoName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_LoadMoreBuilds value) loadMoreBuilds,
    required TResult Function(_NewBuild value) newBuild,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_LoadMoreBuilds value)? loadMoreBuilds,
    TResult? Function(_NewBuild value)? newBuild,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LoadMoreBuilds value)? loadMoreBuilds,
    TResult Function(_NewBuild value)? newBuild,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements BuildsEvent {
  const factory _Started(
      {required final String owner,
      required final String repoName}) = _$_Started;

  String get owner;
  String get repoName;
  @JsonKey(ignore: true)
  _$$_StartedCopyWith<_$_Started> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadMoreBuildsCopyWith<$Res> {
  factory _$$_LoadMoreBuildsCopyWith(
          _$_LoadMoreBuilds value, $Res Function(_$_LoadMoreBuilds) then) =
      __$$_LoadMoreBuildsCopyWithImpl<$Res>;
  @useResult
  $Res call({String owner, String repoName});
}

/// @nodoc
class __$$_LoadMoreBuildsCopyWithImpl<$Res>
    extends _$BuildsEventCopyWithImpl<$Res, _$_LoadMoreBuilds>
    implements _$$_LoadMoreBuildsCopyWith<$Res> {
  __$$_LoadMoreBuildsCopyWithImpl(
      _$_LoadMoreBuilds _value, $Res Function(_$_LoadMoreBuilds) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? owner = null,
    Object? repoName = null,
  }) {
    return _then(_$_LoadMoreBuilds(
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as String,
      repoName: null == repoName
          ? _value.repoName
          : repoName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LoadMoreBuilds implements _LoadMoreBuilds {
  const _$_LoadMoreBuilds({required this.owner, required this.repoName});

  @override
  final String owner;
  @override
  final String repoName;

  @override
  String toString() {
    return 'BuildsEvent.loadMoreBuilds(owner: $owner, repoName: $repoName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadMoreBuilds &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.repoName, repoName) ||
                other.repoName == repoName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, owner, repoName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadMoreBuildsCopyWith<_$_LoadMoreBuilds> get copyWith =>
      __$$_LoadMoreBuildsCopyWithImpl<_$_LoadMoreBuilds>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String owner, String repoName) started,
    required TResult Function(String owner, String repoName) loadMoreBuilds,
    required TResult Function(DroneRepo repo) newBuild,
  }) {
    return loadMoreBuilds(owner, repoName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String owner, String repoName)? started,
    TResult? Function(String owner, String repoName)? loadMoreBuilds,
    TResult? Function(DroneRepo repo)? newBuild,
  }) {
    return loadMoreBuilds?.call(owner, repoName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String owner, String repoName)? started,
    TResult Function(String owner, String repoName)? loadMoreBuilds,
    TResult Function(DroneRepo repo)? newBuild,
    required TResult orElse(),
  }) {
    if (loadMoreBuilds != null) {
      return loadMoreBuilds(owner, repoName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_LoadMoreBuilds value) loadMoreBuilds,
    required TResult Function(_NewBuild value) newBuild,
  }) {
    return loadMoreBuilds(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_LoadMoreBuilds value)? loadMoreBuilds,
    TResult? Function(_NewBuild value)? newBuild,
  }) {
    return loadMoreBuilds?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LoadMoreBuilds value)? loadMoreBuilds,
    TResult Function(_NewBuild value)? newBuild,
    required TResult orElse(),
  }) {
    if (loadMoreBuilds != null) {
      return loadMoreBuilds(this);
    }
    return orElse();
  }
}

abstract class _LoadMoreBuilds implements BuildsEvent {
  const factory _LoadMoreBuilds(
      {required final String owner,
      required final String repoName}) = _$_LoadMoreBuilds;

  String get owner;
  String get repoName;
  @JsonKey(ignore: true)
  _$$_LoadMoreBuildsCopyWith<_$_LoadMoreBuilds> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_NewBuildCopyWith<$Res> {
  factory _$$_NewBuildCopyWith(
          _$_NewBuild value, $Res Function(_$_NewBuild) then) =
      __$$_NewBuildCopyWithImpl<$Res>;
  @useResult
  $Res call({DroneRepo repo});

  $DroneRepoCopyWith<$Res> get repo;
}

/// @nodoc
class __$$_NewBuildCopyWithImpl<$Res>
    extends _$BuildsEventCopyWithImpl<$Res, _$_NewBuild>
    implements _$$_NewBuildCopyWith<$Res> {
  __$$_NewBuildCopyWithImpl(
      _$_NewBuild _value, $Res Function(_$_NewBuild) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? repo = null,
  }) {
    return _then(_$_NewBuild(
      repo: null == repo
          ? _value.repo
          : repo // ignore: cast_nullable_to_non_nullable
              as DroneRepo,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $DroneRepoCopyWith<$Res> get repo {
    return $DroneRepoCopyWith<$Res>(_value.repo, (value) {
      return _then(_value.copyWith(repo: value));
    });
  }
}

/// @nodoc

class _$_NewBuild implements _NewBuild {
  const _$_NewBuild({required this.repo});

  @override
  final DroneRepo repo;

  @override
  String toString() {
    return 'BuildsEvent.newBuild(repo: $repo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NewBuild &&
            (identical(other.repo, repo) || other.repo == repo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, repo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NewBuildCopyWith<_$_NewBuild> get copyWith =>
      __$$_NewBuildCopyWithImpl<_$_NewBuild>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String owner, String repoName) started,
    required TResult Function(String owner, String repoName) loadMoreBuilds,
    required TResult Function(DroneRepo repo) newBuild,
  }) {
    return newBuild(repo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String owner, String repoName)? started,
    TResult? Function(String owner, String repoName)? loadMoreBuilds,
    TResult? Function(DroneRepo repo)? newBuild,
  }) {
    return newBuild?.call(repo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String owner, String repoName)? started,
    TResult Function(String owner, String repoName)? loadMoreBuilds,
    TResult Function(DroneRepo repo)? newBuild,
    required TResult orElse(),
  }) {
    if (newBuild != null) {
      return newBuild(repo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_LoadMoreBuilds value) loadMoreBuilds,
    required TResult Function(_NewBuild value) newBuild,
  }) {
    return newBuild(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_LoadMoreBuilds value)? loadMoreBuilds,
    TResult? Function(_NewBuild value)? newBuild,
  }) {
    return newBuild?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LoadMoreBuilds value)? loadMoreBuilds,
    TResult Function(_NewBuild value)? newBuild,
    required TResult orElse(),
  }) {
    if (newBuild != null) {
      return newBuild(this);
    }
    return orElse();
  }
}

abstract class _NewBuild implements BuildsEvent {
  const factory _NewBuild({required final DroneRepo repo}) = _$_NewBuild;

  DroneRepo get repo;
  @JsonKey(ignore: true)
  _$$_NewBuildCopyWith<_$_NewBuild> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BuildsState {
  Status get status => throw _privateConstructorUsedError;
  List<DroneBuild> get builds => throw _privateConstructorUsedError;
  DroneRepo? get latestRepo => throw _privateConstructorUsedError;
  bool get isReachedMax => throw _privateConstructorUsedError;
  bool get isLoadingMore => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BuildsStateCopyWith<BuildsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BuildsStateCopyWith<$Res> {
  factory $BuildsStateCopyWith(
          BuildsState value, $Res Function(BuildsState) then) =
      _$BuildsStateCopyWithImpl<$Res, BuildsState>;
  @useResult
  $Res call(
      {Status status,
      List<DroneBuild> builds,
      DroneRepo? latestRepo,
      bool isReachedMax,
      bool isLoadingMore});

  $DroneRepoCopyWith<$Res>? get latestRepo;
}

/// @nodoc
class _$BuildsStateCopyWithImpl<$Res, $Val extends BuildsState>
    implements $BuildsStateCopyWith<$Res> {
  _$BuildsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? builds = null,
    Object? latestRepo = freezed,
    Object? isReachedMax = null,
    Object? isLoadingMore = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      builds: null == builds
          ? _value.builds
          : builds // ignore: cast_nullable_to_non_nullable
              as List<DroneBuild>,
      latestRepo: freezed == latestRepo
          ? _value.latestRepo
          : latestRepo // ignore: cast_nullable_to_non_nullable
              as DroneRepo?,
      isReachedMax: null == isReachedMax
          ? _value.isReachedMax
          : isReachedMax // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMore: null == isLoadingMore
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DroneRepoCopyWith<$Res>? get latestRepo {
    if (_value.latestRepo == null) {
      return null;
    }

    return $DroneRepoCopyWith<$Res>(_value.latestRepo!, (value) {
      return _then(_value.copyWith(latestRepo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_BuildsStateCopyWith<$Res>
    implements $BuildsStateCopyWith<$Res> {
  factory _$$_BuildsStateCopyWith(
          _$_BuildsState value, $Res Function(_$_BuildsState) then) =
      __$$_BuildsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Status status,
      List<DroneBuild> builds,
      DroneRepo? latestRepo,
      bool isReachedMax,
      bool isLoadingMore});

  @override
  $DroneRepoCopyWith<$Res>? get latestRepo;
}

/// @nodoc
class __$$_BuildsStateCopyWithImpl<$Res>
    extends _$BuildsStateCopyWithImpl<$Res, _$_BuildsState>
    implements _$$_BuildsStateCopyWith<$Res> {
  __$$_BuildsStateCopyWithImpl(
      _$_BuildsState _value, $Res Function(_$_BuildsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? builds = null,
    Object? latestRepo = freezed,
    Object? isReachedMax = null,
    Object? isLoadingMore = null,
  }) {
    return _then(_$_BuildsState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      builds: null == builds
          ? _value._builds
          : builds // ignore: cast_nullable_to_non_nullable
              as List<DroneBuild>,
      latestRepo: freezed == latestRepo
          ? _value.latestRepo
          : latestRepo // ignore: cast_nullable_to_non_nullable
              as DroneRepo?,
      isReachedMax: null == isReachedMax
          ? _value.isReachedMax
          : isReachedMax // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMore: null == isLoadingMore
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_BuildsState implements _BuildsState {
  const _$_BuildsState(
      {required this.status,
      required final List<DroneBuild> builds,
      this.latestRepo,
      required this.isReachedMax,
      required this.isLoadingMore})
      : _builds = builds;

  @override
  final Status status;
  final List<DroneBuild> _builds;
  @override
  List<DroneBuild> get builds {
    if (_builds is EqualUnmodifiableListView) return _builds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_builds);
  }

  @override
  final DroneRepo? latestRepo;
  @override
  final bool isReachedMax;
  @override
  final bool isLoadingMore;

  @override
  String toString() {
    return 'BuildsState(status: $status, builds: $builds, latestRepo: $latestRepo, isReachedMax: $isReachedMax, isLoadingMore: $isLoadingMore)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BuildsState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._builds, _builds) &&
            (identical(other.latestRepo, latestRepo) ||
                other.latestRepo == latestRepo) &&
            (identical(other.isReachedMax, isReachedMax) ||
                other.isReachedMax == isReachedMax) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_builds),
      latestRepo,
      isReachedMax,
      isLoadingMore);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BuildsStateCopyWith<_$_BuildsState> get copyWith =>
      __$$_BuildsStateCopyWithImpl<_$_BuildsState>(this, _$identity);
}

abstract class _BuildsState implements BuildsState {
  const factory _BuildsState(
      {required final Status status,
      required final List<DroneBuild> builds,
      final DroneRepo? latestRepo,
      required final bool isReachedMax,
      required final bool isLoadingMore}) = _$_BuildsState;

  @override
  Status get status;
  @override
  List<DroneBuild> get builds;
  @override
  DroneRepo? get latestRepo;
  @override
  bool get isReachedMax;
  @override
  bool get isLoadingMore;
  @override
  @JsonKey(ignore: true)
  _$$_BuildsStateCopyWith<_$_BuildsState> get copyWith =>
      throw _privateConstructorUsedError;
}
