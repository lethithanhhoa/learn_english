import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_english/core/models/user.dart';
import 'package:learn_english/ui/pages/loading_page.dart';
import 'package:provider/provider.dart';

class RankList extends StatelessWidget {
  List<User> value = [];
  int typeOfCode;
  RankList({this.value, this.typeOfCode});
  final _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: ListView.builder(
          itemCount: value.length,
          itemBuilder: (context, index) {
            User currentUser = value[index];
            String text = '';
            if (typeOfCode == 0)
              text = '${currentUser.exp}';
            else if (typeOfCode == 1)
              text = '${currentUser.matrix2by2}';
            else if (typeOfCode == 2)
              text = '${currentUser.matrix3by3}';
            else if (typeOfCode == 3) text = '${currentUser.matrix4by4}';
            return ListTile(
              // leading: Text('${index + 1}'),
              title: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: AutoSizeText(
                            '${index + 1}',
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black54,
                                fontFamily: 'Arial'),
                          ),
                        ),
                      ),
                      Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: Image.network(currentUser.avatarUrl).image,
                          ),
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Expanded(
                          flex: 5,
                          child: AutoSizeText(
                            '${currentUser.name}',
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 20,
                              // fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.fade,
                            softWrap: false,
                          )),
                      Expanded(
                        flex: 2,
                        child: AutoSizeText(
                          text,
                          maxLines: 1,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(thickness: 1),
                ],
              ),
            );
          }),
    );
  }
  // _animateToIndex(i) => _controller.animateTo(60 * i, duration: Duration(seconds: 2), curve: Curves.fastOutSlowIn);
}
