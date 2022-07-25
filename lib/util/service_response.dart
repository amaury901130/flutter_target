class ServiceResponse<T> {
  T? data;
  bool hasError;
  String? errorMessage;

  ServiceResponse({
    this.data,
    this.hasError = false,
    this.errorMessage,
  });
}
