import 'package:equatable/equatable.dart';

class AuthModel extends Equatable {
  final String accessToken;
  final String refreshToken;

  const AuthModel({
    required this.accessToken,
    required this.refreshToken,
  });

  @override
  List<Object?> get props => [accessToken, refreshToken];

  Map<String, dynamic> toJson() {
    return {
      "accessToken": accessToken,
      "refreshToken": refreshToken,
    };
  }

  factory AuthModel.fromApiResponse(Map<String, dynamic> json) {
    return AuthModel(
      accessToken: json["access"],
      refreshToken: json["refresh"],
    );
  }
  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      accessToken: json["accessToken"],
      refreshToken: json["refreshToken"],
    );
  }
}
