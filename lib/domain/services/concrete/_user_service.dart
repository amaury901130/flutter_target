import 'dart:async';

import 'package:rootstrap_target/domain/models/requests/sign_in.dart';
import 'package:rootstrap_target/domain/models/requests/sign_up.dart';
import 'package:rootstrap_target/domain/network/abstract/api_profile.dart';
import 'package:rootstrap_target/domain/services/abstract/user_service.dart';
import 'package:rootstrap_target/globals/preferences.dart';
import 'package:rootstrap_target/util/service_response.dart';

class UserServiceImpl extends UserService {
  ApiProfile get apiProfile => ApiProfile.instance;

  Preferences get pref => Preferences.instance;

  @override
  Future<ServiceResponse<bool>> signIn(
    String email,
    String password,
  ) async {
    final loggedInUser = await apiProfile.signIn(
      SignInRequest(
        user: SignInData(
          email: email,
          password: password,
        ),
      ),
    );

    if (loggedInUser != null) {
      pref.profile = loggedInUser;
      return ServiceResponse(data: true);
    }

    //TODO: manage error message
    return ServiceResponse(hasError: true);
  }

  @override
  Future<bool> signOut() async {
    await pref.clean();
    return true;
  }

  @override
  Future<ServiceResponse<bool>> signUp(
    String email,
    String password,
    String gender,
  ) async {
    final loggedInUser = await apiProfile.signUp(
      SignUpRequest(
        user: SignUpData(
          email: email,
          password: password,
          passwordConfirmation: password,
          gender: gender,
          username: email.split('@')[0],
        ),
      ),
    );

    if (loggedInUser != null) {
      pref.profile = loggedInUser;
      return ServiceResponse(data: true);
    }

    //TODO: manage error message
    return ServiceResponse(hasError: true);
  }

  @override
  bool get isSessionActive => pref.profile != null;
}
