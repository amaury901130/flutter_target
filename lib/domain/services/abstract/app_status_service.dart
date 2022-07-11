import 'package:rootstrap_target/globals/globals.dart';
import 'package:rootstrap_target/util/sync_state_notifier.dart';

abstract class AppStatusService {
  static AppStatusService get instance => getIt<AppStatusService>();

  static void register(AppStatusService appStatusService) =>
      getIt.registerSingleton<AppStatusService>(appStatusService);

  Stream<SyncStateNotifier<bool>> get streamIsOnline;

  void checkStatus();
}
