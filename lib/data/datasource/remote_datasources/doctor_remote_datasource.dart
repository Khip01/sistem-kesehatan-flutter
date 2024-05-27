import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:sistem_kesehatan_flutter/domain/entities/doctor.dart';

import '../../../presentation/extension/strings.dart';
import '../local_datasources/auth_local_datasources.dart';

class DoctorRemoteDatasource {
  Future<Either<String, List<Doctor>>> getDoctors() async {
    final authDataModel = await AuthLocalDataSource().getAuthData();
    final url = Uri.parse('$baseUrl/api/api-doctors');
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer ${authDataModel?.token}',
    });

    if (response.statusCode == 200) {
      return Right(List<Doctor>.from(
        jsonDecode(response.body)['data'].map(
          (transaction) => Doctor.fromJson(transaction),
        ),
      ).toList());
    } else {
      return Left(response.body);
    }
  }
}
