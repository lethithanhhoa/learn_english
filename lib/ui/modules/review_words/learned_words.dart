import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_english/core/models/vocabulary.dart';
import 'package:learn_english/core/services/firestore_service.dart';
import 'package:learn_english/ui/common/side_menu_bar.dart';
import 'package:learn_english/ui/modules/audio/audio_player.dart';
import 'package:learn_english/ui/provider/account_user.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../../general_parameter.dart';
import '../loading_page.dart';
import 'detail_word_page.dart';

class LearnedWords extends StatelessWidget {
  // VocabService _vocabService = VocabService();
  List<String> lessonList;
  AudioCustomPlayer playAudio = AudioCustomPlayer();
  FireStoreService _fireStoreService = FireStoreService();
  // Future<List<Vocabulary>> getVocabByLesson(List<String> lessonIdList) async {
  //   var list = await _vocabService.getVocabListByListOfLessonId(lessonIdList);

  //   return list;
  // }

  @override
  Widget build(BuildContext context) {
    AccountUser accountUser = Provider.of<AccountUser>(context);
    if (accountUser.user == null) return LoadingPage();
    if (accountUser.user.learningResult == null)
      return Scaffold(
        drawer: kIsWeb ? NavigateDrawer() : null,
        appBar: AppBar(
          automaticallyImplyLeading: leadingAppBar,
          backgroundColor: appBarColor,
          title: Text(
            'Learned Words',
            style: GoogleFonts.handlee(
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: (kIsWeb) ? 30 : 25,
                fontWeight: (kIsWeb) ? FontWeight.normal : FontWeight.bold,
              ),
            ),
          ),
        ),
        body: Center(
            child: Text(
          'No data',
          style: TextStyle(
              fontSize: 20, color: Colors.black.withOpacity(blackOpacity)),
        )),
      );
    lessonList = accountUser.user.learningResult.keys.toList();

    return (lessonList == null)
        ? LoadingPage()
        : Scaffold(
            drawer: kIsWeb ? NavigateDrawer() : null,
            appBar: AppBar(
              automaticallyImplyLeading: leadingAppBar,
              backgroundColor: appBarColor,
              title: Text(
                'Learned Words',
                style: GoogleFonts.handlee(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: (kIsWeb) ? 30 : 25,
                    fontWeight: (kIsWeb) ? FontWeight.normal : FontWeight.bold,
                  ),
                ),
              ),
            ),
            backgroundColor: Colors.white,
            body: SafeArea(
              child: FutureBuilder(
                future:_fireStoreService.getVocabByLessonList(lessonList),
                builder: (context, AsyncSnapshot<List<Vocabulary>> value) {
                  if (value.data == null) return LoadingPage();

                  return ListView.builder(
                      itemCount: value.data.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ListTile(
                              title: Text(
                                value.data[index].vocab,
                                style: TextStyle(fontSize: 20),
                              ),
                              subtitle: AutoSizeText(
                                value.data[index].mean,
                                maxLines: 1,
                                style: GoogleFonts.farsan(
                                  textStyle: TextStyle(fontSize: 18),
                                ),
                              ),
                              trailing: IconButton(
                                  padding: EdgeInsets.all(0.0),
                                  onPressed: () {
                                    playAudio.playCustomAudioFile(
                                        value.data[index].audioFile);
                                  },
                                  icon: Icon(
                                    Icons.volume_up,
                                    size: 20,
                                  )),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType
                                            .rightToLeftWithFade,
                                        duration: Duration(milliseconds: 300),
                                        child: DetailWordPage(
                                          vocabList: value.data,
                                          index: index,
                                        )));
                              },
                            ),
                            Divider(),
                          ],
                        );
                      });
                },
              ),
            ),
          );
  }
}
