part of 'game_bloc.dart';

@freezed
class GameEvent with _$GameEvent {
  const factory GameEvent.started() = _Started;
  const factory GameEvent.mark({required int index}) = Mark;
  const factory GameEvent.reset() = Reset;
}
