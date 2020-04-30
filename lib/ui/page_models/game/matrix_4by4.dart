import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/core/models/vocabulary.dart';
import 'package:learn_english/ui/page_models/game/matrix_4by4_page.dart';
import 'package:learn_english/ui/page_models/game/widgets/cell.dart';
import 'package:learn_english/ui/page_models/game/widgets/image_cell.dart';
import 'package:learn_english/ui/page_models/game/widgets/text_cell.dart';
import 'package:learn_english/ui/state/account_user.dart';
import 'package:learn_english/ui/state/matrix_3by3_state.dart';
import 'package:learn_english/ui/state/matrix_4by4_state.dart';
import 'package:provider/provider.dart';

class Matrix4By4 extends StatelessWidget {
  List<Vocabulary> vocabList;
  Matrix4By4({this.vocabList});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Matrix4By4State(),
        ),
        ChangeNotifierProvider(
          create: (context) => AccountUser(),
        )
      ],
      child: Matrix4By4Page(
        vocabList: vocabList,
      ),
    );
  }
}
