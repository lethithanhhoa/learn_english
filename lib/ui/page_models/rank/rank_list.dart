import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_english/core/models/user.dart';
import 'package:learn_english/ui/modules/general_parameter.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

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
            text = '${currentUser.taptap}';
          else if (typeOfCode == 2)
            text = '${currentUser.taptap}';
          else if (typeOfCode == 3) text = 'Level ${currentUser.memoryCard}';

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
                                  ? highLightTextAtRanking
                                  : Colors.black
                                      .withOpacity(blackOpacityAtRanking),
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
                                    ? highLightTextAtRanking
                                    : Colors.black.withOpacity(blackOpacity),
                                fontSize: (index == i) ? 25 : 20,
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
                              fontSize: (typeOfCode == 3) ? 25 : 30,
                              color: (index == i)
                                  ? highLightTextAtRanking
                                  : Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 88,
                decoration: BoxDecoration(
                  color: (index == i)
                      ? Colors.yellow.withOpacity(highLightOpacityAtRanking)
                      : null,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
