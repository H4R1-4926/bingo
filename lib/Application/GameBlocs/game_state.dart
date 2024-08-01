part of 'game_bloc.dart';

@freezed
class GameState with _$GameState {
  const factory GameState(
      {required List<String> numbers,
      required List<bool> isClicked,
      required List<bool> bingoLetters}) = _GameState;
  factory GameState.initial() {
    return GameState(
        numbers: [],
        isClicked: List.filled(25, false),
        bingoLetters: List.filled(5, false));
  }
}
