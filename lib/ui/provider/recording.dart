import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class RecordingVoice extends ChangeNotifier {
  PermissionHandler permissionHandler = PermissionHandler();
  List<SpeechRecognitionWords> _recordingResultList = new List();
  String _bestResult = '';
  SpeechToText speech = SpeechToText();
  bool _isListening = false;

  List<SpeechRecognitionWords> get getListResult => _recordingResultList;
  String get getBestResult => _bestResult;
  bool get getListening => _isListening;


  record() async {
    if (_isListening)
      stop();
    else {
      checkPermission();
      bool available = await speech.initialize();

      if (available) {
        _isListening = true;
        notifyListeners();
        speech.listen(onResult: (result) {
          _recordingResultList = result.alternates;
          _bestResult = result.recognizedWords;

          notifyListeners();
          stop();
        });
        
      }
    }
  }

  stop() {
    _isListening = false;
    speech.stop();
    notifyListeners();
  }

  void checkPermission() async {
    PermissionStatus permission = await permissionHandler
        .checkPermissionStatus(PermissionGroup.microphone);
    if (permission != PermissionStatus.granted) {
      await permissionHandler.requestPermissions([PermissionGroup.microphone]);
    }
  }

  fetchText() {
    _bestResult = '';

    _recordingResultList = [];
    notifyListeners();
  }

  setBestResult(String text) {
    _bestResult = text;
    notifyListeners();
  }
}
