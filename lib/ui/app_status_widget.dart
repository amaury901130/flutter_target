import 'package:flutter/material.dart';
import 'package:rootstrap_target/domain/services/abstract/app_status_service.dart';
import 'package:rootstrap_target/resources/locale/localize.dart';
import 'package:rootstrap_target/resources/resources.dart';
import 'package:rootstrap_target/util/sync_state_notifier.dart';

class AppStatusWidget extends StatefulWidget {
  const AppStatusWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AppStatusWidgetState();
}

class _AppStatusWidgetState extends State<AppStatusWidget> {
  AppStatusService get appStatusService => AppStatusService.instance;

  @override
  void initState() {
    super.initState();
    appStatusService.checkStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: StreamBuilder<SyncStateNotifier<bool>>(
        stream: appStatusService.streamIsOnline,
        initialData: SyncStateNotifier(isLoading: true),
        builder: (ctx, snapshot) {
          final info = snapshot.data;
          if (info != null) {
            if (info.isLoading) {
              return const SizedBox(
                width: Dimen.loadingSpinnerSize,
                height: Dimen.loadingSpinnerSize,
                child: CircularProgressIndicator(),
              );
            }
            final isConnected = info.data ?? false;
            return Text(
              context.getString(
                isConnected
                    ? Localize.message_connection_success
                    : Localize.default_connection_error,
              ),
              style: Theme.of(context).textTheme.headline1,
            );
          }
          return Container();
        },
      ),
    );
  }
}
