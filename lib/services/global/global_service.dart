import 'package:eng_mobile_app/config.dart';
import 'package:eng_mobile_app/utils/helpers.dart';
import 'package:eng_mobile_app/data/network/network.dart';

class GlobalService {
  bool _shouldUpdateApp = false;
  bool get shouldUpdateApp => _shouldUpdateApp;

  Future<bool> fetchGlobalSettings() async {
    try {
      Response? response;
      final config = NetworkConfigWithJWBToken('None').config();

      response = await Network(config, retries: 2).get(
          '${Config.BASE_URL}/global/config?version=${Config.APP_VERSION}',
          absolutePath: true);

      if (!response.ok) return false;

      _shouldUpdateApp = response.data['update_required'];

      return true;
    } catch (e, s) {
      printError('fetchGlobalSettings: $e');
      printError(s.toString());
      return false;
    }
  }
}
