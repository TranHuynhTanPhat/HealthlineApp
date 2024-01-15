import 'dart:convert';

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

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (profileId != null) {
      result.addAll({'profileId': profileId});
    }
    if (avatar != null) {
      result.addAll({'avatar': avatar});
    }
    if (phone != null) {
      result.addAll({'phone': phone});
    }
    if (password != null) {
      result.addAll({'password': password});
    }
    if (passwordConfirm != null) {
      result.addAll({'passwordConfirm': passwordConfirm});
    }
    if (fullName != null) {
      result.addAll({'fullName': fullName});
    }
    if (gender != null) {
      result.addAll({'gender': gender});
    }
    if (birthday != null) {
      result.addAll({'birthday': birthday});
    }
    if (address != null) {
      result.addAll({'address': address});
    }
    if (email != null) {
      result.addAll({'email': email});
    }
    if (relationship != null) {
      result.addAll({'relationship': _$RelationshipEnumMap[relationship]});
    }

    return result;
  }

  factory AuthRequest.fromMap(Map<String, dynamic> map) {
    return AuthRequest(
      profileId: map['profile_id'],
      avatar: map['avatar'],
      phone: map['phone'],
      password: map['password'],
      passwordConfirm: map['password_confirm'],
      fullName: map['full_name'],
      gender: map['gender'],
      birthday: map['birthday'],
      address: map['address'],
      email: map['email'],
      relationship: map['relationship'] != null
          ? $enumDecodeNullable(_$RelationshipEnumMap, map['relationship'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthRequest.fromJson(String source) =>
      AuthRequest.fromMap(json.decode(source));
}
