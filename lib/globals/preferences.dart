import 'package:rootstrap_target/globals/globals.dart';
import 'package:rootstrap_target/resources/locale/localize.dart';

class Preferences {
  static const PREF_LANG = 'app_lang';

  static Preferences get instance => getIt<Preferences>();

  static void register() =>
      getIt.registerSingleton<Preferences>(Preferences._());

  Preferences._();

  Lang? get appLang => LangExtensions.fromValue(
        globalPreferences.getString(PREF_LANG),
      );

  void saveAppLang(Lang appLang) {
    globalPreferences.setString(
      PREF_LANG,
      appLang.value,
    );
  }
}
