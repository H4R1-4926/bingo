import 'package:audioplayers/audioplayers.dart';

class Audio {
  final AudioPlayer _player = AudioPlayer();

  Future<void> bgPlay() async {
    await _player.setSource(AssetSource('music/bg.mp3'));
    _player.setReleaseMode(ReleaseMode.loop);
    play();
  }

  void play() {
    _player.resume();
  }

  void stopPlaing() {
    _player.stop();
  }
}
