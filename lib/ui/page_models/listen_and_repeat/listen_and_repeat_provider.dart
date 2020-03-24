import 'package:flutter/cupertino.dart';
import 'package:learn_english/core/models/word.dart';
import 'package:learn_english/core/services/database_service.dart';
import 'package:learn_english/ui/page_models/listen_and_repeat/listen_and_repeat.dart';
import 'package:learn_english/ui/provider/indexOfList.dart';
import 'package:learn_english/ui/provider/recording.dart';
import 'package:provider/provider.dart';

class ListenAndRepeatProvider extends StatelessWidget {
  Database _database = Database();
  String bookId;
  String unitId;
  ListenAndRepeatProvider({this.bookId, this.unitId});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiProvider(
      providers: [
        FutureProvider<List<Word>>.value(
            value: _database.getListWord(bookId, unitId)),
        ChangeNotifierProvider(create: (context) => Recording()),
        ChangeNotifierProvider(create: (context) => Index())
      ],
      child: ListenAndRepeat(),
    );
  }
}
