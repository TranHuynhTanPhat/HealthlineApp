import 'package:equatable/equatable.dart';

class ErrorResponse extends Equatable {
  final String message;

  const ErrorResponse(this.message);

  @override
  List<Object> get props => [message];
}

class CodeErrorResponse extends ErrorResponse {
  final int code;

  const CodeErrorResponse(this.code, String message) : super(message);
}

class NoDataErrorResponse extends ErrorResponse {
  const NoDataErrorResponse() : super('no_data');
}

class NoConnectionErrorResponse extends ErrorResponse {
  const NoConnectionErrorResponse() : super('no_connection');
}

class UnknownErrorResponse extends ErrorResponse {
  const UnknownErrorResponse() : super('unknown_failure');
}