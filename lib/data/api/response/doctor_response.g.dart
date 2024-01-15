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
      fullName: json['full_name'] as String?,
      avatar: json['avatar'] as String?,
      biography: json['biography'] as String?,
      specialty: json['specialty'] as String?,
      accountBalance: json['account_balance'] as int?,
      experience: json['experience'] as int?,
      feePerMinutes: json['fee_per_minutes'] as int?,
      fixedTimes: json['fixed_times'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      ratings: (json['ratings'] as num?)?.toDouble(),
      numberOfConsultation: json['number_of_consultation'] as int?,
    );

Map<String, dynamic> _$DoctorResponseToJson(DoctorResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phone': instance.phone,
      'email': instance.email,
      'full_name': instance.fullName,
      'avatar': instance.avatar,
      'biography': instance.biography,
      'specialty': instance.specialty,
      'account_balance': instance.accountBalance,
      'experience': instance.experience,
      'fee_per_minutes': instance.feePerMinutes,
      'fixed_times': instance.fixedTimes,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'ratings': instance.ratings,
      'number_of_consultation': instance.numberOfConsultation,
    };
