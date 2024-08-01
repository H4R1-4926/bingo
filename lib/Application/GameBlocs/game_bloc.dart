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
          wiinningCombs: state.wiinningCombs));
    });
    on<Mark>((event, emit) {
      final marked = List<bool>.from(state.isClicked);
      marked[event.index] = true;
      final winningCombs = _checkForWinningCombination(marked);
      emit(GameState(
          numbers: state.numbers,
          isClicked: marked,
          wiinningCombs: winningCombs));
    });
  }
  List<int> _checkForWinningCombination(List<bool> marked) {
    const List<List<int>> winningCombinations = [
      // Rows
      [0, 1, 2, 3, 4],
      [5, 6, 7, 8, 9],
      [10, 11, 12, 13, 14],
      [15, 16, 17, 18, 19],
      [20, 21, 22, 23, 24],
      // Columns
      [0, 5, 10, 15, 20],
      [1, 6, 11, 16, 21],
      [2, 7, 12, 17, 22],
      [3, 8, 13, 18, 23],
      [4, 9, 14, 19, 24],
      // Diagonals
      [0, 6, 12, 18, 24],
      [4, 8, 12, 16, 20],
    ];

    for (var combination in winningCombinations) {
      if (combination.every((index) => marked[index])) {
        return combination;
      }
    }

    return [];
  }
}
