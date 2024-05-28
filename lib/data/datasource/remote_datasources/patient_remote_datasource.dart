import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import 'package:sistem_kesehatan_flutter/data/datasource/local_datasources/auth_local_datasources.dart';
import 'package:sistem_kesehatan_flutter/domain/entities/patient.dart';
import 'package:sistem_kesehatan_flutter/presentation/extension/extension.dart';

class PatientRemoteDatasource {
  Future<Either<String, List<Patient>>> getPatients() async {
    final authDataModel = await AuthLocalDataSource().getAuthData();
    final url = Uri.parse('$baseUrl/api/api-patients');
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer ${authDataModel?.token}',
    });

    if (response.statusCode == 200) {
      return Right(List<Patient>.from(
        jsonDecode(response.body)["data"].map(
          (responseData) => Patient.fromJson(responseData),
        ),
      ).toList());
    } else {
      return Left(response.body);
    }
  }
}
