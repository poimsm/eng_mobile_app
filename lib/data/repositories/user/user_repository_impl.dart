import 'package:eng_mobile_app/data/models/user.dart';
import 'package:eng_mobile_app/data/network/network.dart';
import 'package:eng_mobile_app/services/auth/auth_service.dart';
import 'package:eng_mobile_app/services/local_db/local_db_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(
      {required network, required localDatabase, required authService})
      : _network = network,
        _localDB = localDatabase,
        _authService = authService;

  final Network _network;
  final LocalDBService _localDB;
  final AuthService _authService;

  @override
  Future<User> getProfile() async {
    return await _authService.getProfile();
  }

  @override
  Future<UserStats> getStats() async {
    if (_authService.isAuthenticated) {
      final resp = await _network.get('/user/stats');
      if (!resp.ok) {
        return UserStats(
            id: -1, totalSentences: 0, totalCards: 0, totalVideos: 0);
      }
      return UserStats.fromJson(resp.data);
    }

    final totalSentences = await _localDB.getTotalSentences();
    final totalVideos = await _localDB.getTotalVideos();
    final totalCards = await _localDB.getTotalCards();

    return UserStats(
      id: -1,
      totalSentences: totalSentences,
      totalVideos: totalVideos,
      totalCards: totalCards,
    );
  }

  @override
  Future<void> logout() async {
    _authService.loginOut();
  }

  @override
  bool isAuthenticated() {
    return _authService.isAuthenticated;
  }
}

/// Provider used by rest of the app
final userRepositoryProvider = Provider<UserRepository>((ref) {
  final authService = GetIt.I.get<AuthService>();
  final config = NetworkConfigWithAuthService(authService).config();

  return UserRepositoryImpl(
      network: Network(config),
      localDatabase: GetIt.I.get<LocalDBService>(),
      authService: GetIt.I.get<AuthService>());
});
