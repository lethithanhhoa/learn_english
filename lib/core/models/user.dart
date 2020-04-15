import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String userId;
  String email;
  String name;
  String avatarUrl;
  int score;
  Map<String, dynamic> state;

  User({this.userId, this.email, this.name, this.avatarUrl, this.score, this.state});

  factory User.fromSnapshot(DocumentSnapshot snapshot){
    print(snapshot);
    return User(
      userId : snapshot.documentID,
      name: snapshot.data['name'],
      email: snapshot.data['email'],
      avatarUrl: snapshot.data['avatar_url'],
      score: snapshot.data['score'],
      state: snapshot.data['state']
    );
  }
}