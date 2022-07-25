import 'dart:convert';

import 'package:rootstrap_target/domain/models/user.dart';
import 'package:rootstrap_target/globals/globals.dart';
import 'package:rootstrap_target/resources/locale/localize.dart';

class Preferences {
  static const PREF_LANG = 'app_lang';
  static const API_HEADERS = 'api_headers';
  static const PROFILE = 'profile';

  static Preferences get instance => getIt<Preferences>();

  static void register() =>
      getIt.registerSingleton<Preferences>(Preferences._());

  Preferences._();

  set profile(User? profile) {
    if (profile != null) {
      globalPreferences.setString(
        PROFILE,
        jsonEncode(profile.toJson()),
      );
    } else {
      globalPreferences.remove(PROFILE);
    }
  }

  User? get profile {
    final profileJson = globalPreferences.getString(PROFILE);
    if (profileJson != null) {
      return jsonDecode(profileJson);
    }
    return null;
  }

  Lang? get appLang => LangExtensions.fromValue(
        globalPreferences.getString(PREF_LANG),
      );

  void saveAppLang(Lang appLang) {
    globalPreferences.setString(
      PREF_LANG,
      appLang.value,
    );
  }

  set secureHeaders(Map<String, String> headers) {
    if (headers.isNotEmpty) {
      globalPreferences.setString(
        API_HEADERS,
        jsonEncode(headers),
      );
    }
  }

  Map<String, String> get secureHeaders {
    final headers = globalPreferences.getString(API_HEADERS);

    if (headers != null) {
      return jsonDecode(headers);
    }
    return {};
  }

  Future<void> clean() async {
    await globalPreferences.clear();
  }
}
