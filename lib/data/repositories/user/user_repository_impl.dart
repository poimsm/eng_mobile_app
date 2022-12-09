import 'package:eng_mobile_app/data/models/library.dart';
import 'package:eng_mobile_app/data/models/user.dart';
import 'package:eng_mobile_app/data/network/network.dart';
import 'package:eng_mobile_app/data/repositories/user/enums.dart';
import 'package:eng_mobile_app/pages/sentence_list/enums.dart';
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
  Future<List<Favorite>> getFavoriteResources() async {
    if (_authService.isAuthenticated) {
      final resp = await _network.get('user/favorites');
      if (!resp.ok) return [];
      List<Favorite> favorites =
          (resp.data as List).map((x) => Favorite.fromJson(x)).toList();

      return favorites;
    }

    final localSentences = await _localDB.getVideoAndCardSentencesOnly();
    final localSentencesMap =
        localSentences.map((local) => local.toJson()).toList();

    final resp = await _network.post('/local-sentences-to-favorites',
        data: {'local_sentences': localSentencesMap});

    if (!resp.ok) return [];
    return (resp.data as List).map((x) => Favorite.fromJson(x)).toList();
  }

  @override
  Future<FavoriteResponse?> getCardOrVideoByFavoriteId(int id) async {
    final resp = await _network.get('user/favorites?id=$id');
    if (!resp.ok) return null;

    FavoriteResponse favResp;

    if (resp.data['type'] == SourceType.infoCard) {
      favResp = FavoriteResponse(SourceType.infoCard,
          card: InfoCard.fromJson(resp.data));
    } else {
      favResp = FavoriteResponse(SourceType.shortVideo,
          video: ShortVideo.fromJson(resp.data));
    }

    return favResp;
  }

  @override
  Future<User> getProfile() async {
    return await _authService.getProfile();
  }

  @override
  Future<UserStats> getStats() async {
    if (_authService.isAuthenticated) {
      final resp = await _network.get('user/stats');
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
