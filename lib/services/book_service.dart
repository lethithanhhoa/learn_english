import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learn_english/services/unit_service.dart';
import 'package:learn_english/models/book.dart';
class BookService{

  final CollectionReference _bookReference = Firestore.instance.collection("books");
  UnitService unitService = new UnitService();

  void getListBook(){
    _bookReference
    .getDocuments()
    .then((QuerySnapshot snapshot) {
    snapshot.documents.forEach((f) => 
    // unitService.getUnits());
    print('${f.data}}'));
  });
  }
  
  Future<List<Book>> getBook() async{
    var doc = await _bookReference.getDocuments();
    List<Book> listBook = doc.documents.map((doc) => Book.fromSnapshot(doc)).toList();
    print(listBook);
    return listBook;
  }
}