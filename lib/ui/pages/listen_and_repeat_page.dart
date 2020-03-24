import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:learn_english/ui/page_models/listen_and_repeat/listen_and_repeat_provider.dart';

class ListenAndRepeatPage extends StatefulWidget {
  String bookId;
  String unitId;
  ListenAndRepeatPage({Key key, this.bookId, this.unitId}) : super(key: key);
  @override
  _ListenAndRepeatState createState() => _ListenAndRepeatState();
}

class _ListenAndRepeatState extends State<ListenAndRepeatPage> {
  DateTime currentBackPressTime;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      onWillPop: onWillPop,
      child: ListenAndRepeatProvider(
        bookId: widget.bookId,
        unitId: widget.unitId,
      ),
    );
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: "Press again to exit this lesson");
      return Future.value(false);
    }
    return Future.value(true);
  }
}
