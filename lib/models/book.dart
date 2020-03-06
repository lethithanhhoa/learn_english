import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learn_english/models/unit.dart';
class Book{
  String docId;
  String bookId;
  String bookTitle;

  Book({this.docId, this.bookId, this.bookTitle});

  factory Book.fromSnapshot(DocumentSnapshot snapshot){
    return Book(
      docId: snapshot.documentID,
      bookId: snapshot.data['id'],
      bookTitle: snapshot.data['title'],
    );
  }

  factory Book.fromJson(Map<String, dynamic> data){
    return Book(
      docId: data['id'],
      bookId: data['bookId'],
      bookTitle: data['title'],
    );
  }
}