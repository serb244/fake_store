import 'package:equatable/equatable.dart';
import 'auth_model.dart';
enum UserType { admin, user, guest }
class UserModel extends Equatable {
  final int id;
  final String username;
  final String email;
  final bool isAdmin;
  final AuthModel authModel;

  const UserModel({
    required this.id,
    required this.username,
    required this.email,
    this.isAdmin = false,
    required this.authModel,
  });

  UserType getUserType() {
    return isAdmin ? UserType.admin : UserType.user;
  }
  @override
  List<Object?> get props => [id, username, email, isAdmin, authModel];

  factory UserModel.guest() {
    return const UserModel(
      id: 0,
      username: "Guest",
      email: "",
      isAdmin: false,
      authModel: AuthModel(
        accessToken: "",
        refreshToken: "",
      ),
    );
  }
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['user']["id"],
      username: json["user"]["username"],
      email: json["user"]["email"],
      isAdmin: json["user"]["is_superuser"] ?? false,
      authModel: AuthModel.fromApiResponse(json),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "username": username,
      "email": email,
      "isAdmin": isAdmin,
      "authModel": authModel.toJson(),
    };
  }
}
