// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String name) roomCreated,
    required TResult Function() refresh,
    required TResult Function(UserEntity userEntity, RoomEntity roomEntity)
        roomJoinden,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String name)? roomCreated,
    TResult? Function()? refresh,
    TResult? Function(UserEntity userEntity, RoomEntity roomEntity)?
        roomJoinden,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String name)? roomCreated,
    TResult Function()? refresh,
    TResult Function(UserEntity userEntity, RoomEntity roomEntity)? roomJoinden,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_RoomCreated value) roomCreated,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_RoomJoined value) roomJoinden,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_RoomCreated value)? roomCreated,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_RoomJoined value)? roomJoinden,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_RoomCreated value)? roomCreated,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_RoomJoined value)? roomJoinden,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeEventCopyWith<$Res> {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) then) =
      _$HomeEventCopyWithImpl<$Res, HomeEvent>;
}

/// @nodoc
class _$HomeEventCopyWithImpl<$Res, $Val extends HomeEvent>
    implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'HomeEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String name) roomCreated,
    required TResult Function() refresh,
    required TResult Function(UserEntity userEntity, RoomEntity roomEntity)
        roomJoinden,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String name)? roomCreated,
    TResult? Function()? refresh,
    TResult? Function(UserEntity userEntity, RoomEntity roomEntity)?
        roomJoinden,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String name)? roomCreated,
    TResult Function()? refresh,
    TResult Function(UserEntity userEntity, RoomEntity roomEntity)? roomJoinden,
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
    required TResult Function(_RoomCreated value) roomCreated,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_RoomJoined value) roomJoinden,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_RoomCreated value)? roomCreated,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_RoomJoined value)? roomJoinden,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_RoomCreated value)? roomCreated,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_RoomJoined value)? roomJoinden,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements HomeEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$RoomCreatedImplCopyWith<$Res> {
  factory _$$RoomCreatedImplCopyWith(
          _$RoomCreatedImpl value, $Res Function(_$RoomCreatedImpl) then) =
      __$$RoomCreatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$RoomCreatedImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$RoomCreatedImpl>
    implements _$$RoomCreatedImplCopyWith<$Res> {
  __$$RoomCreatedImplCopyWithImpl(
      _$RoomCreatedImpl _value, $Res Function(_$RoomCreatedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$RoomCreatedImpl(
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RoomCreatedImpl implements _RoomCreated {
  const _$RoomCreatedImpl(this.name);

  @override
  final String name;

  @override
  String toString() {
    return 'HomeEvent.roomCreated(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomCreatedImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoomCreatedImplCopyWith<_$RoomCreatedImpl> get copyWith =>
      __$$RoomCreatedImplCopyWithImpl<_$RoomCreatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String name) roomCreated,
    required TResult Function() refresh,
    required TResult Function(UserEntity userEntity, RoomEntity roomEntity)
        roomJoinden,
  }) {
    return roomCreated(name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String name)? roomCreated,
    TResult? Function()? refresh,
    TResult? Function(UserEntity userEntity, RoomEntity roomEntity)?
        roomJoinden,
  }) {
    return roomCreated?.call(name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String name)? roomCreated,
    TResult Function()? refresh,
    TResult Function(UserEntity userEntity, RoomEntity roomEntity)? roomJoinden,
    required TResult orElse(),
  }) {
    if (roomCreated != null) {
      return roomCreated(name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_RoomCreated value) roomCreated,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_RoomJoined value) roomJoinden,
  }) {
    return roomCreated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_RoomCreated value)? roomCreated,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_RoomJoined value)? roomJoinden,
  }) {
    return roomCreated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_RoomCreated value)? roomCreated,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_RoomJoined value)? roomJoinden,
    required TResult orElse(),
  }) {
    if (roomCreated != null) {
      return roomCreated(this);
    }
    return orElse();
  }
}

abstract class _RoomCreated implements HomeEvent {
  const factory _RoomCreated(final String name) = _$RoomCreatedImpl;

