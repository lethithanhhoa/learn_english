import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/core/models/user.dart';
import 'package:learn_english/core/services/database_service.dart';
import 'package:learn_english/ui/page_models/rank/rank_list.dart';
import 'package:provider/provider.dart';

class RankPage extends StatelessWidget {
  Database database = Database();
  @override
  Widget build(BuildContext context) {
    return FutureProvider<List<User>>.value(
      value: database.getAllUser(),
      child: Scaffold(
        backgroundColor: Colors.lime[50],
        body: SafeArea(
          child: RankList(),
        ),
      ),
    );
  }
}
