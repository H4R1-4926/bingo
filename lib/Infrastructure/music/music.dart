import 'package:audioplayers/audioplayers.dart';

class Audio {
  static final AudioPlayer _player = AudioPlayer();
  static bool _isPlaying = false;
  static bool _isMuted = false;

  static void playMusic() {
    if (!_isPlaying) {
      _player.setReleaseMode(ReleaseMode.loop); // Loop the audio
      _player.play(AssetSource('assets/music/bg.mp3'));
      _isPlaying = true;
    }
  }

  static void toggleMute() {
    _isMuted = !_isMuted;
    if (_isMuted) {
      _player.setVolume(0.0);
    } else {
      _player.setVolume(1.0);
    }
  }
}
