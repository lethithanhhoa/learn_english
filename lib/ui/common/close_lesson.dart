import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/ui/modules/audio_local_player.dart';
import 'package:learn_english/ui/modules/route_name.dart';

class CloseLesson extends StatelessWidget {
  AudioLocalPlayer audioPlayer = AudioLocalPlayer();
  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.all(0.0),
      onPressed: () {
        audioPlayer.playClickSound();
        
        showDialog(
          context: context,
          child: AlertDialog(
            title: Text('Do you want exit this lesson?'),
            content: Text("If you exit this lesson, the result won't be saved."),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(context, RouteName.home,
                        (Route<dynamic> route) => false);
                  },
                  child: Text('Exit', style: TextStyle(fontSize: 18),)),
              FlatButton(onPressed: (){
                Navigator.of(context).pop();
              }, child: Text('Cancel', style: TextStyle(fontSize: 18),)),
            ],
          ),
        );
      },
      icon: Icon(
        Icons.close,
        size: 30,
      ),
      color: Colors.white.withOpacity(0.5),
    );
  }
}
