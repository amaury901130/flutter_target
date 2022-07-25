import 'package:rootstrap_target/globals/globals.dart';
import 'package:rootstrap_target/util/service_response.dart';

abstract class UserService {
  static UserService get instance => getIt<UserService>();

  static void register(UserService userService) =>
      getIt.registerSingleton<UserService>(userService);

  Future<ServiceResponse<bool>> signUp(
    String email,
    String password,
    String gender,
  );

  Future<ServiceResponse<bool>> signIn(String email, String password);

  Future<bool> signOut();

  bool get isSessionActive;
}
