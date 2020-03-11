import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Conversation extends StatefulWidget {
  String name;
  List<dynamic> conversation;
  Conversation({Key key, this.name, this.conversation}) : super(key: key);
  @override
  ConversationState createState() => ConversationState();
}

class ConversationState extends State<Conversation> {
  List<dynamic> conversation = [];
  String unitName;

  @override
  void initState() {
    super.initState();
    conversation = widget.conversation;
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
    if (index >= conversation.length) return null;
    dynamic sentence = conversation[index];
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
