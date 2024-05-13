import '../../domain/entities/user.dart';

class AuthResponseModel {
  final User? user;
  final String? token;

  AuthResponseModel({
    this.user,
    this.token,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    // Jika json["user"] null atau tidak ada, kembalikan null untuk user
    final userData = json["user"];
    final user = userData != null ? User.fromJson(userData) : null;

    return AuthResponseModel(
      user: user,
      token: json["token"],
    );
  }

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "token": token,
      };
}
