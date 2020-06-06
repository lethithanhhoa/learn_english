import 'package:audioplayers/audio_cache.dart';

class AudioLocalPlayer {
  AudioCache audioCache = AudioCache();

  playClickSound() {
    audioCache.play('click.mp3');
  }

  playWrongSound() {
    audioCache.play('wrong.mp3');
  }

  playCorrectSound() {
    audioCache.play('correct.mp3');
  }

  playDragSound() {
    audioCache.play('drag.mp3');
  }

  playDropSound() {
    audioCache.play('drop.mp3');
  }

  playFinishLessonSound() {
    audioCache.play('finish.mp3');
  }

  playOhNoSound() {
    audioCache.play('oh_no.mp3');
  }
}