  String get name;
  @JsonKey(ignore: true)
  _$$RoomCreatedImplCopyWith<_$RoomCreatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshImplCopyWith<$Res> {
  factory _$$RefreshImplCopyWith(
          _$RefreshImpl value, $Res Function(_$RefreshImpl) then) =
      __$$RefreshImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$RefreshImpl>
    implements _$$RefreshImplCopyWith<$Res> {
  __$$RefreshImplCopyWithImpl(
      _$RefreshImpl _value, $Res Function(_$RefreshImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RefreshImpl implements _Refresh {
  const _$RefreshImpl();

  @override
  String toString() {
    return 'HomeEvent.refresh()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RefreshImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String name) roomCreated,
    required TResult Function() refresh,
    required TResult Function(UserEntity userEntity, RoomEntity roomEntity)
        roomJoinden,
  }) {
    return refresh();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String name)? roomCreated,
    TResult? Function()? refresh,
    TResult? Function(UserEntity userEntity, RoomEntity roomEntity)?
        roomJoinden,
  }) {
    return refresh?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String name)? roomCreated,
    TResult Function()? refresh,
    TResult Function(UserEntity userEntity, RoomEntity roomEntity)? roomJoinden,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_RoomCreated value) roomCreated,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_RoomJoined value) roomJoinden,
  }) {
    return refresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_RoomCreated value)? roomCreated,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_RoomJoined value)? roomJoinden,
  }) {
    return refresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_RoomCreated value)? roomCreated,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_RoomJoined value)? roomJoinden,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(this);
    }
    return orElse();
  }
}

abstract class _Refresh implements HomeEvent {
  const factory _Refresh() = _$RefreshImpl;
}

/// @nodoc
abstract class _$$RoomJoinedImplCopyWith<$Res> {
  factory _$$RoomJoinedImplCopyWith(
          _$RoomJoinedImpl value, $Res Function(_$RoomJoinedImpl) then) =
      __$$RoomJoinedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserEntity userEntity, RoomEntity roomEntity});

  $UserEntityCopyWith<$Res> get userEntity;
  $RoomEntityCopyWith<$Res> get roomEntity;
}

/// @nodoc
class __$$RoomJoinedImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$RoomJoinedImpl>
    implements _$$RoomJoinedImplCopyWith<$Res> {
  __$$RoomJoinedImplCopyWithImpl(
      _$RoomJoinedImpl _value, $Res Function(_$RoomJoinedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userEntity = null,
    Object? roomEntity = null,
  }) {
    return _then(_$RoomJoinedImpl(
      null == userEntity
          ? _value.userEntity
          : userEntity // ignore: cast_nullable_to_non_nullable
              as UserEntity,
      null == roomEntity
          ? _value.roomEntity
          : roomEntity // ignore: cast_nullable_to_non_nullable
              as RoomEntity,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserEntityCopyWith<$Res> get userEntity {
    return $UserEntityCopyWith<$Res>(_value.userEntity, (value) {
      return _then(_value.copyWith(userEntity: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RoomEntityCopyWith<$Res> get roomEntity {
    return $RoomEntityCopyWith<$Res>(_value.roomEntity, (value) {
      return _then(_value.copyWith(roomEntity: value));
    });
  }
}

/// @nodoc

class _$RoomJoinedImpl implements _RoomJoined {
  const _$RoomJoinedImpl(this.userEntity, this.roomEntity);

  @override
  final UserEntity userEntity;
  @override
  final RoomEntity roomEntity;

  @override
  String toString() {
    return 'HomeEvent.roomJoinden(userEntity: $userEntity, roomEntity: $roomEntity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomJoinedImpl &&
            (identical(other.userEntity, userEntity) ||
                other.userEntity == userEntity) &&
            (identical(other.roomEntity, roomEntity) ||
                other.roomEntity == roomEntity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userEntity, roomEntity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoomJoinedImplCopyWith<_$RoomJoinedImpl> get copyWith =>
      __$$RoomJoinedImplCopyWithImpl<_$RoomJoinedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String name) roomCreated,
    required TResult Function() refresh,
    required TResult Function(UserEntity userEntity, RoomEntity roomEntity)
        roomJoinden,
  }) {
    return roomJoinden(userEntity, roomEntity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String name)? roomCreated,
    TResult? Function()? refresh,
    TResult? Function(UserEntity userEntity, RoomEntity roomEntity)?
        roomJoinden,
  }) {
    return roomJoinden?.call(userEntity, roomEntity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String name)? roomCreated,
    TResult Function()? refresh,
    TResult Function(UserEntity userEntity, RoomEntity roomEntity)? roomJoinden,
    required TResult orElse(),
  }) {
    if (roomJoinden != null) {
      return roomJoinden(userEntity, roomEntity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_RoomCreated value) roomCreated,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_RoomJoined value) roomJoinden,
  }) {
    return roomJoinden(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_RoomCreated value)? roomCreated,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_RoomJoined value)? roomJoinden,
  }) {
    return roomJoinden?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_RoomCreated value)? roomCreated,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_RoomJoined value)? roomJoinden,
    required TResult orElse(),
  }) {
    if (roomJoinden != null) {
      return roomJoinden(this);
    }
    return orElse();
  }
}

