import 'package:audioplayers/audioplayers.dart';

class Audio {
  final AudioPlayer _player = AudioPlayer();

  Future<void> bgPlay() async {
    await _player.play(AssetSource('music/bg.mp3'));
    _player.setReleaseMode(ReleaseMode.loop);
  }

  void play() {
    _player.resume();
  }

  void stopPlaing() {
    _player.stop();
  }
}
