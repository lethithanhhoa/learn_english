import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:learn_english/core/models/book.dart';


class BookService {
  
  final CollectionReference _collectionReference =
      Firestore.instance.collection('books');
 
  Future<List<Book>> getListBook() async {
      var ref = await _collectionReference.getDocuments();
      List<Book> listBook =
          ref.documents.map((doc) => Book.fromSnapshot(doc)).toList();
      return listBook;
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
