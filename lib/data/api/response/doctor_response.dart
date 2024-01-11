import 'package:json_annotation/json_annotation.dart';

part 'doctor_response.g.dart';

@JsonSerializable()
class DoctorResponse {
  String? id;
  String? phone;
  String? email;
  String? fullName;
  String? avatar;
  String? biography;
  String? specialty;
  int? accountBalance;
  int? experience;
  int? feePerMinutes;
  String? fixedTimes;
  String? createdAt;
  String? updatedAt;
  double? ratings;
  int? numberOfConsultation;
  DoctorResponse({
    this.id,
    this.phone,
    this.email,
    this.fullName,
    this.avatar,
    this.biography,
    this.specialty,
    this.accountBalance,
    this.experience,
    this.feePerMinutes,
    this.fixedTimes,
    this.createdAt,
    this.updatedAt,
    this.ratings,
    this.numberOfConsultation,
  });

  factory DoctorResponse.fromJson(Map<String, dynamic> json) =>
      _$DoctorResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DoctorResponseToJson(this);
}
