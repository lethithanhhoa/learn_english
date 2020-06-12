import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:flutter/foundation.dart' show kIsWeb;
// import 'dart:html' as html;

class Recording extends ChangeNotifier {
  PermissionHandler permissionHandler = PermissionHandler();
  List<SpeechRecognitionWords> _recordingResultList = new List();
  String _bestResult = '';
  String _finalResult = '';
  stt.SpeechToText speech = stt.SpeechToText();

  List<SpeechRecognitionWords> get getListResult => _recordingResultList;
  String get getBestResult => _bestResult;
  String get getFinalResult => _finalResult;

  record() async {
    checkPermission();
    bool available = await speech.initialize();
    available
        ? speech.listen(onResult: (result) {
            _recordingResultList = result.alternates;
            _bestResult = result.recognizedWords;
            notifyListeners();
          })
        : speech.stop();
  }

  void checkPermission() async {
    // if (!kIsWeb) {
    PermissionStatus permission = await permissionHandler
        .checkPermissionStatus(PermissionGroup.microphone);
    if (permission != PermissionStatus.granted) {
      await permissionHandler.requestPermissions([PermissionGroup.microphone]);
    }
    //   return;
    // }
    // final permission =
    //     await html.window.navigator.permissions.query({'name': "microphone"});

    // if (permission.state == "denied") return;

    // final stream = await html.window.navigator.getUserMedia(audio: true, video: false);
  }

  fetchText() {
    _bestResult = '';
    _finalResult = '';
    _recordingResultList = [];
    notifyListeners();
  }

  setFinalResult(String text) {
    _finalResult = text;
    notifyListeners();
  }
}