// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GameEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is GameEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'GameEvent()';
  }
}

/// @nodoc
class $GameEventCopyWith<$Res> {
  $GameEventCopyWith(GameEvent _, $Res Function(GameEvent) __);
}

/// @nodoc

class _Started implements GameEvent {
  const _Started();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'GameEvent.started()';
  }
}

/// @nodoc

class Mark implements GameEvent {
  const Mark({required this.index});

  final int index;

  /// Create a copy of GameEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MarkCopyWith<Mark> get copyWith =>
      _$MarkCopyWithImpl<Mark>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Mark &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @override
  String toString() {
    return 'GameEvent.mark(index: $index)';
  }
}

/// @nodoc
abstract mixin class $MarkCopyWith<$Res> implements $GameEventCopyWith<$Res> {
  factory $MarkCopyWith(Mark value, $Res Function(Mark) _then) =
      _$MarkCopyWithImpl;
  @useResult
  $Res call({int index});
}

/// @nodoc
class _$MarkCopyWithImpl<$Res> implements $MarkCopyWith<$Res> {
  _$MarkCopyWithImpl(this._self, this._then);

  final Mark _self;
  final $Res Function(Mark) _then;

  /// Create a copy of GameEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? index = null,
  }) {
    return _then(Mark(
      index: null == index
          ? _self.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class Reset implements GameEvent {
  const Reset();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Reset);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'GameEvent.reset()';
  }
}

/// @nodoc

class Undo implements GameEvent {
  const Undo();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Undo);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'GameEvent.undo()';
  }
}

/// @nodoc
mixin _$GameState {
  List<String> get numbers;
  List<bool> get isClicked;
  List<bool> get winnibgCombs;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GameStateCopyWith<GameState> get copyWith =>
      _$GameStateCopyWithImpl<GameState>(this as GameState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GameState &&
            const DeepCollectionEquality().equals(other.numbers, numbers) &&
            const DeepCollectionEquality().equals(other.isClicked, isClicked) &&
            const DeepCollectionEquality()
                .equals(other.winnibgCombs, winnibgCombs));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(numbers),
      const DeepCollectionEquality().hash(isClicked),
      const DeepCollectionEquality().hash(winnibgCombs));

  @override
  String toString() {
    return 'GameState(numbers: $numbers, isClicked: $isClicked, winnibgCombs: $winnibgCombs)';
  }
}

/// @nodoc
abstract mixin class $GameStateCopyWith<$Res> {
  factory $GameStateCopyWith(GameState value, $Res Function(GameState) _then) =
      _$GameStateCopyWithImpl;
  @useResult
  $Res call(
      {List<String> numbers, List<bool> isClicked, List<bool> winnibgCombs});
}

/// @nodoc
class _$GameStateCopyWithImpl<$Res> implements $GameStateCopyWith<$Res> {
  _$GameStateCopyWithImpl(this._self, this._then);

  final GameState _self;
  final $Res Function(GameState) _then;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? numbers = null,
    Object? isClicked = null,
    Object? winnibgCombs = null,
  }) {
    return _then(_self.copyWith(
      numbers: null == numbers
          ? _self.numbers
          : numbers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isClicked: null == isClicked
          ? _self.isClicked
          : isClicked // ignore: cast_nullable_to_non_nullable
              as List<bool>,
      winnibgCombs: null == winnibgCombs
          ? _self.winnibgCombs
          : winnibgCombs // ignore: cast_nullable_to_non_nullable
              as List<bool>,
    ));
  }
}

/// @nodoc

class _GameState implements GameState {
  const _GameState(
      {required final List<String> numbers,
      required final List<bool> isClicked,
      required final List<bool> winnibgCombs})
      : _numbers = numbers,
        _isClicked = isClicked,
        _winnibgCombs = winnibgCombs;

  final List<String> _numbers;
  @override
  List<String> get numbers {
    if (_numbers is EqualUnmodifiableListView) return _numbers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_numbers);
  }

  final List<bool> _isClicked;
  @override
  List<bool> get isClicked {
    if (_isClicked is EqualUnmodifiableListView) return _isClicked;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_isClicked);
  }

  final List<bool> _winnibgCombs;
  @override
  List<bool> get winnibgCombs {
    if (_winnibgCombs is EqualUnmodifiableListView) return _winnibgCombs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_winnibgCombs);
  }

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GameStateCopyWith<_GameState> get copyWith =>
      __$GameStateCopyWithImpl<_GameState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GameState &&
            const DeepCollectionEquality().equals(other._numbers, _numbers) &&
            const DeepCollectionEquality()
                .equals(other._isClicked, _isClicked) &&
            const DeepCollectionEquality()
                .equals(other._winnibgCombs, _winnibgCombs));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_numbers),
      const DeepCollectionEquality().hash(_isClicked),
      const DeepCollectionEquality().hash(_winnibgCombs));

  @override
  String toString() {
    return 'GameState(numbers: $numbers, isClicked: $isClicked, winnibgCombs: $winnibgCombs)';
  }
}

/// @nodoc
abstract mixin class _$GameStateCopyWith<$Res>
    implements $GameStateCopyWith<$Res> {
  factory _$GameStateCopyWith(
          _GameState value, $Res Function(_GameState) _then) =
      __$GameStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<String> numbers, List<bool> isClicked, List<bool> winnibgCombs});
}

/// @nodoc
class __$GameStateCopyWithImpl<$Res> implements _$GameStateCopyWith<$Res> {
  __$GameStateCopyWithImpl(this._self, this._then);

  final _GameState _self;
  final $Res Function(_GameState) _then;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? numbers = null,
    Object? isClicked = null,
    Object? winnibgCombs = null,
  }) {
    return _then(_GameState(
      numbers: null == numbers
          ? _self._numbers
          : numbers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isClicked: null == isClicked
          ? _self._isClicked
          : isClicked // ignore: cast_nullable_to_non_nullable
              as List<bool>,
      winnibgCombs: null == winnibgCombs
          ? _self._winnibgCombs
          : winnibgCombs // ignore: cast_nullable_to_non_nullable
              as List<bool>,
    ));
  }
}

// dart format on
