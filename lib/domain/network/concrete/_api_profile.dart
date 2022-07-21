import 'package:rootstrap_target/domain/models/requests/sign_in.dart';
import 'package:rootstrap_target/domain/models/requests/sign_up.dart';
import 'package:rootstrap_target/domain/models/user.dart';
import 'package:rootstrap_target/domain/network/abstract/api_profile.dart';
import 'package:rootstrap_target/domain/network/client/http_client.dart';

class ApiProfileImpl extends ApiProfile {
  @override
  Future<User?> signUp(SignUpRequest requestData) async {
    final response = await ApiRequest(
      path: 'users',
      parameters: requestData.toJson(),
    ).post();
    try {
      if (response.isSuccess) {
        final userData = response.data as Map<String, dynamic>;
        final user = User.fromJson(userData);
        return user;
      }
      // ignore: empty_catches
    } catch (e) {}
    return null;
  }

  @override
  Future<User?> signIn(SignInRequest requestData) async {
    final response = await ApiRequest(
      path: 'users/sign_in',
      parameters: requestData.toJson(),
    ).post();
    try {
      if (response.isSuccess) {
        final userData = response.data as Map<String, dynamic>;
        final user = User.fromJson(userData);
        return user;
      }
      // ignore: empty_catches
    } catch (e) {}
    return null;
  }
}
