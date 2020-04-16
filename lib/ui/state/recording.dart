import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class Recording extends ChangeNotifier {
  PermissionHandler permissionHandler = PermissionHandler();
  String _textResult = '';
  stt.SpeechToText speech = stt.SpeechToText();

  String get getTextResult => _textResult;

  record() async {
    checkPermission();
    bool available = await speech.initialize();
    available
        ? speech.listen(onResult: (result) {
            _textResult = result.recognizedWords;
            notifyListeners();
          })
        : speech.stop();
  }

  void checkPermission() async {
    PermissionStatus permission = await permissionHandler
        .checkPermissionStatus(PermissionGroup.microphone);
    if (permission != PermissionStatus.granted) {
      await permissionHandler.requestPermissions([PermissionGroup.microphone]);
    }
  }

  fetchText() {
    _textResult = '';
    notifyListeners();
  }
}
