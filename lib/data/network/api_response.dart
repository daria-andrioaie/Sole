import '../dto/api_error_response.dart';

class ApiResponse<T> {
  late T data;
  late ApiErrorResponse errorResponse;
  bool isSuccessful;
  bool isNoNetworkError = false;

  ApiResponse.completed(this.data, {this.isSuccessful = true});
  ApiResponse.error(this.errorResponse, {this.isSuccessful = false});

  ApiResponse.networkError({this.isSuccessful = false});

  ApiResponse.noNetwork(
      {this.isNoNetworkError = true, this.isSuccessful = false});
}