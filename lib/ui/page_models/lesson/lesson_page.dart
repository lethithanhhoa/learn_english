import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/core/models/lesson.dart';
import 'package:learn_english/core/services/database_service.dart';
import 'package:learn_english/ui/modules/route_name.dart';
import 'package:learn_english/ui/page_models/lesson/lesson_list.dart';
import 'package:learn_english/ui/pages/loading_page.dart';
import 'package:learn_english/ui/state/account_user.dart';
import 'package:provider/provider.dart';

class LessonPage extends StatelessWidget {
  Database database = Database();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        FutureProvider<List<Lesson>>.value(
          value: database.getListOfLesson(),
        ),
        ChangeNotifierProvider(
          create: (_) => AccountUser(),
        ),
      ],
      child: Scaffold(
        backgroundColor: Colors.green[300],
        body: SafeArea(
          child: Consumer<List<Lesson>>(builder: (context, value, child) {
            AccountUser accountUser = Provider.of<AccountUser>(context);
            if (value == null || accountUser.user == null) return LoadingPage();
            return Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 20, 0),
                  child: Container(
                    height: 80,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              IconButton(
                                
                                  padding: EdgeInsets.all(0),
                                  icon: Icon(
                                    Icons.settings,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, RouteName.settingPage);
                                  }),
                              IconButton(
                                padding: EdgeInsets.all(0.0),
                                icon: Icon(Icons.list,
                                    size: 30, color: Colors.white),
                                onPressed: (){
                                  Navigator.pushNamed(
                                        context, RouteName.learnedWordsPage);
                                },
                              ),
                            ],
                          ),
                          Text(
                            'Lessons',
                            style: TextStyle(
                                fontSize: 35,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Container(
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        color: Colors.green[200],
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(45)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 45, 0, 0),
                        child:
                            LessonList(value: value, accountUser: accountUser),
                      )),
                )),
              ],
            );
          }),
        ),
      ),
    );
  }
}
