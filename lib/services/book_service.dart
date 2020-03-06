import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:learn_english/models/book.dart';

class BookService {
  final CollectionReference _collectionReference =
      Firestore.instance.collection('books');

  void getData() {
  _collectionReference
      .getDocuments()
      .then((QuerySnapshot snapshot) {
    snapshot.documents.forEach((f) => print('${f.data}}'));
  });
}
  Future<List<Book>> getListBook() async {
    try {
      this.getData();

      var ref = await _collectionReference.getDocuments();
      
      List<Book> listBook =
          ref.documents.map((doc) => Book.fromSnapshot(doc)).toList();
      return listBook;
    } catch (errors) {
      print(errors);
      throw (errors);
    }
  }

  Future<Book> getBookById({@required String docId}) async {
    try {
      var document = await _collectionReference.document(docId).get();
      return Book.fromSnapshot(document);
    } catch (errors) {
      throw (errors);
    }
  }
}