abstract class _RoomJoined implements HomeEvent {
  const factory _RoomJoined(
          final UserEntity userEntity, final RoomEntity roomEntity) =
      _$RoomJoinedImpl;

  UserEntity get userEntity;
  RoomEntity get roomEntity;
  @JsonKey(ignore: true)
  _$$RoomJoinedImplCopyWith<_$RoomJoinedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HomeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<RoomEntity> rooms) success,
    required TResult Function() loadInProgress,
    required TResult Function(WebSocketChannel webSocketChannel,
            UserEntity userEntity, RoomEntity roomEntity)
        joinRoom,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<RoomEntity> rooms)? success,
    TResult? Function()? loadInProgress,
    TResult? Function(WebSocketChannel webSocketChannel, UserEntity userEntity,
            RoomEntity roomEntity)?
        joinRoom,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<RoomEntity> rooms)? success,
    TResult Function()? loadInProgress,
    TResult Function(WebSocketChannel webSocketChannel, UserEntity userEntity,
            RoomEntity roomEntity)?
        joinRoom,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Success value) success,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_JoinRoom value) joinRoom,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Success value)? success,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_JoinRoom value)? joinRoom,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Success value)? success,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_JoinRoom value)? joinRoom,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'HomeState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<RoomEntity> rooms) success,
    required TResult Function() loadInProgress,
    required TResult Function(WebSocketChannel webSocketChannel,
            UserEntity userEntity, RoomEntity roomEntity)
        joinRoom,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<RoomEntity> rooms)? success,
    TResult? Function()? loadInProgress,
    TResult? Function(WebSocketChannel webSocketChannel, UserEntity userEntity,
            RoomEntity roomEntity)?
        joinRoom,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<RoomEntity> rooms)? success,
    TResult Function()? loadInProgress,
    TResult Function(WebSocketChannel webSocketChannel, UserEntity userEntity,
            RoomEntity roomEntity)?
        joinRoom,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Success value) success,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_JoinRoom value) joinRoom,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Success value)? success,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_JoinRoom value)? joinRoom,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Success value)? success,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_JoinRoom value)? joinRoom,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements HomeState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<RoomEntity> rooms});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rooms = null,
  }) {
    return _then(_$SuccessImpl(
      null == rooms
          ? _value._rooms
          : rooms // ignore: cast_nullable_to_non_nullable
              as List<RoomEntity>,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(final List<RoomEntity> rooms) : _rooms = rooms;

  final List<RoomEntity> _rooms;
  @override
  List<RoomEntity> get rooms {
    if (_rooms is EqualUnmodifiableListView) return _rooms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rooms);
  }

  @override
  String toString() {
    return 'HomeState.success(rooms: $rooms)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            const DeepCollectionEquality().equals(other._rooms, _rooms));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_rooms));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<RoomEntity> rooms) success,
    required TResult Function() loadInProgress,
    required TResult Function(WebSocketChannel webSocketChannel,
            UserEntity userEntity, RoomEntity roomEntity)
        joinRoom,
  }) {
    return success(rooms);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<RoomEntity> rooms)? success,
    TResult? Function()? loadInProgress,
    TResult? Function(WebSocketChannel webSocketChannel, UserEntity userEntity,
            RoomEntity roomEntity)?
        joinRoom,
  }) {
    return success?.call(rooms);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<RoomEntity> rooms)? success,
    TResult Function()? loadInProgress,
    TResult Function(WebSocketChannel webSocketChannel, UserEntity userEntity,
            RoomEntity roomEntity)?
        joinRoom,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(rooms);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Success value) success,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_JoinRoom value) joinRoom,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Success value)? success,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_JoinRoom value)? joinRoom,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Success value)? success,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_JoinRoom value)? joinRoom,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements HomeState {
  const factory _Success(final List<RoomEntity> rooms) = _$SuccessImpl;

  List<RoomEntity> get rooms;
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadInProgressImplCopyWith<$Res> {
  factory _$$LoadInProgressImplCopyWith(_$LoadInProgressImpl value,
          $Res Function(_$LoadInProgressImpl) then) =
      __$$LoadInProgressImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadInProgressImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$LoadInProgressImpl>
    implements _$$LoadInProgressImplCopyWith<$Res> {
  __$$LoadInProgressImplCopyWithImpl(
      _$LoadInProgressImpl _value, $Res Function(_$LoadInProgressImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadInProgressImpl implements _LoadInProgress {
  const _$LoadInProgressImpl();

  @override
  String toString() {
    return 'HomeState.loadInProgress()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadInProgressImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<RoomEntity> rooms) success,
    required TResult Function() loadInProgress,
    required TResult Function(WebSocketChannel webSocketChannel,
            UserEntity userEntity, RoomEntity roomEntity)
        joinRoom,
  }) {
    return loadInProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<RoomEntity> rooms)? success,
    TResult? Function()? loadInProgress,
    TResult? Function(WebSocketChannel webSocketChannel, UserEntity userEntity,
            RoomEntity roomEntity)?
        joinRoom,
  }) {
    return loadInProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<RoomEntity> rooms)? success,
    TResult Function()? loadInProgress,
    TResult Function(WebSocketChannel webSocketChannel, UserEntity userEntity,
            RoomEntity roomEntity)?
        joinRoom,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Success value) success,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_JoinRoom value) joinRoom,
  }) {
    return loadInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Success value)? success,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_JoinRoom value)? joinRoom,
  }) {
    return loadInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Success value)? success,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_JoinRoom value)? joinRoom,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(this);
    }
    return orElse();
  }
}

