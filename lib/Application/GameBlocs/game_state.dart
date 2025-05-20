part of 'game_bloc.dart';

@freezed
abstract class GameState with _$GameState {
  const factory GameState({
    required List<String> numbers,
    required List<bool> isClicked,
    required List<bool> winnibgCombs,
  }) = _GameState;
  factory GameState.initial() {
    return GameState(numbers: [
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      '10',
      '11',
      '12',
      '13',
      '14',
      '15',
      '16',
      '17',
      '18',
      '19',
      '20',
      '21',
      '22',
      '23',
      '24',
      '25'
    ], isClicked: List.filled(25, false), winnibgCombs: List.filled(12, false));
  }
}
