import 'package:audioplayers/audioplayers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Audio {
  final AudioPlayer _player = AudioPlayer();

  Future<void> bgPlay() async {
    final prefs = await SharedPreferences.getInstance();
    bool isMuted = prefs.getBool('isMuted') ?? false;

    if (!isMuted) {
      await _player.play(AssetSource('music/bg.mp3'));
      _player.setReleaseMode(ReleaseMode.loop);
    }
  }

  void play() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isMuted', false);
    _player.resume();
  }

  void stopPlaying() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isMuted', true);
    _player.stop();
  }

  void dispose() {
    _player.dispose();
  }
}
