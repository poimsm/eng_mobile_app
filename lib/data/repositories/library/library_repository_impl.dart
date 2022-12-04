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
        _localDB = localDatabase,
        _authService = authService;

  final Network _network;
  final LocalDBService _localDB;
  final AuthService _authService;

  @override
  Future<List<InfoCard>> getCards() async {
    final resp = await _network.get('/info-card');
    if (!resp.ok) return [];
    List<InfoCard> cards =
        (resp.data as List).map((x) => InfoCard.fromJson(x)).toList();

    if (!_authService.isAuthenticated) {
      cards = await _checkFavoriteInfoCardAgainstLocalData(cards);
    }

    return cards;
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
          await _localDB
              .createLocalSentence(convertSentenceToLocal(cardSentence));
        }
      } else {
        await _localDB.deleteLocalSentencesByCardId(card.id);
      }

      return true;
    } catch (e) {
      printError('toggleCardFavorite - ${e.toString()}');
      return false;
    }
  }

  @override
  Future<List<ShortVideo>> getVideos() async {
    final resp = await _network.get('/short-video');
    if (!resp.ok) return [];

    List<ShortVideo> videos =
        (resp.data as List).map((x) => ShortVideo.fromJson(x)).toList();

    if (!_authService.isAuthenticated) {
      videos = await _checkFavoriteVideoAgainstLocalData(videos);
    }

    return videos;
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
        await _localDB
            .createLocalSentence(convertSentenceToLocal(videoSentence));
      }
    } else {
      await _localDB.deleteLocalSentencesByVideoId(video.id);
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

  Future<List<ShortVideo>> _checkFavoriteVideoAgainstLocalData(
      List<ShortVideo> videos) async {
    final sentences = await _localDB.getLocalSentences();

    List<int> favVideoIds = [];

    for (var sen in sentences) {
      if (sen.shortVideo != null) {
        favVideoIds.add(sen.shortVideo!);
      }
    }

    List<ShortVideo> result = [];
    for (var video in videos) {
      bool isFavVideo = false;
      for (var id in favVideoIds) {
        if (id == video.id) {
          isFavVideo = true;
          break;
        }
      }

      result.add(video.copyWith(isFavorite: isFavVideo));
    }

    return result;
  }

  Future<List<InfoCard>> _checkFavoriteInfoCardAgainstLocalData(
      List<InfoCard> cards) async {
    final sentences = await _localDB.getLocalSentences();

    List<int> favCardIds = [];

    for (var sen in sentences) {
      if (sen.infoCard != null) {
        favCardIds.add(sen.infoCard!);
      }
    }

    List<InfoCard> result = [];
    for (var card in cards) {
      bool isFavVideo = false;
      for (var id in favCardIds) {
        if (id == card.id) {
          isFavVideo = true;
          break;
        }
      }

      result.add(card.copyWith(isFavorite: isFavVideo));
    }

    return result;
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
