import 'package:flutter/cupertino.dart';
import 'package:learn_english/core/models/vocabulary.dart';
import 'package:learn_english/ui/page_models/review_words/detail_word.dart';
import 'package:learn_english/ui/state/index.dart';
import 'package:provider/provider.dart';

class DetailWordPage extends StatelessWidget {
  List<Vocabulary> vocabList;
  int index;
  DetailWordPage({this.vocabList, this.index});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Index(),
        ),
      ],
      child: DetailWord(
        vocabList: vocabList,
        index: index,
      ),
    );
  }
}
