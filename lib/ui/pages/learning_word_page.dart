import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/ui/page_models/learning_detail/word_list_provider.dart';

class LearningWordPage extends StatefulWidget {
  String bookId;
  String unitId;
  LearningWordPage({Key key, this.bookId, this.unitId}) : super(key: key);
  @override
  _LearningWordState createState() => _LearningWordState();
}

class _LearningWordState extends State<LearningWordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.unitId)),
      body: WordsListProvider(bookId: widget.bookId, unitId: widget.unitId,)
    );
  }  
}