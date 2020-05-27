import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_english/core/models/vocabulary.dart';
import 'package:learn_english/ui/modules/route_name.dart';
import 'package:path/path.dart';
import 'package:quiver/async.dart';

class TapTapGame extends StatefulWidget {
  List<Vocabulary> listVocab;
  TapTapGame({this.listVocab});

  _TapTapGameState createState() => _TapTapGameState();
}

class _TapTapGameState extends State<TapTapGame> {
  FlutterTts flutterTts = FlutterTts();
  int _current = 3;
  String _text = '3';
  bool loading = false;

  Future _speak(String text) async {
    await flutterTts.setLanguage('en-US');
    await flutterTts.speak(text);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    if(_current > 0){
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _current--;
        _text = '${_current}';
      });
    });
    }

    if (_current <= 0) {
      setState(() {
        _text = 'Go!';
      });
      if (loading == false) {
        Future.delayed(Duration(seconds: 1), () {
          Navigator.pushNamed(context, RouteName.detail_taptap,
              arguments: widget.listVocab);
          loading = true;
        });
      }
    }
    _speak(_text);
    return Scaffold(
      backgroundColor: Colors.green[50],
      body: Center(
        child: AutoSizeText(
          _text,
          style: GoogleFonts.piedra(
            fontSize: 150,
            color: Colors.blue
          ),
        )
      ),
    );
  }
}
