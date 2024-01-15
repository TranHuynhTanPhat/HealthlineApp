// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthRequest _$AuthRequestFromJson(Map<String, dynamic> json) => AuthRequest(
      profileId: json['profile_id'] as String?,
      avatar: json['avatar'] as String?,
      phone: json['phone'] as String?,
      password: json['password'] as String?,
      passwordConfirm: json['password_confirm'] as String?,
      fullName: json['full_name'] as String?,
      gender: json['gender'] as String?,
      birthday: json['birthday'] as String?,
      address: json['address'] as String?,
      email: json['email'] as String?,
      relationship:
          $enumDecodeNullable(_$RelationshipEnumMap, json['relationship']),
    );

Map<String, dynamic> _$AuthRequestToJson(AuthRequest instance) =>
    <String, dynamic>{
      'profileId': instance.profileId,
      'avatar': instance.avatar,
      'phone': instance.phone,
      'password': instance.password,
      'password_confirm': instance.passwordConfirm,
      'full_name': instance.fullName,
      'gender': instance.gender,
      'birthday': instance.birthday,
      'address': instance.address,
      'email': instance.email,
      'relationship': _$RelationshipEnumMap[instance.relationship],
    };

const _$RelationshipEnumMap = {
  Relationship.Children: 'children',
  Relationship.Parent: 'parent',
  Relationship.Grandparent: 'grandparent',
  Relationship.Sibling: 'sibling',
};
