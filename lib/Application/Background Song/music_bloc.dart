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
      emit(MusicState(
        isMuted: false,
        audio: Audio(),
      ));
    });
  }
}
