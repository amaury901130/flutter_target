import 'dart:async';

import 'package:rootstrap_target/domain/network/abstract/api_status.dart';
import 'package:rootstrap_target/domain/services/abstract/app_status_service.dart';
import 'package:rootstrap_target/util/sync_state_notifier.dart';

class AppStatusServiceImpl extends AppStatusService {
  late Stream<SyncStateNotifier<bool>> _streamIsOnline;

  final _streamStatusController = StreamController<SyncStateNotifier<bool>>();

  ApiStatus get apiStatus => ApiStatus.instance;

  AppStatusServiceImpl() {
    _streamIsOnline = _streamStatusController.stream;
  }

  @override
  void checkStatus() async {
    _streamStatusController.add(SyncStateNotifier(isLoading: true));
    final bool isConnected = await apiStatus.isActive();
    _streamStatusController.add(SyncStateNotifier(data: isConnected));
  }

  @override
  Stream<SyncStateNotifier<bool>> get streamIsOnline => _streamIsOnline;
}
