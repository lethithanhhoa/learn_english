import 'package:learn_english/core/models/vocabulary.dart';
import 'package:sembast/sembast.dart';
import 'package:learn_english/core/helper/database_setup.dart';

class VocabService {
  static const String folderName = "Vocab";
  final _folder = intMapStoreFactory.store(folderName);

  Future<Database> get _db async => await AppDatabase.instance.database;

  Future insertListVocab(List<Vocabulary> list) async {
    list.forEach((element) async {
      await _folder.add(await _db, element.toMap());
    });
  }

  Future<List<Vocabulary>> getAllVocab() async {
    final recordSnapshot = await _folder.find(await _db);
    return recordSnapshot.map((snapshot) {
      final vocab = Vocabulary.fromMap(snapshot.value);
      return vocab;
    }).toList();
  }

  Future<List<Vocabulary>> getVocabListByLessonId(String lessonId) async {
    final records = await _folder.find(await _db,
        finder: Finder(filter: Filter.equals('lessonId', lessonId)));

    return records.map((snapshot) {
      final vocab = Vocabulary.fromMap(snapshot.value);
      return vocab;
    }).toList();
  }

  Future<List<Vocabulary>> getVocabListByListOfLessonId(
      List<String> listOfLessonId) async {
    final records = await _folder.find(await _db,
        finder: Finder(filter: Filter.inList('lessonId', listOfLessonId)));

    return records.map((snapshot) {
      final vocab = Vocabulary.fromMap(snapshot.value);
      return vocab;
    }).toList();
  }

  Future<List<Vocabulary>> getVocabListByListOfType(
      List<String> listOfType) async {
    final records = await _folder.find(await _db,
        finder: Finder(filter: Filter.inList('type', listOfType)));

    return records.map((snapshot) {
      final vocab = Vocabulary.fromMap(snapshot.value);
      return vocab;
    }).toList();
  }

  Future<Null> clearAllVocab() async {
    await _folder.delete(await _db);
    return;
  }
}
