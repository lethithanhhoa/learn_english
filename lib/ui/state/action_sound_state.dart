import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';

class ActionSoundState extends ChangeNotifier {
  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache _audioCache = AudioCache();
  
  bool _isActionSound = true;
  bool get getActionSound => _isActionSound;
  ActionSoundState(){
    _audioCache = AudioCache(prefix: "audio/", fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP));
  }
  

  setActionSound(bool value) {
    _isActionSound = value;
    notifyListeners();
  }

  playActionSound() async {
    if (_isActionSound) {
      await _audioCache.play('click.mp3');
    }
  }
}
