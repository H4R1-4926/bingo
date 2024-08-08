part of 'music_bloc.dart';

@freezed
class MusicState with _$MusicState {
  const factory MusicState({
    required bool isMuted,
    required Audio audio,
  }) = _MusicState;
  factory MusicState.initial() {
    return MusicState(
      isMuted: false,
      audio: Audio(),
    );
  }
}
