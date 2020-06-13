import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String userId;
  String email;
  String name;
  String avatarUrl;
  int exp;
  int taptap;
  int memoryCard;
  Map<String, dynamic> learningResult;

  User(
      {this.userId,
      this.email,
      this.name,
      this.avatarUrl,
      this.exp,
      this.taptap,
      this.memoryCard,
      this.learningResult});

  factory User.fromSnapshot(DocumentSnapshot snapshot) {
    return User(
        userId: snapshot.documentID,
        name: snapshot.data['name'],
        email: snapshot.data['email'],
        avatarUrl: snapshot.data['avatar_url'],
        exp: snapshot.data['exp'],
        taptap: snapshot.data['taptap'],
        memoryCard: snapshot.data['memory_card'],
        learningResult: snapshot.data['learning_result']);
  }
}
