import 'package:json_annotation/json_annotation.dart';

import '../../../presentation/resources/export.dart';

part 'auth_request.g.dart';

@JsonSerializable()
class AuthRequest {
  String? profileId;
  String? avatar;
  String? phone;
  String? password;
  String? passwordConfirm;
  String? fullName;
  String? gender;
  String? birthday;
  String? address;
  String? email;
  Relationship? relationship;
  AuthRequest({
    this.profileId,
    this.avatar,
    this.phone,
    this.password,
    this.passwordConfirm,
    this.fullName,
    this.gender,
    this.birthday,
    this.address,
    this.email,
    this.relationship,
  });
  factory AuthRequest.fromJson(Map<String, dynamic> json) =>
      _$AuthRequestFromJson(json);
  Map<String, dynamic> toJson() => _$AuthRequestToJson(this);
}
