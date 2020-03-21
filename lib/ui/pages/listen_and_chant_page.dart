import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/core/models/chant.dart';
import 'package:learn_english/core/services/database_service.dart';

class ListenAndChantPage extends StatefulWidget {
  String bookId;
  String unitId;
  ListenAndChantPage({Key key, this.bookId, this.unitId}) : super(key: key);
  @override
  ListenAndChant createState() => ListenAndChant();
}

class ListenAndChant extends State<ListenAndChantPage> {
  Database database = Database();
  AudioPlayer audioPlayer;
  AudioCache audioCache;
  AudioPlayerState playerState;
  Duration duration = Duration();
  Duration position = Duration();

  initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    audioCache = AudioCache(fixedPlayer: audioPlayer);

    //return the duration of the file
    audioPlayer.onDurationChanged.listen((Duration d) {
      print('Max duration: $d');
      setState(() => duration = d);
    });
    // update the current position of the audio
    audioPlayer.onAudioPositionChanged.listen((Duration p) {
      print('Current position: $p');
      setState(() => position = p);
      if (p.inSeconds == duration.inSeconds) {
        setState(() {
          playerState = AudioPlayerState.PAUSED;
        });
      }
    });
  }

  play(String url) async {
    int result = await audioPlayer.play(url, position: position);
    if (result == 1) {
      playerState = AudioPlayerState.PLAYING;
    }
  }

  stop() async {
    int result = await audioPlayer.stop();
    if (result == 1) {
      playerState = AudioPlayerState.STOPPED;
    }
  }

  pause() async {
    int result = await audioPlayer.pause();
    if (result == 1) {
      playerState = AudioPlayerState.PAUSED;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Chant>>(
        future: database.getChant(widget.bookId, widget.unitId),
        builder: (context, AsyncSnapshot<List<Chant>> snapshot) {
          if (snapshot.data == null)
            return Center(child: CircularProgressIndicator());
          return Scaffold(
            appBar: AppBar(
              title: Text('Chant'),
              backgroundColor: Colors.lightGreen[900],
            ),
            body: Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: Image.asset('assets/ba25.jpg').image,
                        fit: BoxFit.fill),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        // color: Colors.white,
                        height: 400,
                        child: ListView.builder(itemBuilder: (context, index) {
                          if (index >= snapshot.data.first.content.length)
                            return null;
                          return Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              snapshot.data.first.content[index],
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.fade,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 23.0),
                            ),
                          );
                        }),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Slider(
                                activeColor: Colors.yellow[600],
                                inactiveColor: Colors.white,
                                value: position.inSeconds.toDouble(),
                                min: 0.00,
                                max: duration.inSeconds.toDouble(),
                                onChanged: (double value) {
                                  if (value > duration.inSeconds.toDouble())
                                    return null;
                                  Duration newDuration =
                                      Duration(seconds: value.toInt());
                                  setState(() {
                                    position = newDuration;
                                    playerState = AudioPlayerState.PAUSED;

                                    pause();
                                  });
                                },
                              ),
                            ],
                          ),
                          Container(
                            height: 110,
                            // color: Colors.white,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      FloatingActionButton(
                                        onPressed: () {
                                          setState(() {
                                            playerState =
                                                AudioPlayerState.PAUSED;
                                            position = new Duration(seconds: 0);
                                          });
                                          pause();
                                        },
                                        backgroundColor: Colors.white,
                                        mini: true,
                                        child: Icon(
                                          Icons.loop,
                                          color: Colors.lightGreen[900],
                                          size: 25.0,
                                        ),
                                      ),
                                      SizedBox(width: 30.0),
                                      FloatingActionButton(
                                        onPressed: () {
                                          (playerState ==
                                                  AudioPlayerState.PAUSED)
                                              ? play(
                                                  '${snapshot.data.first.audioFile}')
                                              : pause();
                                        },
                                        backgroundColor: (playerState ==
                                                AudioPlayerState.PLAYING)
                                            ? Colors.yellow[200]
                                            : Colors.white,
                                        child: (playerState !=
                                                AudioPlayerState.PLAYING)
                                            ? Icon(
                                                Icons.play_arrow,
                                                color: Colors.lightGreen[900],
                                                size: 40.0,
                                              )
                                            : Icon(
                                                Icons.pause,
                                                color: Colors.lightGreen[900],
                                                size: 40.0,
                                              ),
                                      ),
                                      SizedBox(width: 30.0),
                                      FloatingActionButton(
                                        onPressed: () {
                                          stop();
                                        },
                                        mini: true,
                                        backgroundColor: Colors.white,
                                        child: Icon(
                                          Icons.stop,
                                          color: Colors.lightGreen[900],
                                          size: 25.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
