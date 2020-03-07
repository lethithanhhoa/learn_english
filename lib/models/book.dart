import 'package:cloud_firestore/cloud_firestore.dart';

class Book{
  String docId;
  String bookId;
  String bookTitle;
  String imgName;

  Book({this.docId, this.bookId, this.bookTitle, this.imgName});

  factory Book.fromSnapshot(DocumentSnapshot snapshot){
    return Book(
      docId : snapshot.documentID,
      bookId : snapshot.data['bookId'],
      bookTitle: snapshot.data['bookTitle'],
      imgName: snapshot.data['imgName'],
    );
  }

  factory Book.fromJson(Map<String, dynamic> data){
    return Book(
      docId: data['id'],
      bookId : data['bookId'],
      bookTitle: data['bookTitle'],
      imgName: data['imgName'],
    );
  }
}