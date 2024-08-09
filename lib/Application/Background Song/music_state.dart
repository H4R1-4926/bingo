part of 'music_bloc.dart';

@freezed
class MusicState with _$MusicState {
  const factory MusicState(
      {required bool isMuted, Future<void>? play, Audio? stop}) = _MusicState;
  factory MusicState.initial() {
    return const MusicState(
      isMuted: true,
    );
  }
}
