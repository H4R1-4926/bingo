part of 'ad_bloc.dart';

@freezed
abstract class AdState with _$AdState {
  const factory AdState({
    BannerAd? ads,
  }) = _AdState;
  factory AdState.initial() => const AdState();
}
