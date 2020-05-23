import 'package:learn_english/core/models/lesson.dart';
import 'package:learn_english/core/models/vocabulary.dart';
import 'package:sembast/sembast.dart';
import 'package:learn_english/core/helper/database_setup.dart';

class LessonService {
  static const String folderName = "Lesson";
  final _folder = intMapStoreFactory.store(folderName);

  Future<Database> get _db async => await AppDatabase.instance.database;

  Future insertListLesson(List<Lesson> list) async {
    list.forEach((element) async {
      await _folder.add(await _db, element.toMap());
      print('add ${element.lessonId } success');
    });
  }

  Future<List<Lesson>> getAllLesson() async {
    final records = await _folder.find(await _db);
    return records.map((snapshot) {
      final vocab = Lesson.fromMap(snapshot.value);
      return vocab;
    }).toList();
  }

  Future<Null> clearAllLesson() async{
    await _folder.delete(await _db);
    print('delete OK...');
    return;
  }
}
