import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_english/core/models/user.dart';
import 'package:learn_english/ui/state/account_user.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

// class RankList extends StatefulWidget {

//   _RankListState createState() => _RankListState();
// }

class RankList extends StatelessWidget {
  ItemScrollController _scrollController = ItemScrollController();
  List<User> value = [];
  int typeOfCode;
  int index;
  RankList({this.value, this.typeOfCode, this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: ScrollablePositionedList.builder(
        itemScrollController: _scrollController,
        itemCount: value.length,
        initialScrollIndex: index,
        itemBuilder: (context, i) {
          User currentUser = value[i];

          String text = '';
          if (typeOfCode == 0)
            text = '${currentUser.exp}';
          else if (typeOfCode == 1)
            text = '${currentUser.matrix2by2}';
          else if (typeOfCode == 2)
            text = '${currentUser.matrix3by3}';
          else if (typeOfCode == 3) text = '${currentUser.matrix4by4}';

          return Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: AutoSizeText(
                            '${i + 1}',
                            maxLines: 1,
                            style: GoogleFonts.anton(
                              fontSize: 23,
                              color: (index == i)
                                  ? Colors.green[700]
                                  : Colors.black.withOpacity(0.6),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
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
                                color: (index == i)
                                    ? Colors.green[700]
                                    : Colors.black.withOpacity(0.7),
                                fontSize: (index == i) ? 25 : 20,
                                // fontWeight: (index == i)
                                //     ? FontWeight.bold
                                //     : FontWeight.normal,
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
                              color: (index == i)
                                  ? Colors.green[700]
                                  : Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Divider(),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 88,
                decoration: BoxDecoration(
                  color: (index == i) ? Colors.yellow.withOpacity(0.2) : null,
                  // borderRadius: (index == 0)? BorderRadius.only(topRight: Radius.circular(40)): null,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
