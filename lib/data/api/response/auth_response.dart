import 'package:json_annotation/json_annotation.dart';

part 'auth_response.g.dart';

@JsonSerializable()
class AuthResponse {
  String? id;
  String? jwtToken;

  AuthResponse({this.id, this.jwtToken});

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);

  AuthResponse copyWith({
    String? id,
    String? jwtToken,
  }) {
    return AuthResponse(
      id: id ?? this.id,
      jwtToken: jwtToken ?? this.jwtToken,
    );
  }
}
