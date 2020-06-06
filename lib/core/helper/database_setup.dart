import 'dart:async';

import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:path/path.dart';
import 'package:sembast_web/sembast_web.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class AppDatabase {
  static final AppDatabase _singleton = AppDatabase._();

  static AppDatabase get instance => _singleton;
  Completer<Database> _dbOpenCompleter;
  AppDatabase._();
  Future<Database> get database async {
    if (_dbOpenCompleter == null) {
      _dbOpenCompleter = Completer();
      _openDatabase();
    }
    return _dbOpenCompleter.future;
  }

  Future _openDatabase() async {
    var database;
    if (!kIsWeb) {
      final appDocumentDir = await getApplicationDocumentsDirectory();
      print(appDocumentDir);
      final dbPath = join(appDocumentDir.path, 'MyDatabase.db');
      database = await databaseFactoryIo.openDatabase(dbPath);
    } else {
      final factory = databaseFactoryWeb;
      database = await factory.openDatabase('MyDatabase');
    }
    _dbOpenCompleter.complete(database);
  }
}
