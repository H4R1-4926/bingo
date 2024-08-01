part of 'splash_bloc.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState({required bool onPressed}) = _SplashState;
  factory SplashState.initital() {
    return const SplashState(onPressed: false);
  }
}
