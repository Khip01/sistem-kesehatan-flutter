// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DoctorImpl _$$DoctorImplFromJson(Map<String, dynamic> json) => _$DoctorImpl(
      idIhs: json['idIhs'] as String,
      nik: json['nik'] as String,
      name: json['name'] as String,
      specialist: json['specialist'] as String,
      sip: json['sip'] as String,
      gender: json['gender'] as String,
      birthDate: json['birthDate'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      photo: json['photo'] as String,
    );

Map<String, dynamic> _$$DoctorImplToJson(_$DoctorImpl instance) =>
    <String, dynamic>{
      'idIhs': instance.idIhs,
      'nik': instance.nik,
      'name': instance.name,
      'specialist': instance.specialist,
      'sip': instance.sip,
      'gender': instance.gender,
      'birthDate': instance.birthDate,
      'phone': instance.phone,
      'email': instance.email,
      'photo': instance.photo,
    };
