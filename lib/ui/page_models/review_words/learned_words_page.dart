import 'package:flutter/cupertino.dart';
import 'package:learn_english/ui/page_models/review_words/learned_words.dart';
import 'package:learn_english/ui/state/account_user.dart';
import 'package:provider/provider.dart';

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