abstract class _LoadInProgress implements HomeState {
  const factory _LoadInProgress() = _$LoadInProgressImpl;
}

/// @nodoc
abstract class _$$JoinRoomImplCopyWith<$Res> {
  factory _$$JoinRoomImplCopyWith(
          _$JoinRoomImpl value, $Res Function(_$JoinRoomImpl) then) =
      __$$JoinRoomImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {WebSocketChannel webSocketChannel,
      UserEntity userEntity,
      RoomEntity roomEntity});

  $UserEntityCopyWith<$Res> get userEntity;
  $RoomEntityCopyWith<$Res> get roomEntity;
}

/// @nodoc
class __$$JoinRoomImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$JoinRoomImpl>
    implements _$$JoinRoomImplCopyWith<$Res> {
  __$$JoinRoomImplCopyWithImpl(
      _$JoinRoomImpl _value, $Res Function(_$JoinRoomImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? webSocketChannel = null,
    Object? userEntity = null,
    Object? roomEntity = null,
  }) {
    return _then(_$JoinRoomImpl(
      null == webSocketChannel
          ? _value.webSocketChannel
          : webSocketChannel // ignore: cast_nullable_to_non_nullable
              as WebSocketChannel,
      null == userEntity
          ? _value.userEntity
          : userEntity // ignore: cast_nullable_to_non_nullable
              as UserEntity,
      null == roomEntity
          ? _value.roomEntity
          : roomEntity // ignore: cast_nullable_to_non_nullable
              as RoomEntity,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserEntityCopyWith<$Res> get userEntity {
    return $UserEntityCopyWith<$Res>(_value.userEntity, (value) {
      return _then(_value.copyWith(userEntity: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RoomEntityCopyWith<$Res> get roomEntity {
    return $RoomEntityCopyWith<$Res>(_value.roomEntity, (value) {
      return _then(_value.copyWith(roomEntity: value));
    });
  }
}

/// @nodoc

class _$JoinRoomImpl implements _JoinRoom {
  const _$JoinRoomImpl(this.webSocketChannel, this.userEntity, this.roomEntity);

  @override
  final WebSocketChannel webSocketChannel;
  @override
  final UserEntity userEntity;
  @override
  final RoomEntity roomEntity;

  @override
  String toString() {
    return 'HomeState.joinRoom(webSocketChannel: $webSocketChannel, userEntity: $userEntity, roomEntity: $roomEntity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JoinRoomImpl &&
            (identical(other.webSocketChannel, webSocketChannel) ||
                other.webSocketChannel == webSocketChannel) &&
            (identical(other.userEntity, userEntity) ||
                other.userEntity == userEntity) &&
            (identical(other.roomEntity, roomEntity) ||
                other.roomEntity == roomEntity));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, webSocketChannel, userEntity, roomEntity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JoinRoomImplCopyWith<_$JoinRoomImpl> get copyWith =>
      __$$JoinRoomImplCopyWithImpl<_$JoinRoomImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<RoomEntity> rooms) success,
    required TResult Function() loadInProgress,
    required TResult Function(WebSocketChannel webSocketChannel,
            UserEntity userEntity, RoomEntity roomEntity)
        joinRoom,
  }) {
    return joinRoom(webSocketChannel, userEntity, roomEntity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<RoomEntity> rooms)? success,
    TResult? Function()? loadInProgress,
    TResult? Function(WebSocketChannel webSocketChannel, UserEntity userEntity,
            RoomEntity roomEntity)?
        joinRoom,
  }) {
    return joinRoom?.call(webSocketChannel, userEntity, roomEntity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<RoomEntity> rooms)? success,
    TResult Function()? loadInProgress,
    TResult Function(WebSocketChannel webSocketChannel, UserEntity userEntity,
            RoomEntity roomEntity)?
        joinRoom,
    required TResult orElse(),
  }) {
    if (joinRoom != null) {
      return joinRoom(webSocketChannel, userEntity, roomEntity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Success value) success,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_JoinRoom value) joinRoom,
  }) {
    return joinRoom(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Success value)? success,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_JoinRoom value)? joinRoom,
  }) {
    return joinRoom?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Success value)? success,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_JoinRoom value)? joinRoom,
    required TResult orElse(),
  }) {
    if (joinRoom != null) {
      return joinRoom(this);
    }
    return orElse();
  }
}

abstract class _JoinRoom implements HomeState {
  const factory _JoinRoom(
      final WebSocketChannel webSocketChannel,
      final UserEntity userEntity,
      final RoomEntity roomEntity) = _$JoinRoomImpl;

  WebSocketChannel get webSocketChannel;
  UserEntity get userEntity;
  RoomEntity get roomEntity;
  @JsonKey(ignore: true)
  _$$JoinRoomImplCopyWith<_$JoinRoomImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
