import 'dart:async';

import 'package:rootstrap_target/domain/services/abstract/app_status_service.dart';
import 'package:rootstrap_target/util/sync_state_notifier.dart';

class AppStatusServiceImpl extends AppStatusService {
  final _streamStatusController =
      StreamController<SyncResponseNotifier<bool>>();

  AppStatusServiceImpl() {
    isOnline = _streamStatusController.stream;
  }

  @override
  void checkStatus() {
    _streamStatusController.add(SyncResponseNotifier(isLoading: true));
    
  }
}
