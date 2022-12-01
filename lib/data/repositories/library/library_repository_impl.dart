import 'package:eng_mobile_app/data/models/activity.dart';
import 'package:eng_mobile_app/data/models/library.dart';
import 'package:eng_mobile_app/data/network/network.dart';
import 'package:eng_mobile_app/pages/word_list/enums.dart';
import 'package:eng_mobile_app/services/auth/auth_service.dart';
import 'package:eng_mobile_app/services/local_db/local_db_service.dart';
import 'package:eng_mobile_app/utils/helpers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import 'library_repository.dart';

class LibraryRepositoryImpl implements LibraryRepository {
  LibraryRepositoryImpl(
      {required network, required localDatabase, required authService})
      : _network = network,
        _localDatabase = localDatabase,
        _authService = authService;

  final Network _network;
  final LocalDBService _localDatabase;
  final AuthService _authService;

  @override
  Future<List<InfoCard>> getCards() async {
    final resp = await _network.get('/info-card');
    if (!resp.ok) return [];
    return (resp.data as List).map((x) => InfoCard.fromJson(x)).toList();
  }

  @override
  Future<bool> toggleCardFavorite(InfoCard card) async {
    try {
      if (_authService.isAuthenticated) {
        await _network.put('/info-card',
            data: {'id': card.id, 'is_favorite': card.isFavorite});
        return true;
      }

      if (card.isFavorite!) {
        for (final word in card.words) {
          await _localDatabase.createWord(convertWordToLocal(word));
        }
      } else {
        await _localDatabase.deleteWordsByCardId(card.id);
      }

      return true;
    } catch (e) {
      printError('addCardToWordList - ${e.toString()}');
      return false;
    }
  }

  @override
  Future<List<ShortVideo>> getVideos() async {
    final resp = await _network.get('/short-video');
    if (!resp.ok) return [];
    return (resp.data as List).map((x) => ShortVideo.fromJson(x)).toList();
  }

  @override
  Future<bool> toggleVideoFavorite(ShortVideo video) async {
    if (_authService.isAuthenticated) {
      await _network.put('/short-video',
          data: {'id': video.id, 'is_favorite': video.isFavorite});
      return true;
    }

    if (video.isFavorite!) {
      for (final word in video.words) {
        await _localDatabase.createWord(convertWordToLocal(word));
      }
    } else {
      await _localDatabase.deleteWordsByVideoId(video.id);
    }
    return true;
  }

  LocalWord convertWordToLocal(Word word) {
    LocalWord localWord = LocalWord(
        id: word.id,
        word: word.word,
        meaning: word.meaning,
        origin: word.origin,
        type: word.type,
        sourceType: SourceType.infoCard,
        extras: word.extras,
        saved: true,
        infoCard: word.infoCard != null ? word.infoCard!.id : null,
        shortVideo: word.shortVideo != null ? word.shortVideo!.id : null);

    return localWord;
  }
}

/// Provider used by rest of the app
final libraryRepositoryProvider = Provider<LibraryRepository>((ref) {
  final authService = GetIt.I.get<AuthService>();
  final config = NetworkConfigWithAuthService(authService).config();

  return LibraryRepositoryImpl(
      network: Network(config),
      localDatabase: GetIt.I.get<LocalDBService>(),
      authService: GetIt.I.get<AuthService>());
});
