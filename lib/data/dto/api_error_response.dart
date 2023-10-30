import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_error_response.g.dart';

@JsonSerializable()
class ApiErrorResponse {
  String reason;

  ApiErrorResponse(this.reason);

  ApiErrorResponse.networkError(this.reason);

  factory ApiErrorResponse.fromJson(Map<String, dynamic> json) => _$ApiErrorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorResponseToJson(this);
}