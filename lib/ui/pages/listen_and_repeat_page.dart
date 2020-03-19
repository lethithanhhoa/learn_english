import 'package:baidu_speech_recognition/baidu_speech_recognition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learn_english/core/models/word.dart';
import 'package:learn_english/core/services/database_service.dart';
import 'package:learn_english/ui/common/microphone.dart';
import 'package:learn_english/ui/common/speaker.dart';
import 'package:provider/provider.dart';
import 'package:speech_recognition/speech_recognition.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class ListenAndRepeatPage extends StatefulWidget {
  String bookId;
  String unitId;
  ListenAndRepeatPage({Key key, this.bookId, this.unitId}) : super(key: key);
  @override
  _ListenAndRepeat createState() => _ListenAndRepeat();
}

class _ListenAndRepeat extends State<ListenAndRepeatPage> {
  Database _database = Database();
  int index = 0;
  bool isTaped = false;

  SpeechRecognition _speech;
  bool _speechRecognitionAvailable = false;
  bool _isListening = false;

  String transcription = '';

  String _currentLocale = 'en_US';

  initState() {
    _speech = SpeechRecognition();

    _speech.setAvailabilityHandler(
        (bool result) => setState(() => _speechRecognitionAvailable = result));

    _speech.setCurrentLocaleHandler(
        (String locale) => setState(() => _currentLocale = locale));

    _speech.setRecognitionStartedHandler(
        () => setState(() => _isListening = true));

    _speech.setRecognitionResultHandler(
        (String text) => setState(() => transcription = text));

    _speech.setRecognitionCompleteHandler(
        () => setState(() => _isListening = false));

    _speech
        .activate()
        .then((res) => setState(() => _speechRecognitionAvailable = res));
  }

  void start() => _speech.listen(locale: _currentLocale).then(
        (result) {
          print('....................._MyAppState.start => result $result');
        },
      );

  void stop() => _speech.stop().then((result) => print(result));

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Word>>(
        future: _database.getListWord(widget.bookId, widget.unitId),
        builder: (context, AsyncSnapshot<List<Word>> snapshot) {
          if (snapshot.data == null)
            return Center(child: CircularProgressIndicator());
          return (index >= snapshot.data.length)
              ? Scaffold(
                  backgroundColor: Colors.yellow,
                )
              : Scaffold(
                  appBar: AppBar(title: Text('NoBack')),
                  body: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                          height: 300,
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: 250,
                                width: MediaQuery.of(context).size.width,
                                child: Stack(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: Image.asset('assets/board.png')
                                              .image,
                                          fit: BoxFit.scaleDown,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 75.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    2 /
                                                    3,
                                                height: 150,
                                                decoration: BoxDecoration(
                                                  // color: Colors.blue,
                                                  image: DecorationImage(
                                                      image: Image.network(
                                                              '${snapshot.data[index].imgName}')
                                                          .image,
                                                      fit: BoxFit.scaleDown),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    height: 50,
                                    alignment: Alignment.center,
                                    child: Text(
                                      snapshot.data[index].word,
                                      style: TextStyle(
                                          fontSize: 45,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.indigo[300]),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 1.0,
                                  ),
                                  Speaker(anyWord: snapshot.data[index].word),
                                ],
                              ),
                            ],
                          )),
                      Center(
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 100,
                              width: 100,
                              child: FlatButton(
                                onPressed: () {
                                  start();
                                  setState(() {
                                    isTaped = false;
                                  });
                                },
                                shape: CircleBorder(),
                                focusColor: Colors.indigo,
                                color: Colors.indigo[50],
                                child: Icon(
                                  FontAwesomeIcons.microphone,
                                  color: Colors.indigo[300],
                                  size: 70.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: (snapshot.data[index].word !=
                                      transcription.toLowerCase())
                                  ? _wrongText(context, transcription)
                                  : _trueText(context, transcription),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 150,
                        
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(bottom: 30.0),
                              child: Container(
                                height: 60,
                                width:
                                    MediaQuery.of(context).size.width * 3 / 4,
                                decoration: BoxDecoration(
                                  color: Colors.green[400],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50.0)),
                                  border: Border.all(color: Colors.grey[100]),
                                ),
                                child: Center(
                                  child: Builder(
                                    builder: (context) => FlatButton(
                                        onPressed: () {
                                          final snackBar = SnackBar(
                                            backgroundColor: (snapshot
                                                        .data[index].word
                                                        .toLowerCase() ==
                                                    transcription)
                                                ? Colors.green[100]
                                                    .withOpacity(0.8)
                                                : Colors.pink[100]
                                                    .withOpacity(0.8),
                                            content: Container(
                                              height: 100,
                                              child: Text(
                                                snapshot.data[index].word,
                                                style: TextStyle(
                                                  color: (snapshot
                                                              .data[index].word
                                                              .toLowerCase() ==
                                                          transcription)
                                                      ? Colors.green
                                                      : Colors.pink,
                                                  fontSize: 23.0,
                                                ),
                                              ),
                                            ),
                                          );

                                          // Find the Scaffold in the widget tree and use
                                          // it to show a SnackBar.

                                          if (isTaped) {
                                            setState(() {
                                              index++;
                                              transcription = '';
                                              isTaped = false;
                                            });
                                          } else {
                                            Scaffold.of(context)
                                                .showSnackBar(snackBar);
                                            setState(() {
                                              isTaped = true;
                                            });
                                          }
                                        },
                                        child: Text(
                                          'Continue',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
        });
  }

  Widget _wrongText(BuildContext context, String text) {
    return Container(
      alignment: Alignment.bottomCenter,
      height: 30.0,
      child: Text(
        text,
        style: TextStyle(color: Colors.pink[300], fontSize: 23, decoration: TextDecoration.lineThrough),
      ),
    );
  }

  Widget _trueText(BuildContext context, String text) {
    return Container(
      alignment: Alignment.bottomCenter,
      height: 30.0,
      child: Text(
        text,
        style: TextStyle(color: Colors.green[400], fontSize: 23),
      ),
    );
  }
}
