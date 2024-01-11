import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_model.g.dart';

// ignore: must_be_immutable
@JsonSerializable()
class AuthModel extends Equatable {
  String? localId;
  String? email;
  String? displayName;
  String? accessToken;
  String? refreshToken;
  AuthModel({
    this.localId,
    this.email,
    this.displayName,
    this.accessToken,
    this.refreshToken,
  });
  @override
  List<Object?> get props =>
      [localId, email, displayName, accessToken, refreshToken];
  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);
  Map<String, dynamic> toJson() => _$AuthModelToJson(this);
}
