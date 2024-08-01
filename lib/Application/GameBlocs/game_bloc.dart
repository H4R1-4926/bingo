import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_event.dart';
part 'game_state.dart';
part 'game_bloc.freezed.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final List<String> numbers = [
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
  ];
  GameBloc() : super(GameState.initial()) {
    on<_Started>((event, emit) {
      numbers.shuffle(Random());
      emit(GameState(
        numbers: numbers,
        isClicked: state.isClicked,
        bingoLetters: state.bingoLetters,
      ));
    });
    on<Mark>((event, emit) {
      final marked = List<bool>.from(state.isClicked);
      marked[event.index] = !marked[event.index];
      final bingoLetters = _updateBingoLetters(marked);

      emit(GameState(
        numbers: state.numbers,
        isClicked: marked,
        bingoLetters: bingoLetters,
      ));
    });
  }
  List<bool> _updateBingoLetters(List<bool> isClicked) {
    final bingoLetters = List<bool>.filled(5, false);

    final winningCombinations = [
      [1, 2, 3, 4, 5],
      [6, 7, 8, 9, 10],
      [11, 12, 13, 14, 15],
      [16, 17, 18, 19, 20],
      [21, 22, 23, 24, 25],

      // Columns
      [1, 6, 11, 16, 21],
      [2, 7, 12, 17, 22],
      [3, 8, 13, 18, 23],
      [4, 9, 14, 19, 24],
      [5, 10, 15, 20, 25],

      // Diagonals
      [1, 7, 13, 19, 25],
      [5, 9, 13, 17, 21],
    ];

    List<bool> convertedClicked =
        List.generate(25, (index) => isClicked[index]);

    void checkWinningCombination(List<int> combination, int index) {
      if (combination.every((i) => convertedClicked[i - 1])) {
        bingoLetters[index] = true;
      }
    }

    for (int i = 0; i < winningCombinations.length; i++) {
      checkWinningCombination(winningCombinations[i], i);
    }

    return bingoLetters;
  }
}
