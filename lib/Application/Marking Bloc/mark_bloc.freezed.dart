// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mark_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MarkEvent {
  bool get ontap => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool ontap) started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool ontap)? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool ontap)? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MarkEventCopyWith<MarkEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarkEventCopyWith<$Res> {
  factory $MarkEventCopyWith(MarkEvent value, $Res Function(MarkEvent) then) =
      _$MarkEventCopyWithImpl<$Res, MarkEvent>;
  @useResult
  $Res call({bool ontap});
}

/// @nodoc
class _$MarkEventCopyWithImpl<$Res, $Val extends MarkEvent>
    implements $MarkEventCopyWith<$Res> {
  _$MarkEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ontap = null,
  }) {
    return _then(_value.copyWith(
      ontap: null == ontap
          ? _value.ontap
          : ontap // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res>
    implements $MarkEventCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool ontap});
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$MarkEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ontap = null,
  }) {
    return _then(_$StartedImpl(
      ontap: null == ontap
          ? _value.ontap
          : ontap // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl({required this.ontap});

  @override
  final bool ontap;

  @override
  String toString() {
    return 'MarkEvent.started(ontap: $ontap)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartedImpl &&
            (identical(other.ontap, ontap) || other.ontap == ontap));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ontap);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StartedImplCopyWith<_$StartedImpl> get copyWith =>
      __$$StartedImplCopyWithImpl<_$StartedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool ontap) started,
  }) {
    return started(ontap);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool ontap)? started,
  }) {
    return started?.call(ontap);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool ontap)? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(ontap);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements MarkEvent {
  const factory _Started({required final bool ontap}) = _$StartedImpl;

  @override
  bool get ontap;
  @override
  @JsonKey(ignore: true)
  _$$StartedImplCopyWith<_$StartedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MarkState {
  bool get onTap => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MarkStateCopyWith<MarkState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarkStateCopyWith<$Res> {
  factory $MarkStateCopyWith(MarkState value, $Res Function(MarkState) then) =
      _$MarkStateCopyWithImpl<$Res, MarkState>;
  @useResult
  $Res call({bool onTap});
}

/// @nodoc
class _$MarkStateCopyWithImpl<$Res, $Val extends MarkState>
    implements $MarkStateCopyWith<$Res> {
  _$MarkStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? onTap = null,
  }) {
    return _then(_value.copyWith(
      onTap: null == onTap
          ? _value.onTap
          : onTap // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MarkStateImplCopyWith<$Res>
    implements $MarkStateCopyWith<$Res> {
  factory _$$MarkStateImplCopyWith(
          _$MarkStateImpl value, $Res Function(_$MarkStateImpl) then) =
      __$$MarkStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool onTap});
}

/// @nodoc
class __$$MarkStateImplCopyWithImpl<$Res>
    extends _$MarkStateCopyWithImpl<$Res, _$MarkStateImpl>
    implements _$$MarkStateImplCopyWith<$Res> {
  __$$MarkStateImplCopyWithImpl(
      _$MarkStateImpl _value, $Res Function(_$MarkStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? onTap = null,
  }) {
    return _then(_$MarkStateImpl(
      onTap: null == onTap
          ? _value.onTap
          : onTap // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$MarkStateImpl implements _MarkState {
  const _$MarkStateImpl({required this.onTap});

  @override
  final bool onTap;

  @override
  String toString() {
    return 'MarkState(onTap: $onTap)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarkStateImpl &&
            (identical(other.onTap, onTap) || other.onTap == onTap));
  }

  @override
  int get hashCode => Object.hash(runtimeType, onTap);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MarkStateImplCopyWith<_$MarkStateImpl> get copyWith =>
      __$$MarkStateImplCopyWithImpl<_$MarkStateImpl>(this, _$identity);
}

abstract class _MarkState implements MarkState {
  const factory _MarkState({required final bool onTap}) = _$MarkStateImpl;

  @override
  bool get onTap;
  @override
  @JsonKey(ignore: true)
  _$$MarkStateImplCopyWith<_$MarkStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
