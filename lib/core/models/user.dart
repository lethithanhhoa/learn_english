import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String userId;
  String email;
  String name;
  String avatarUrl;
  int exp;
  int taptap;
  int memory;
  Map<String, dynamic> learningState;

  User(
      {this.userId,
      this.email,
      this.name,
      this.avatarUrl,
      this.exp,
      this.taptap,
      this.memory,
      this.learningState});

  factory User.fromSnapshot(DocumentSnapshot snapshot) {
    print(snapshot);
    return User(
        userId: snapshot.documentID,
        name: snapshot.data['name'],
        email: snapshot.data['email'],
        avatarUrl: snapshot.data['avatar_url'],
        exp: snapshot.data['exp'],
        taptap: snapshot.data['taptap'],
        memory: snapshot.data['memory'],
        learningState: snapshot.data['state']);
  }
}
