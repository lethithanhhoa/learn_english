import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learn_english/core/models/word.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:speech_recognition/speech_recognition.dart';

class RecordVoice extends ChangeNotifier {
  Word word;
  RecordVoice(Word word){
    this.word = word;
    print('HINH NHU O DAY......................${word.word}');
  }

  SpeechRecognition _speech;
  bool _speechRecognitionAvailable = false;
  bool _isListening = false;

  String transcription = '';

  String _currentLocale = 'en_US';
  
  initState() {
    transcription = '';
    _speech = new SpeechRecognition();
    _speech.setAvailabilityHandler(onSpeechAvailability);
    _speech.setRecognitionStartedHandler(onRecognitionStarted);
    _speech.setRecognitionResultHandler(onRecognitionResult);
    _speech.setRecognitionCompleteHandler(onRecognitionComplete);
    _speech.activate().then((res) => _speechRecognitionAvailable = res);
    // notifyListeners();
  }

  void start() => _speech.listen(locale: _currentLocale).then((result) {
        print('$result');
      });

  void cancel() => _speech.cancel().then((result) {
        _isListening = result;
      });

  void stop() => _speech.stop().then((result) {
        _isListening = result;
      });

  void onSpeechAvailability(bool result) {
    _speechRecognitionAvailable = result;
  }

  void onRecognitionStarted() {
    _isListening = true;
  }

  void onRecognitionResult(String text) {
    transcription = text;
  }

  void onRecognitionComplete() {
    _isListening = false;
  }

  startRecord() {
    initState();
    if (_speechRecognitionAvailable && !_isListening) {
      start();
      print('.......................................${transcription}');
      notifyListeners();
    }
  }

  stopRecord() {
    if (_isListening) stop();
    notifyListeners();
  }
}

// class RecordVoiceProvider extends StatelessWidget {
//   Word word;
//   RecordVoiceProvider({this.word});
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider<RecordVoice>(    
//       create: (context) => RecordVoice(word),
//       child: Microphone(),
//     );
//   }
// }

class RecordVoiceProvider extends StatefulWidget{
  Word word;
  RecordVoiceProvider ({Key key, this.word}) : super(key: key);
  Microphone createState() => Microphone();
}

class Microphone extends State<RecordVoiceProvider> {
  SpeechRecognition _speech;
  bool _speechRecognitionAvailable = false;
  bool _isListening = false;

  String transcription = '';

  String _currentLocale = 'en_US';
  
  initState() {
    super.initState();
    transcription = '';
    _speech = new SpeechRecognition();
    _speech.setAvailabilityHandler(onSpeechAvailability);
    _speech.setRecognitionStartedHandler(onRecognitionStarted);
    _speech.setRecognitionResultHandler(onRecognitionResult);
    _speech.setRecognitionCompleteHandler(onRecognitionComplete);
    
    _speech.activate().then((res) => _speechRecognitionAvailable = res);
  }

  void start() => _speech
      .listen(locale: _currentLocale)
      .then((result) => print('_MyAppState.start => result $result'));

  void cancel() =>
      _speech.cancel().then((result) => setState(() => _isListening = result));

  void stop() => _speech.stop().then((result) {
        setState(() => _isListening = result);
      });

  void onSpeechAvailability(bool result) =>
      setState(() => _speechRecognitionAvailable = result);


  void onRecognitionStarted() => setState(() => _isListening = true);

  void onRecognitionResult(String text) => setState(() => transcription = text);

  void onRecognitionComplete() => setState(() => _isListening = false);
  
  @override
  Widget build(BuildContext context) {
    // RecordVoice recordVoice = Provider.of<RecordVoice>(context);
    // print('${recordVoice.transcription}......................${recordVoice.word.word}');
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            height: 100,
            width: 100,
            child: FlatButton(
              onLongPress: () {
                if (_speechRecognitionAvailable && !_isListening){
                  start();
                }
              },
              onPressed: () {
                if(_isListening){
                  stop();
                }
              },
              shape: CircleBorder(),
              focusColor: Colors.blue,
              color: Colors.yellow,
              child: Icon(
                FontAwesomeIcons.microphone,
                color: Colors.pink[400],
                size: 70.0,
              ),
            ),
          ),
          // (recordVoice.word.word != recordVoice.transcription)? _wrongText(context, recordVoice.transcription) : _trueText(context, recordVoice.transcription),
          (widget.word.word.toLowerCase() != transcription.toLowerCase())? _wrongText(context, transcription) : _trueText(context, transcription),
        ],
      ),
    );
  }

  Widget _wrongText(BuildContext context, String text){
    return Container(
      alignment: Alignment.bottomCenter,
      height: 30.0,
      child: Text(text,
      style: TextStyle(color: Colors.pink[300], fontSize: 18),
      ),
    );
  }
  Widget _trueText(BuildContext context, String text){
    return Container(
      alignment: Alignment.bottomCenter,
      height: 30.0,
      child: Text(text,
      style: TextStyle(color: Colors.green[300], fontSize: 18),
      ),
    );
  }
}
