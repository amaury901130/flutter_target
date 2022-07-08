import 'package:rootstrap_target/domain/network/abstract/api_status.dart';
import 'package:rootstrap_target/domain/network/client/http_client.dart';

class ApiStatusImpl extends ApiStatus {
  @override
  Future<bool> isActive() async {
    final response = await ApiRequest(path: 'status').get();
    return response.isSuccess;
  }
}
