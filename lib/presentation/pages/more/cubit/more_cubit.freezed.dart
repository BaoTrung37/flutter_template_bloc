// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'more_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MoreState {
  AppStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MoreStateCopyWith<MoreState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoreStateCopyWith<$Res> {
  factory $MoreStateCopyWith(MoreState value, $Res Function(MoreState) then) =
      _$MoreStateCopyWithImpl<$Res, MoreState>;
  @useResult
  $Res call({AppStatus status});
}

/// @nodoc
class _$MoreStateCopyWithImpl<$Res, $Val extends MoreState>
    implements $MoreStateCopyWith<$Res> {
  _$MoreStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AppStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MoreStateImplCopyWith<$Res>
    implements $MoreStateCopyWith<$Res> {
  factory _$$MoreStateImplCopyWith(
          _$MoreStateImpl value, $Res Function(_$MoreStateImpl) then) =
      __$$MoreStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AppStatus status});
}

/// @nodoc
class __$$MoreStateImplCopyWithImpl<$Res>
    extends _$MoreStateCopyWithImpl<$Res, _$MoreStateImpl>
    implements _$$MoreStateImplCopyWith<$Res> {
  __$$MoreStateImplCopyWithImpl(
      _$MoreStateImpl _value, $Res Function(_$MoreStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_$MoreStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AppStatus,
    ));
  }
}

/// @nodoc

class _$MoreStateImpl implements _MoreState {
  const _$MoreStateImpl({this.status = AppStatus.initial});

  @override
  @JsonKey()
  final AppStatus status;

  @override
  String toString() {
    return 'MoreState(status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MoreStateImpl &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MoreStateImplCopyWith<_$MoreStateImpl> get copyWith =>
      __$$MoreStateImplCopyWithImpl<_$MoreStateImpl>(this, _$identity);
}

abstract class _MoreState implements MoreState {
  const factory _MoreState({final AppStatus status}) = _$MoreStateImpl;

  @override
  AppStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$MoreStateImplCopyWith<_$MoreStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
