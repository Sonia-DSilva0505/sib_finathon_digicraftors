import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String name;
  final String email;
  final String id;
  Map<String, int > tages  = {};
  final String dateOfBirth;
  double userScore;
  

  User({
    required this.name,
    required this.email,
    required this.id,
    required this.dateOfBirth,
    required this.userScore,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'id': id,
        "dateOfBirth": dateOfBirth,
        'userScore': userScore,
      };

  factory User.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return User(
        name: data['name'],
        email: data['email'],
        id: data['id'],
        dateOfBirth: data['dateOfBirth'],
        userScore: data['userScore'],);
  }
}
