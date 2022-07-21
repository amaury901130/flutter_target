import 'package:rootstrap_target/domain/models/requests/sign_in.dart';
import 'package:rootstrap_target/domain/models/requests/sign_up.dart';
import 'package:rootstrap_target/domain/models/user.dart';
import 'package:rootstrap_target/globals/globals.dart';

abstract class ApiProfile {
  static ApiProfile get instance => getIt<ApiProfile>();

  static void register(ApiProfile apiProfile) =>
      getIt.registerSingleton<ApiProfile>(apiProfile);

  Future<User?> signUp(SignUpRequest requestData);

  Future<User?> signIn(SignInRequest requestData);
}
