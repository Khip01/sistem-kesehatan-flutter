import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../presentation/extension/strings.dart';
import '../../dto/login_response.dart';
import '../local_datasources/auth_local_datasources.dart';

class AuthRemoteDatasource {
  Future<Either<String, AuthResponseModel>> login(
      String email, String password) async {
    final url = Uri.parse('$baseUrl/api/login');
    final response = await http.post(
      url,
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      await AuthLocalDataSource()
          .saveAuthData(AuthResponseModel.fromJson(jsonDecode(response.body)));
      return Right(AuthResponseModel.fromJson(jsonDecode(response.body)));
    } else {
      return const Left('Gagal login');
    }
  }

  Future<Either<String, String>> logout() async {
    final authDataModel = await AuthLocalDataSource().getAuthData();
    final url = Uri.parse('$baseUrl/api/logout');
    final response = await http.post(url, headers: {
      'Authorization': 'Bearer ${authDataModel?.token}',
    });

    if (response.statusCode == 200) {
      await AuthLocalDataSource().removeAuthData();
      return const Right('Logout berhasil');
    } else {
      return const Left('Logout gagal');
    }
  }
}
