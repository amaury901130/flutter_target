class SyncStateNotifier<T> {
  T? data;
  bool isLoading;
  bool hasError;

  SyncStateNotifier({
    this.data,
    this.isLoading = false,
    this.hasError = false,
  });
}
