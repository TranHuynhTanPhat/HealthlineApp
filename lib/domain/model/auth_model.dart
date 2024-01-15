import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_model.g.dart';

@JsonSerializable()
class AuthModel extends Equatable {
  final String? id;
  final String? jwtToken;
  @override
  List<Object?> get props => [id, jwtToken];
  const AuthModel({required this.id, required this.jwtToken});
  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);
  Map<String, dynamic> toJson() => _$AuthModelToJson(this);
}
