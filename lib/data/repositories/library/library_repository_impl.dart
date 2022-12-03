import 'package:eng_mobile_app/data/models/activity.dart';
import 'package:eng_mobile_app/data/models/library.dart';
import 'package:eng_mobile_app/data/network/network.dart';
import 'package:eng_mobile_app/pages/sentence_list/enums.dart';
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
        for (final sentence in card.sentences) {
          final cardSentence = sentence.copyWith(
              infoCard: card, sourceType: SourceType.infoCard);
          await _localDatabase
              .createLocalSentence(convertSentenceToLocal(cardSentence));
        }
      } else {
        await _localDatabase.deleteLocalSentencesByCardId(card.id);
      }

      return true;
    } catch (e) {
      printError('addCardToSentenceList - ${e.toString()}');
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
      for (final sentence in video.sentences) {
        final videoSentence = sentence.copyWith(
            shortVideo: video, sourceType: SourceType.shortVideo);
        await _localDatabase
            .createLocalSentence(convertSentenceToLocal(videoSentence));
      }
    } else {
      await _localDatabase.deleteLocalSentencesByVideoId(video.id);
    }
    return true;
  }

  LocalSentence convertSentenceToLocal(Sentence sentence) {
    LocalSentence localSentence = LocalSentence(
      id: sentence.id,
      sentence: sentence.sentence,
      meaning: sentence.meaning,
      origin: sentence.origin,
      type: sentence.type,
      sourceType: sentence.sourceType,
      extras: sentence.extras,
      saved: true,
      infoCard: sentence.infoCard != null ? sentence.infoCard!.id : null,
      shortVideo: sentence.shortVideo != null ? sentence.shortVideo!.id : null,
    );

    return localSentence;
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
