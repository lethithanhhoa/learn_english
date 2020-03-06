import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learn_english/services/unit_service.dart';
class UnitService{

  final CollectionReference _unitReference = Firestore.instance.collection("units");

  void getUnits(){
    _unitReference
    .getDocuments()
    .then((QuerySnapshot snapshot) {
    snapshot.documents.forEach((f) => print('${f.data}}'));
  });
  }
  
}