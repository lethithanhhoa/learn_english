import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:learn_english/models/unit.dart';

class UnitService {
  final CollectionReference _collectionReference = Firestore.instance.collection('books');  

  Future<List<Unit>> getListUnit(String indexBookId) async {
      var ref = await _collectionReference.document(indexBookId).collection('units').getDocuments();
      List<Unit> listUnit =
          ref.documents.map((doc) => Unit.fromSnapshot(doc)).toList();
      return listUnit;
  }
}
