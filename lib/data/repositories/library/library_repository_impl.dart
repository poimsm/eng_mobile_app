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
    if (_authService.isAuthenticated) {
      final resp = await _network.get('/library/user/info-card');
      if (!resp.ok) return [];
      List<InfoCard> cards =
          (resp.data as List).map((x) => InfoCard.fromJson(x)).toList();
      return cards;
    }

    final resp = await _network.get('/library/info-card');
    if (!resp.ok) return [];
    List<InfoCard> cards =
        (resp.data as List).map((x) => InfoCard.fromJson(x)).toList();

    cards = await _checkFavoriteInfoCardAgainstLocalData(cards);

    return cards;
  }

  @override
  Future<List<ShortVideo>> getVideos() async {
    if (_authService.isAuthenticated) {
      final resp = await _network.get('/library/user/short-video');
      if (!resp.ok) return [];
      List<ShortVideo> videos =
          (resp.data as List).map((x) => ShortVideo.fromJson(x)).toList();
      return videos;
    }

    final resp = await _network.get('/library/short-video');
    if (!resp.ok) return [];

    List<ShortVideo> videos =
        (resp.data as List).map((x) => ShortVideo.fromJson(x)).toList();

    videos = await _checkFavoriteVideoAgainstLocalData(videos);

    return videos;
  }

  @override
  Future<List<int>> addCardToFavorites(InfoCard card) async {
    try {
      if (_authService.isAuthenticated) {
        final res = await _network.post('/user/favorites',
            data: {'id': card.id, 'source_type': SourceType.infoCard});

        if (!res.ok) return [];
        return List<int>.from(res.data['sentences_ids']);
      }

      List<int> ids = [];
      if (card.isFavorite!) {
        for (final sentence in card.sentences) {
          final cardSentence = sentence.copyWith(
              infoCard: card, sourceType: SourceType.infoCard);
          final id = await _localDB
              .createLocalSentence(_convertSentenceToLocal(cardSentence));
          ids.add(id);
        }
      } else {
        await _localDB.deleteLocalSentencesByCardId(card.id);
      }

      return ids;
    } catch (e) {
      printError('addCardToFavorites - ${e.toString()}');
      return [];
    }
  }

  @override
  Future<List<int>> removeCardFromFavorites(InfoCard card) async {
    try {
      if (_authService.isAuthenticated) {
        final res = await _network.delete('/user/favorites',
            data: {'id': card.id, 'source_type': SourceType.infoCard});

        if (!res.ok) return [];
        return List<int>.from(res.data['sentences_ids']);
      }

      List<int> ids = [];
      if (card.isFavorite!) {
        for (final sentence in card.sentences) {
          final cardSentence = sentence.copyWith(
              infoCard: card, sourceType: SourceType.infoCard);
          final id = await _localDB
              .createLocalSentence(_convertSentenceToLocal(cardSentence));
          ids.add(id);
        }
      } else {
        await _localDB.deleteLocalSentencesByCardId(card.id);
      }

      return ids;
    } catch (e) {
      printError('removeCardFromFavorites - ${e.toString()}');
      return [];
    }
  }

  @override
  Future<List<int>> addVideoToFavorites(ShortVideo video) async {
    if (_authService.isAuthenticated) {
      final res = await _network.post('/user/favorites',
          data: {'id': video.id, 'source_type': SourceType.shortVideo});

      if (!res.ok) return [];
      return List<int>.from(res.data['sentences_ids']);
    }

    List<int> ids = [];

    if (video.isFavorite!) {
      for (final sentence in video.sentences) {
        final videoSentence = sentence.copyWith(
            shortVideo: video, sourceType: SourceType.shortVideo);
        final id = await _localDB
            .createLocalSentence(_convertSentenceToLocal(videoSentence));
        ids.add(id);
      }
    } else {
      await _localDB.deleteLocalSentencesByVideoId(video.id);
    }
    return ids;
  }

  @override
  Future<List<int>> removeVideoFromFavorites(ShortVideo video) async {
    if (_authService.isAuthenticated) {
      final res = await _network.delete('/user/favorites',
          data: {'id': video.id, 'source_type': SourceType.shortVideo});

      if (!res.ok) return [];
      return List<int>.from(res.data['sentences_ids']);
    }

    List<int> ids = [];

    if (video.isFavorite!) {
      for (final sentence in video.sentences) {
        final videoSentence = sentence.copyWith(
            shortVideo: video, sourceType: SourceType.shortVideo);
        final id = await _localDB
            .createLocalSentence(_convertSentenceToLocal(videoSentence));
        ids.add(id);
      }
    } else {
      await _localDB.deleteLocalSentencesByVideoId(video.id);
    }
    return ids;
  }

  @override
  Future<List<Favorite>> getFavoriteResources() async {
    if (_authService.isAuthenticated) {
      final resp = await _network.get('/user/favorites');
      if (!resp.ok) return [];
      List<Favorite> favorites =
          (resp.data as List).map((x) => Favorite.fromJson(x)).toList();

      return favorites;
    }

    final localSentences = await _localDB.getVideoAndCardSentencesOnly();
    final localSentencesMap =
        localSentences.map((local) => local.toJson()).toList();

    if (localSentencesMap.isEmpty) return [];

    final resp = await _network.post('/local-sentence/convert-to-favorite',
        data: {'local_sentences': localSentencesMap});

    if (!resp.ok) return [];
    return (resp.data as List).map((x) => Favorite.fromJson(x)).toList();
  }

  @override
  Future<InfoCard?> getInfoCardById(int id) async {
    final resp = await _network.get('/library/info-card?id=$id');
    if (!resp.ok) return null;
    return InfoCard.fromJson(resp.data);
  }

  @override
  Future<ShortVideo?> getShortVideoById(int id) async {
    final resp = await _network.get('/library/short-video?id=$id');
    if (!resp.ok) return null;
    return ShortVideo.fromJson(resp.data);
  }

  LocalSentence _convertSentenceToLocal(Sentence sentence) {
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
