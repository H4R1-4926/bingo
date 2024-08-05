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
  List<List<int>> combs = [
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
  GameBloc() : super(GameState.initial()) {
    on<_Started>((event, emit) {
      numbers.shuffle(Random());
      emit(GameState(
        numbers: numbers,
        isClicked: state.isClicked,
        winnibgCombs: state.winnibgCombs,
      ));
    });
    on<Mark>((event, emit) {
      final isClicked = List<bool>.from(state.isClicked);
      isClicked[event.index] = !isClicked[event.index];
      final winningCombinations = checkWinningCombinations(isClicked);

      emit(GameState(
        numbers: state.numbers,
        isClicked: isClicked,
        winnibgCombs: winningCombinations,
      ));
    });
    on<Reset>((event, emit) {
      emit(GameState.initial());
    });
  }
  List<bool> checkWinningCombinations(List<bool> isClicked) {
    List<bool> winningCombs = List.filled(12, false);

    // Rows
    if (isClicked[0] &&
        isClicked[1] &&
        isClicked[2] &&
        isClicked[3] &&
        isClicked[4]) {
      winningCombs[0] = true;
    }
    if (isClicked[5] &&
        isClicked[6] &&
        isClicked[7] &&
        isClicked[8] &&
        isClicked[9]) {
      winningCombs[1] = true;
    }
    if (isClicked[10] &&
        isClicked[11] &&
        isClicked[12] &&
        isClicked[13] &&
        isClicked[14]) {
      winningCombs[2] = true;
    }
    if (isClicked[15] &&
        isClicked[16] &&
        isClicked[17] &&
        isClicked[18] &&
        isClicked[19]) {
      winningCombs[3] = true;
    }
    if (isClicked[20] &&
        isClicked[21] &&
        isClicked[22] &&
        isClicked[23] &&
        isClicked[24]) {
      winningCombs[4] = true;
    }

    // Columns
    if (isClicked[0] &&
        isClicked[5] &&
        isClicked[10] &&
        isClicked[15] &&
        isClicked[20]) {
      winningCombs[5] = true;
    }
    if (isClicked[1] &&
        isClicked[6] &&
        isClicked[11] &&
        isClicked[16] &&
        isClicked[21]) {
      winningCombs[6] = true;
    }
    if (isClicked[2] &&
        isClicked[7] &&
        isClicked[12] &&
        isClicked[17] &&
        isClicked[22]) {
      winningCombs[7] = true;
    }
    if (isClicked[3] &&
        isClicked[8] &&
        isClicked[13] &&
        isClicked[18] &&
        isClicked[23]) {
      winningCombs[8] = true;
    }
    if (isClicked[4] &&
        isClicked[9] &&
        isClicked[14] &&
        isClicked[19] &&
        isClicked[24]) {
      winningCombs[9] = true;
    }

    // Diagonals
    if (isClicked[0] &&
        isClicked[6] &&
        isClicked[12] &&
        isClicked[18] &&
        isClicked[24]) {
      winningCombs[10] = true;
    }
    if (isClicked[4] &&
        isClicked[8] &&
        isClicked[12] &&
        isClicked[16] &&
        isClicked[20]) {
      winningCombs[11] = true;
    }

    return winningCombs;
  }
}
