import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String userId;
  String googleId;
  String email;
  String name;
  String avatarUrl;

  User({this.userId, this.googleId, this.email, this.name, this.avatarUrl});

  factory User.fromSnapshot(DocumentSnapshot snapshot){
    print(snapshot);
    return User(
      userId : snapshot.documentID,
      googleId : snapshot.data['id'],
      name: snapshot.data['name'],
      email: snapshot.data['email'],
      avatarUrl: snapshot.data['avatar_url']
    );
  }
}