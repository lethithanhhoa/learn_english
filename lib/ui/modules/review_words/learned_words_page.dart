import 'package:flutter/cupertino.dart';
import 'package:learn_english/core/models/vocabulary.dart';
import 'package:learn_english/ui/provider/account_user.dart';
import 'package:provider/provider.dart';

import 'learned_words.dart';

class LearnedWordsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiProvider(
      providers: [
        
        ChangeNotifierProvider(
          create: (context) => AccountUser(),
        )
      ],
      child: LearnedWords(),
    );
  }
}
