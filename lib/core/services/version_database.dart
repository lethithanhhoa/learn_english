// import 'package:sembast/sembast.dart';
// import 'package:learn_english/core/helper/database_setup.dart';

// class VersionDatabase {
//   static const String folderName = "Version";
//   final _folder = intMapStoreFactory.store(folderName);

//   Future<Database> get _db async => await AppDatabase.instance.database;

//   Future addVersion(String ver) async {
//     await _folder.delete(await _db);
//     Map<String, String> version = {'version': ver};
//     await _folder.add(await _db, version);
//     print('add ${ver} new success');
//   }

//   Future<String> getVersion() async {
//     final ver = await _folder.find(await _db);
//     return (ver.isNotEmpty)? ver.first.value.values.toList()[0] : 'noData';
//   }

//   // Future clearVersion() async{
//   //   await _folder.delete(await _db);
//   // }
// }
