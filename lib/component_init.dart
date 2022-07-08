import 'package:rootstrap_target/globals/globals.dart';
import 'package:rootstrap_target/globals/preferences.dart';
import 'package:rootstrap_target/resources/locale/localize.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Component {
  static Future<void> initialize() async {
    globalPreferences = await SharedPreferences.getInstance();
    Preferences.register();
    Localization.register();
  }
}
