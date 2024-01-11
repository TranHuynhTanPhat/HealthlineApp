// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorResponse _$DoctorResponseFromJson(Map<String, dynamic> json) =>
    DoctorResponse(
      id: json['id'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      fullName: json['fullName'] as String?,
      avatar: json['avatar'] as String?,
      biography: json['biography'] as String?,
      specialty: json['specialty'] as String?,
      accountBalance: json['accountBalance'] as int?,
      experience: json['experience'] as int?,
      feePerMinutes: json['feePerMinutes'] as int?,
      fixedTimes: json['fixedTimes'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      ratings: (json['ratings'] as num?)?.toDouble(),
      numberOfConsultation: json['numberOfConsultation'] as int?,
    );

Map<String, dynamic> _$DoctorResponseToJson(DoctorResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phone': instance.phone,
      'email': instance.email,
      'fullName': instance.fullName,
      'avatar': instance.avatar,
      'biography': instance.biography,
      'specialty': instance.specialty,
      'accountBalance': instance.accountBalance,
      'experience': instance.experience,
      'feePerMinutes': instance.feePerMinutes,
      'fixedTimes': instance.fixedTimes,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'ratings': instance.ratings,
      'numberOfConsultation': instance.numberOfConsultation,
    };
