import 'package:rootstrap_target/domain/network/abstract/api_profile.dart';
import 'package:rootstrap_target/domain/network/abstract/api_status.dart';
import 'package:rootstrap_target/domain/network/concrete/_api_profile.dart';
import 'package:rootstrap_target/domain/network/concrete/_api_status.dart';
import 'package:rootstrap_target/domain/services/abstract/app_status_service.dart';
import 'package:rootstrap_target/domain/services/abstract/user_service.dart';
import 'package:rootstrap_target/domain/services/concrete/_app_status_service.dart';
import 'package:rootstrap_target/domain/services/concrete/_user_service.dart';
import 'package:rootstrap_target/globals/globals.dart';
import 'package:rootstrap_target/globals/preferences.dart';
import 'package:rootstrap_target/resources/locale/localize.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Component {
  static Future<void> initialize() async {
    globalPreferences = await SharedPreferences.getInstance();
    Preferences.register();
    Localization.register();
    ApiStatus.register(ApiStatusImpl());
    ApiProfile.register(ApiProfileImpl());
    AppStatusService.register(AppStatusServiceImpl());
    UserService.register(UserServiceImpl());
  }
}
