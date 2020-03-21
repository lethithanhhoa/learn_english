import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learn_english/core/models/book.dart';
import 'package:learn_english/core/models/chant.dart';
import 'package:learn_english/core/models/conversation.dart';
import 'package:learn_english/core/models/song.dart';
import 'package:learn_english/core/models/unit.dart';
import 'package:learn_english/core/models/word.dart';

class Database {
  final CollectionReference _collectionReference =
      Firestore.instance.collection('books');

  Future<List<Book>> getListBook() async {
    var ref = await _collectionReference.getDocuments();
    List<Book> listBook =
        ref.documents.map((doc) => Book.fromSnapshot(doc)).toList();
    return listBook;
  }

  Future<List<Unit>> getListUnit(String bookId) async {
    var ref = await _collectionReference
        .document(bookId)
        .collection('units')
        .getDocuments();
    List<Unit> listUnit =
        ref.documents.map((doc) => Unit.fromSnapshot(doc)).toList();
    return listUnit;
  }

  Future<List<Word>> getListWord(String bookId, String unitId) async {
    var ref = await _collectionReference
        .document(bookId)
        .collection('units')
        .document(unitId)
        .collection('words')
        .getDocuments();
    List<Word> listWord =
        ref.documents.map((doc) => Word.fromSnapshot(doc)).toList();
    //random
    // listWord.shuffle();
    return listWord;
  }

  Future<List<Chant>> getChant(String bookId, String unitId) async {
    var ref = await _collectionReference
        .document(bookId)
        .collection('units')
        .document(unitId)
        .collection('chant')
        .getDocuments();
    List<Chant> chant =
        ref.documents.map((doc) => Chant.fromSnapshot(doc)).toList();
    return chant;
  }

  Future<List<Conversation>> getConversation(String bookId, String unitId) async {
    var ref = await _collectionReference
        .document(bookId)
        .collection('units')
        .document(unitId)
        .collection('talking')
        .getDocuments();
    List<Conversation> conversation =
        ref.documents.map((doc) => Conversation.fromSnapshot(doc)).toList();
    return conversation;
  }

  Future<List<Song>> getSong(String bookId, String unitId) async {
    var ref = await _collectionReference
        .document(bookId)
        .collection('units')
        .document(unitId)
        .collection('song')
        .getDocuments();
    List<Song> song =
        ref.documents.map((doc) => Song.fromSnapshot(doc)).toList();
    return song;
  }
}
