import 'package:rootstrap_target/globals/globals.dart';

abstract class ApiStatus {
  static ApiStatus get instance => getIt<ApiStatus>();

  static void register(ApiStatus apiStatus) =>
      getIt.registerSingleton<ApiStatus>(apiStatus);

  Future<bool> isActive();
}
