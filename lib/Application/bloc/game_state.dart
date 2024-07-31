part of 'game_bloc.dart';

@freezed
class GameState with _$GameState {
  const factory GameState({required List<String> numbers}) = _GameState;
  factory GameState.initial() {
    return const GameState(numbers: []);
  }
}
