import 'package:rootstrap_target/util/sync_state_notifier.dart';

abstract class AppStatusService {
  late Stream<SyncResponseNotifier<bool>> isOnline;

  void checkStatus();
}
