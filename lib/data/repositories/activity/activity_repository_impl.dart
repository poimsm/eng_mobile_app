import 'package:eng_mobile_app/data/models/activity.dart';
import 'package:eng_mobile_app/data/network/network.dart';
import 'package:eng_mobile_app/data/repositories/activity/activity_repository.dart';
import 'package:eng_mobile_app/services/auth/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

class ActivityRepositoryImpl implements ActivityRepository {
  final Network _network;

  ActivityRepositoryImpl({required network}) : _network = network;

  @override
  Future<List<Activity>> getActivities() async {
    final resp = await _network.get('/daily-activities');
    return (resp.data as List).map((x) => Activity.fromJson(x)).toList();
  }
}

/// Provider used by rest of the app
final activityRepositoryProvider = Provider<ActivityRepository>((ref) {
  final authService = GetIt.I.get<AuthService>();
  final config = NetworkConfigWithAuthService(authService).config();

  return ActivityRepositoryImpl(network: Network(config));
});
