import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learn_english/models/unit.dart';

class UnitService {
  final CollectionReference _collectionReference =
      Firestore.instance.collection('units');


  Future<List<Unit>> getListUnit() async {
      var ref = await _collectionReference.getDocuments();
      List<Unit> listUnit =
          ref.documents.map((doc) => Unit.fromSnapshot(doc)).toList();
      return listUnit;
  }
}
