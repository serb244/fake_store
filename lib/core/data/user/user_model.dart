import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  // final String id;
  final String username;
  final String email;
  final String password;

  const UserModel({
    // required this.id,
     this.username = '',
     this.email = '',
     this.password = '',
  });

  @override
  List<Object?> get props => [username, email, password];

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'email': email,
      'password': password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      username: map['username'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }
}
