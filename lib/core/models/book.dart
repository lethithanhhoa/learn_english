import 'package:cloud_firestore/cloud_firestore.dart';

class Book{
  String bookId;
  String bookTitle;
  String imgName;

  Book({this.bookId, this.bookTitle, this.imgName});

  factory Book.fromSnapshot(DocumentSnapshot snapshot){
    return Book(
      bookId : snapshot.documentID,
      bookTitle: snapshot.data['bookTitle'],
      imgName: snapshot.data['imgName'],
    );
  }

  factory Book.fromJson(Map<String, dynamic> data){
    return Book(
      bookId: data['id'],
      bookTitle: data['bookTitle'],
      imgName: data['imgName'],
    );
  }
}