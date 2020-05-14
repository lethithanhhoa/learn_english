import 'package:learn_english/core/models/lesson.dart';
import 'package:learn_english/core/models/db_version.dart';
import 'package:sembast/sembast.dart';
import 'package:learn_english/core/helper/database_setup.dart';

class DBVerService {
  static const String folderName = "Overview";
  final _folder = intMapStoreFactory.store(folderName);

  Future<Database> get _db async => await AppDatabase.instance.database;

  Future insertVersion(DBVersion version) async {
    await _folder.add(await _db, version.toMap());
  }

  Future<DBVersion> getVersion() async {
    final record = await _folder.find(await _db);
    var version = record.map((snapshot) {
      final version = DBVersion.fromMap(snapshot.value);
      return version;
    }).toList()[0];
    return version;
  }

  Future<Null> clearVersion() async {
    await _folder.delete(await _db);
    print('delete OK...');
    return;
  }
}
