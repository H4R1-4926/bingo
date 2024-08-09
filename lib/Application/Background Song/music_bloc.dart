import 'package:bingo/Infrastructure/music/music.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'music_event.dart';
part 'music_state.dart';
part 'music_bloc.freezed.dart';

class MusicBloc extends Bloc<MusicEvent, MusicState> {
  final audio = Audio();
  MusicBloc() : super(MusicState.initial()) {
    on<AppOpensAndInsideApp>((event, emit) {
      emit(MusicState(isMuted: true, play: audio.bgPlay()));
    });
    on<Toggle>((event, emit) {
      if (state.isMuted == true) {
        audio.stopPlaing();
        emit(state.copyWith(isMuted: true));
      } else {
        audio.play();
        emit(state.copyWith(isMuted: false));
      }
      emit(MusicState(isMuted: !state.isMuted));
    });
  }
}
