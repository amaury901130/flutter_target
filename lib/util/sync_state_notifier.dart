class SyncResponseNotifier<T> {
  T? data;
  bool isLoading;
  bool hasError;

  SyncResponseNotifier({
    this.data,
    this.isLoading = false,
    this.hasError = false,
  });
}
