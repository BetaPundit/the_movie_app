enum NetworkStatus { initial, loading, success, failure }

extension MoviesStatusX on NetworkStatus {
  bool get isInitial => this == NetworkStatus.initial;
  bool get isLoading => this == NetworkStatus.loading;
  bool get isSuccess => this == NetworkStatus.success;
  bool get isFailure => this == NetworkStatus.failure;
}
