import 'package:audioplayers/audio_cache.dart';

class AudioPlayer {
  AudioCache player = AudioCache();

  playCustomAudioFile(String file){
    player.play(file);
  }

  playClickSound(){
    player.play('click.mp3');
  }

  playWrongSound(){
    player.play('wrong.mp3');
  }

  playCorrectSound(){
    player.play('correct.mp3');
  }

  playDragSound(){
    player.play('drag.mp3');
  }

  playDropSound(){
    player.play('drop.mp3');
  }

  playFinishLessonSound(){
    player.play('finish.mp3');
  }

}
