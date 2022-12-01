import 'package:eng_mobile_app/data/models/activity.dart';
import 'package:eng_mobile_app/data/network/network.dart';
import 'package:eng_mobile_app/pages/word_list/enums.dart';
import 'package:eng_mobile_app/services/auth/auth_service.dart';
import 'package:eng_mobile_app/services/global/global_service.dart';
import 'package:eng_mobile_app/services/local_db/local_db_service.dart';
import 'package:eng_mobile_app/utils/helpers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import 'word_repository.dart';

class WordRepositoryImpl implements WordRepository {
  WordRepositoryImpl({authService, localDatabase, network})
      : _authService = authService,
        _localDatabase = localDatabase,
        _network = network;

  final AuthService _authService;
  final LocalDBService _localDatabase;
  final Network _network;

  @override
  Future<List<Word>> getWords() async {
    try {
      if (_authService.isAuthenticated) {
        final resp = await _network.get('/sentence/?page=1');
        if (!resp.ok) return [];

        return (resp.data['data'] as List)
            .map((x) => Word.fromJson(x))
            .toList();
      }

      final localWords = await _localDatabase.getWords();

      List<Map> localWordsMap = [];
      for (var lw in localWords) {
        localWordsMap.add(lw.toJson());
      }

      final resp = await _network
          .post('/convert-local-words', data: {'local_words': localWordsMap});
      if (!resp.ok) return [];
      return (resp.data as List).map((x) => Word.fromJson(x)).toList();
    } catch (e) {
      printError('getWords - ${e.toString()}');
      return [];
    }
  }

  @override
  Future<Word?> createWord(Word word) async {
    if (_authService.isAuthenticated) {
      final resp = await _network
          .post('/sentence/', data: {'word': word, 'meaning': word.meaning});
      if (!resp.ok) return null;
      return Word.fromJson(resp.data);
    }

    final id = await _localDatabase.createWord(convertWordToLocal(word));
    return word.copyWith(id: id);
  }

  @override
  Future<Word?> updateWord(Map payload) async {
    if (_authService.isAuthenticated) {
      final resp = await _network.put('/sentence/', data: payload);
      if (!resp.ok) return null;
      return Word.fromJson(resp.data);
    }

    await _localDatabase.updateWord(payload);
    Map<String, dynamic> wordMap =
        await _localDatabase.getWordById(payload['id']);

    return Word.fromJson(wordMap);
  }

  @override
  Future<bool> deleteWord(int id) async {
    if (_authService.isAuthenticated) {
      await _network.delete('/sentence/', data: {'id': id});
      return true;
    }
    await _localDatabase.deleteWordById(id);
    return true;
  }

  @override
  Future<bool> migrateLocalWordsToUser(int id) async {
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

final wordRepositoryProvider = Provider<WordRepository>((ref) {
  final authService = GetIt.I.get<AuthService>();
  final config = NetworkConfigWithAuthService(authService).config();

  return WordRepositoryImpl(
      network: Network(config),
      localDatabase: GetIt.I.get<LocalDBService>(),
      authService: GetIt.I.get<AuthService>());
});
