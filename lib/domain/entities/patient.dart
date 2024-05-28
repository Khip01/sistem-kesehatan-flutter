import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient.freezed.dart';
part 'patient.g.dart';

@freezed
class Patient with _$Patient {
  factory Patient({
    required String nik,
    required String kk,
    required String name,
    required String phone,
    required String email,
    required String gender,
    required String birthPlace,
    required String birthDate,
    required int isDeceased,
    required String addressLine,
    required String city,
    required String cityCode,
    required String province,
    required String provinceCode,
    required String district,
    required String districtCode,
    required String village,
    required String villageCode,
    required String rt,
    required String rw,
    required String postalCode,
    required String maritalCtatus,
    required String relationshipName,
    required String relationshipPhone,
  }) = _Patient;

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
      nik: json["nik"],
      kk: json["kk"],
      name: json["name"],
      phone: json["phone"],
      email: json["email"],
      gender: json["gender"],
      birthPlace: json["birth_place"],
      birthDate: json["birth_date"],
      isDeceased: json["is_deceased"],
      addressLine: json["address_line"],
      city: json["city"],
      cityCode: json["city_code"],
      province: json["province"],
      provinceCode: json["province_code"],
      district: json["district"],
      districtCode: json["district_code"],
      village: json["village"],
      villageCode: json["village_code"],
      rt: json["rt"],
      rw: json["rw"],
      postalCode: json["postal_code"],
      maritalCtatus: json["marital_status"],
      relationshipName: json["relationship_name"],
      relationshipPhone: json["relationship_phone"]);
}
