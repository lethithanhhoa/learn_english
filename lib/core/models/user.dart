import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String userId;
  String email;
  String name;
  String avatarUrl;
  int exp;
  int matrix2by2;
  int matrix3by3;
  int matrix4by4;
  Map<String, dynamic> learningState;

  User(
      {this.userId,
      this.email,
      this.name,
      this.avatarUrl,
      this.exp,
      this.matrix2by2,
      this.matrix3by3,
      this.matrix4by4,
      this.learningState});

  factory User.fromSnapshot(DocumentSnapshot snapshot) {
    print(snapshot);
    return User(
        userId: snapshot.documentID,
        name: snapshot.data['name'],
        email: snapshot.data['email'],
        avatarUrl: snapshot.data['avatar_url'],
        exp: snapshot.data['exp'],
        matrix2by2: snapshot.data['matrix2by2'],
        matrix3by3: snapshot.data['matrix3by3'],
        matrix4by4: snapshot.data['matrix4by4'],
        learningState: snapshot.data['state']);
  }
}
