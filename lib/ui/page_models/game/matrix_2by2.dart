import 'package:flutter/cupertino.dart';
import 'package:learn_english/core/models/vocabulary.dart';
import 'package:learn_english/ui/page_models/game/matrix_2by2_page.dart';
import 'package:learn_english/ui/state/account_user.dart';
import 'package:learn_english/ui/state/matrix_2by2_state.dart';
import 'package:provider/provider.dart';

class Matrix2By2 extends StatelessWidget {
  List<Vocabulary> vocabList;
  Matrix2By2({this.vocabList});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Matrix2By2State(),
        ),
        ChangeNotifierProvider(
          create: (context) => AccountUser(),
        )
      ],
      child: Matrix2By2Page(
        vocabList: vocabList,
      ),
    );
  }
}
