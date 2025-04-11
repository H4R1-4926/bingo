import 'package:audioplayers/audioplayers.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Audio {
  static final Audio _instance = Audio._internal();
  factory Audio() => _instance;
  Audio._internal();

  final AudioPlayer _player = AudioPlayer();
  bool _isInitialized = false;
  bool _isPlaying = false;
  bool _wasPlayingBeforeAd = false;

  void markIntentToResume() {
    _wasPlayingBeforeAd = _isPlaying;
  }

  Future<void> restoreIntentAfterAd() async {
    bool muted = await isMuted();
    if (_wasPlayingBeforeAd && !muted) {
      await bgPlay();
    } else {
      await stopPlaying();
    }
    _wasPlayingBeforeAd = false;
  }

  Future<void> initialize() async {
    if (!_isInitialized) {
      await _player.setSource(AssetSource('music/music.mp3'));
      await _player.setReleaseMode(ReleaseMode.loop);
      _isInitialized = true;
    }
  }

  Future<void> bgPlay() async {
    if (_isPlaying) return;

    final prefs = await SharedPreferences.getInstance();
    bool isMuted = prefs.getBool('isMuted') ?? false;

    if (!isMuted) {
      await _player.resume();
      _isPlaying = true;
    }
  }

  Future<void> stopPlaying() async {
    await _player.pause();
    _isPlaying = false;
  }

  void dispose() {
    _player.dispose();
    _isPlaying = false;
    _isInitialized = false;
  }

  Future<bool> isMuted() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isMuted') ?? false;
  }

  Future<void> toggleMute() async {
    final prefs = await SharedPreferences.getInstance();
    bool currentState = await isMuted();
    await prefs.setBool('isMuted', !currentState);

    if (!currentState) {
      await stopPlaying();
    } else {
      await bgPlay();
    }
  }
}
