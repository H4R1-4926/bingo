import 'package:audioplayers/audioplayers.dart';

class Audio {
  final AudioPlayer _player = AudioPlayer();

  Future<void> init() async {
    // Load and play your audio file
    await _player.setSourceAsset('music/bg.mp3');
    _player.setReleaseMode(ReleaseMode.loop);  // Loop the audio
    _player.resume();  // Start playing
  }

  void play() {
    _player.resume();
  }

  void pause() {
    _player.pause();
  }

  bool get isPlaying => _player.state == PlayerState.playing;

  void dispose() {
    _player.dispose();
  }
}