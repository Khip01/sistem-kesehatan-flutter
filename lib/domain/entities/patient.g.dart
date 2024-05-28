// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PatientImpl _$$PatientImplFromJson(Map<String, dynamic> json) =>
    _$PatientImpl(
      nik: json['nik'] as String,
      kk: json['kk'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      gender: json['gender'] as String,
      birthPlace: json['birthPlace'] as String,
      birthDate: json['birthDate'] as String,
      isDeceased: (json['isDeceased'] as num).toInt(),
      addressLine: json['addressLine'] as String,
      city: json['city'] as String,
      cityCode: json['cityCode'] as String,
      province: json['province'] as String,
      provinceCode: json['provinceCode'] as String,
      district: json['district'] as String,
      districtCode: json['districtCode'] as String,
      village: json['village'] as String,
      villageCode: json['villageCode'] as String,
      rt: json['rt'] as String,
      rw: json['rw'] as String,
      postalCode: json['postalCode'] as String,
      maritalCtatus: json['maritalCtatus'] as String,
      relationshipName: json['relationshipName'] as String,
      relationshipPhone: json['relationshipPhone'] as String,
    );

Map<String, dynamic> _$$PatientImplToJson(_$PatientImpl instance) =>
    <String, dynamic>{
      'nik': instance.nik,
      'kk': instance.kk,
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'gender': instance.gender,
      'birthPlace': instance.birthPlace,
      'birthDate': instance.birthDate,
      'isDeceased': instance.isDeceased,
      'addressLine': instance.addressLine,
      'city': instance.city,
      'cityCode': instance.cityCode,
      'province': instance.province,
      'provinceCode': instance.provinceCode,
      'district': instance.district,
      'districtCode': instance.districtCode,
      'village': instance.village,
      'villageCode': instance.villageCode,
      'rt': instance.rt,
      'rw': instance.rw,
      'postalCode': instance.postalCode,
      'maritalCtatus': instance.maritalCtatus,
      'relationshipName': instance.relationshipName,
      'relationshipPhone': instance.relationshipPhone,
    };
