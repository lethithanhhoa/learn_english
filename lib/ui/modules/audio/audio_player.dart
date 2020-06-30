import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';

class AudioCustomPlayer extends ChangeNotifier {
  AudioPlayer audioPlayer;
  AudioCache audioCache;

  AudioCustomPlayer() {
    audioPlayer = AudioPlayer();
    audioCache = AudioCache(fixedPlayer: audioPlayer);
  }

  playCustomAudioFile(String file) async {
    await audioPlayer.play(
      file,
    );
  }
}
