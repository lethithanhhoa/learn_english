import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/core/models/vocabulary.dart';
import 'package:learn_english/ui/page_models/game/matrix_3by3_page.dart';
import 'package:learn_english/ui/state/account_user.dart';
import 'package:learn_english/ui/state/matrix_3by3_state.dart';

import 'package:provider/provider.dart';

class Matrix3By3 extends StatelessWidget {
  List<Vocabulary> vocabList;
  Matrix3By3({this.vocabList});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        
        ChangeNotifierProvider(
          create: (context) => Matrix3By3State(),
        ),
        ChangeNotifierProvider(
          create: (context) => AccountUser(),
        )
      ],
      child: Matrix3By3Page(
        vocabList: vocabList,
      ),
    );
  }
}
