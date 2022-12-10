import 'package:eng_mobile_app/data/models/activity.dart';
import 'package:eng_mobile_app/data/network/network.dart';
import 'package:eng_mobile_app/services/auth/auth_service.dart';
import 'package:eng_mobile_app/services/local_db/local_db_service.dart';
import 'package:eng_mobile_app/utils/helpers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import 'sentence_repository.dart';

class SentenceRepositoryImpl implements SentenceRepository {
  SentenceRepositoryImpl({authService, localDatabase, network})
      : _authService = authService,
        _localDatabase = localDatabase,
        _network = network;

  final AuthService _authService;
  final LocalDBService _localDatabase;
  final Network _network;

  @override
  Future<List<Sentence>> getSentences() async {
    try {
      if (_authService.isAuthenticated) {
        final resp = await _network.get('user/sentence/?page=1');
        if (!resp.ok) return [];

        return (resp.data['data'] as List)
            .map((x) => Sentence.fromJson(x))
            .toList();
      }

      final localSentences = await _localDatabase.getLocalSentences();

      List<Map> localSentencesMap = [];
      for (var lw in localSentences) {
        localSentencesMap.add(lw.toJson());
      }

      final resp = await _network.post('/local-sentence/convert-to-sentence',
          data: {'local_sentences': localSentencesMap});
      if (!resp.ok) return [];
      return (resp.data as List).map((x) => Sentence.fromJson(x)).toList();
    } catch (e) {
      printError('getSentences - ${e.toString()}');
      return [];
    }
  }

  @override
  Future<Sentence?> createSentence(Sentence sentence) async {
    if (_authService.isAuthenticated) {
      final resp =
          await _network.post('user/sentence/', data: sentence.toJson());
      if (!resp.ok) return null;
      return Sentence.fromJson(resp.data);
    }

    final id = await _localDatabase
        .createLocalSentence(convertSentenceToLocal(sentence));
    return sentence.copyWith(id: id);
  }

  @override
  Future<Sentence?> updateSentence(Map payload) async {
    if (_authService.isAuthenticated) {
      final resp = await _network.put('user/sentence/', data: payload);
      if (!resp.ok) return null;
      return Sentence.fromJson(resp.data);
    }

    await _localDatabase.updateLocalSentence(payload);
    Map<String, dynamic> sentenceMap =
        await _localDatabase.getSentenceById(payload['id']);

    return Sentence.fromJson(sentenceMap);
  }

  @override
  Future<bool> deleteSentence(int id) async {
    if (_authService.isAuthenticated) {
      await _network.delete('user/sentence/', data: {'id': id});
      return true;
    }
    await _localDatabase.deleteLocalSentenceById(id);
    return true;
  }

  @override
  Future<void> migrateLocalSentencesToUser() async {
    final localSentences = await _localDatabase.getLocalSentences(desc: false);

    await _network
        .post('local-sentence/save', data: {'local_sentences': localSentences});

    _localDatabase.deleteAllLocalSentences();
  }

  @override
  Future<void> deleteAllLocalSentences() async {
    _localDatabase.deleteAllLocalSentences();
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
        shortVideo:
            sentence.shortVideo != null ? sentence.shortVideo!.id : null);

    return localSentence;
  }
}

final sentenceRepositoryProvider = Provider<SentenceRepository>((ref) {
  final authService = GetIt.I.get<AuthService>();
  final config = NetworkConfigWithAuthService(authService).config();

  return SentenceRepositoryImpl(
      network: Network(config),
      localDatabase: GetIt.I.get<LocalDBService>(),
      authService: GetIt.I.get<AuthService>());
});
