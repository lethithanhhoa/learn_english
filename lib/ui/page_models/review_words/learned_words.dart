import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_english/core/models/vocabulary.dart';
import 'package:learn_english/core/services/database_service.dart';
import 'package:learn_english/ui/modules/route_name.dart';
import 'package:learn_english/ui/pages/loading_page.dart';
import 'package:learn_english/ui/state/account_user.dart';
import 'package:provider/provider.dart';
import 'package:learn_english/ui/modules/audio_player.dart';
import 'package:learn_english/core/services/vocab_service.dart';

class LearnedWords extends StatelessWidget {
  // DatabaseService database = DatabaseService();
  VocabService _vocabService = VocabService();
  List<String> lessonList;
  AudioPlayer playAudio = AudioPlayer();

  Future<List<Vocabulary>> getVocabByLesson(List<String> lessonIdList) async {
    var list = await _vocabService.getVocabListByListOfLessonId(lessonIdList);

    return list;
  }

  @override
  Widget build(BuildContext context) {
    AccountUser accountUser = Provider.of<AccountUser>(context);
    if (accountUser.user == null) return LoadingPage();
    if (accountUser.user.learningState == null)
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Learned Words',
            style: GoogleFonts.handlee(
              textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w600),
            ),
          ),
          backgroundColor: Colors.green[300],
        ),
        body: Center(child: Text('No data')),
      );
    lessonList = accountUser.user.learningState.keys.toList();
   
    return 
    (lessonList == null)
        ? LoadingPage()
        : 
        Scaffold(
            appBar: AppBar(
              title: Text(
                'Learned Words',
                style: GoogleFonts.handlee(
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w600),
                ),
              ),
              backgroundColor: Colors.green[300],
            ),
            backgroundColor: Colors.white,
            body: SafeArea(
              child: FutureBuilder(
                future: getVocabByLesson(lessonList),
                builder: (context, AsyncSnapshot<List<Vocabulary>> value) {
                  if (value.data == null) 
                  return LoadingPage();

                  return ListView.builder(
                      itemCount: value.data.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            value.data[index].vocab,
                            style: TextStyle(fontSize: 22),
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
                            Navigator.pushNamed(context, RouteName.detailWord,
                                arguments: [value.data, index]);
                          },
                        );
                      });
                },
              ),
            ),
          );
  }
}
