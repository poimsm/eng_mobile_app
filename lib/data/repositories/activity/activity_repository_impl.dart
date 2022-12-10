import 'package:eng_mobile_app/data/models/activity.dart';
import 'package:eng_mobile_app/data/network/network.dart';
import 'package:eng_mobile_app/data/repositories/activity/activity_repository.dart';
import 'package:eng_mobile_app/services/auth/auth_service.dart';
import 'package:eng_mobile_app/services/local_db/local_db_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

class ActivityRepositoryImpl implements ActivityRepository {
  final Network _network;
  final AuthService _authService;
  final LocalDBService _localDB;

  ActivityRepositoryImpl(
      {required network, required authService, required localDB})
      : _network = network,
        _authService = authService,
        _localDB = localDB;

  @override
  Future<List<Activity>> getActivities() async {
    if (_authService.isAuthenticated) {
      final resp = await _network.get('/activities/user/pack');
      if (!resp.ok) return [];
      return (resp.data as List).map((x) => Activity.fromJson(x)).toList();
    }

    final localSentences = await _localDB.getLocalSentences();

    final resp = await _network
        .post('/activities/pack', data: {'local_sentences': localSentences});
    if (!resp.ok) return [];
    return (resp.data as List).map((x) => Activity.fromJson(x)).toList();
  }
}

/// Provider used by rest of the app
final activityRepositoryProvider = Provider<ActivityRepository>((ref) {
  final authService = GetIt.I.get<AuthService>();
  final config = NetworkConfigWithAuthService(authService).config();
  final localDB = GetIt.I.get<LocalDBService>();

  return ActivityRepositoryImpl(
      network: Network(config), authService: authService, localDB: localDB);
});
