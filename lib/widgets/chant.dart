import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Chant extends StatefulWidget {
  String name;
  List<dynamic> chant;
  Chant({Key key, this.name, this.chant}) : super(key: key);
  @override
  ChantState createState() => ChantState();
}

class ChantState extends State<Chant> {
  List<dynamic> chant = [];
  String unitName;

  @override
  void initState() {
    super.initState();
    chant = widget.chant;
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
    if (index >= chant.length) return null;
    dynamic sentence = chant[index];
    // print(sentence);
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
