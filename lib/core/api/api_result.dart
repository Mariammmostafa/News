import '../errors/global_error_handler.dart';
sealed class ApiResult<T> {
  const ApiResult();

  factory ApiResult.success({required T data}) {
    return SuccessRequest(data: data);
  }

  factory ApiResult.failure({required GlobalErrorHandler exception}) {
    return FailureRequest(exception: exception);
  }
}

class SuccessRequest<T> extends ApiResult<T> {
  final T data;

  const SuccessRequest({required this.data});
}

class FailureRequest extends ApiResult<Never> {
  final GlobalErrorHandler exception;

  const FailureRequest({required this.exception});
}
