part of 'splash_bloc.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState({
    required bool loading,
    required bool loaded,
    required int count,
  }) = _SplashState;
  factory SplashState.initital() {
    return const SplashState(loading: false, loaded: true, count: 3);
  }
}
