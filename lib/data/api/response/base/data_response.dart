import 'package:json_annotation/json_annotation.dart';

part 'data_response.g.dart';

@JsonSerializable()
class DataResponse {
  dynamic data;
  dynamic message;
  bool success;
  int? code;
  DataResponse({
    this.data,
    this.message,
    this.code,
    this.success = true,
  });

  factory DataResponse.fromJson(Map<String, dynamic> json) =>
      _$DataResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DataResponseToJson(this);
}
