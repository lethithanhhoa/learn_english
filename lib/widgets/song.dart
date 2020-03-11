import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Song extends StatefulWidget {
  String name;
  List<dynamic> song;
  Song({Key key, this.name, this.song}) : super(key: key);
  @override
  SongState createState() => SongState();
}

class SongState extends State<Song> {
  List<dynamic> song = [];
  String unitName;

  @override
  void initState() {
    super.initState();
    song = widget.song;
    unitName = widget.name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${unitName}"),
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.maybePop(context);
              }),
          automaticallyImplyLeading: true,
        ),
        body: Stack(children: <Widget>[
          Container(
              child: new Image.asset(
            "assets/bg.jpg",
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.fill,
          )),
          Center(
            child: new ListView.builder(
                padding: EdgeInsets.all(10.0), itemBuilder: _buildRow),
          ),
        ]));
  }

  Widget _buildRow(context, index) {
    if (index >= song.length) return null;
    dynamic sentence = song[index];
    return new ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Text("${sentence}"),
          )
        ],
      ),
    );
  }
}
