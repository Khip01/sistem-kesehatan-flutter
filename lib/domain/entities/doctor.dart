import 'package:freezed_annotation/freezed_annotation.dart';

part 'doctor.freezed.dart';
part 'doctor.g.dart';

@freezed
class Doctor with _$Doctor {
  const factory Doctor({
    required String idIhs,
    required String nik,
    required String name,
    required String specialist,
    required String sip,
    required String gender,
    required String birthDate,
    required String phone,
    required String email,
    required String photo,
  }) = _Doctor;

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        idIhs: json['id_ihs'],
        nik: json['nik'],
        name: json['name'],
        specialist: json['specialist'],
        sip: json['sip'],
        gender: json['gender'],
        birthDate: json['birth_date'],
        phone: json['phone'],
        email: json['email'],
        photo: json['photo'],
      );
}
