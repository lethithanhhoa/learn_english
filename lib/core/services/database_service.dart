import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learn_english/core/models/book.dart';
import 'package:learn_english/core/models/unit.dart';
import 'package:learn_english/core/models/word.dart';

class Database{
  final CollectionReference _collectionReference =
      Firestore.instance.collection('books');
 
  Future<List<Book>> getListBook() async {
      var ref = await _collectionReference.getDocuments();
      List<Book> listBook =
          ref.documents.map((doc) => Book.fromSnapshot(doc)).toList();
      return listBook;
  }

  Future<List<Unit>> getListUnit(String bookId) async {
      var ref = await _collectionReference.document(bookId).collection('units').getDocuments();
      List<Unit> listUnit =
          ref.documents.map((doc) => Unit.fromSnapshot(doc)).toList();
      return listUnit;
  }

  Future<List<Word>> getListWord(String bookId, String unitId) async {
      var ref = await _collectionReference.document(bookId).collection('units').document(unitId).collection('words').getDocuments();
      List<Word> listWord =
          ref.documents.map((doc) => Word.fromSnapshot(doc)).toList();
      //random
      // listWord.shuffle();
      return listWord;
  }  
}