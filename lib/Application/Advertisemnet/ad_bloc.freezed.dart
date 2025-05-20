// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ad_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AdEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AdEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AdEvent()';
  }
}

/// @nodoc
class $AdEventCopyWith<$Res> {
  $AdEventCopyWith(AdEvent _, $Res Function(AdEvent) __);
}

/// @nodoc

class Started implements AdEvent {
  const Started();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AdEvent.started()';
  }
}

/// @nodoc

class _Interstatial implements AdEvent {
  const _Interstatial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Interstatial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AdEvent.interstatial()';
  }
}

/// @nodoc
mixin _$AdState {
  BannerAd? get ads;

  /// Create a copy of AdState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AdStateCopyWith<AdState> get copyWith =>
      _$AdStateCopyWithImpl<AdState>(this as AdState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AdState &&
            (identical(other.ads, ads) || other.ads == ads));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ads);

  @override
  String toString() {
    return 'AdState(ads: $ads)';
  }
}

/// @nodoc
abstract mixin class $AdStateCopyWith<$Res> {
  factory $AdStateCopyWith(AdState value, $Res Function(AdState) _then) =
      _$AdStateCopyWithImpl;
  @useResult
  $Res call({BannerAd? ads});
}

/// @nodoc
class _$AdStateCopyWithImpl<$Res> implements $AdStateCopyWith<$Res> {
  _$AdStateCopyWithImpl(this._self, this._then);

  final AdState _self;
  final $Res Function(AdState) _then;

  /// Create a copy of AdState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ads = freezed,
  }) {
    return _then(_self.copyWith(
      ads: freezed == ads
          ? _self.ads
          : ads // ignore: cast_nullable_to_non_nullable
              as BannerAd?,
    ));
  }
}

/// @nodoc

class _AdState implements AdState {
  const _AdState({this.ads});

  @override
  final BannerAd? ads;

  /// Create a copy of AdState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AdStateCopyWith<_AdState> get copyWith =>
      __$AdStateCopyWithImpl<_AdState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AdState &&
            (identical(other.ads, ads) || other.ads == ads));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ads);

  @override
  String toString() {
    return 'AdState(ads: $ads)';
  }
}

/// @nodoc
abstract mixin class _$AdStateCopyWith<$Res> implements $AdStateCopyWith<$Res> {
  factory _$AdStateCopyWith(_AdState value, $Res Function(_AdState) _then) =
      __$AdStateCopyWithImpl;
  @override
  @useResult
  $Res call({BannerAd? ads});
}

/// @nodoc
class __$AdStateCopyWithImpl<$Res> implements _$AdStateCopyWith<$Res> {
  __$AdStateCopyWithImpl(this._self, this._then);

  final _AdState _self;
  final $Res Function(_AdState) _then;

  /// Create a copy of AdState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? ads = freezed,
  }) {
    return _then(_AdState(
      ads: freezed == ads
          ? _self.ads
          : ads // ignore: cast_nullable_to_non_nullable
              as BannerAd?,
    ));
  }
}

// dart format on
