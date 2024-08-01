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
      emit(GameState(numbers: numbers, isClicked: state.isClicked));
    });
    on<Mark>((event, emit) {
      final marked = List<bool>.from(state.isClicked);
      marked[event.index] = true; // Mark the clicked container
      emit(GameState(numbers: state.numbers, isClicked: marked));
    });
  }
}
