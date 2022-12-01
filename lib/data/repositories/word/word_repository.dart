import 'package:eng_mobile_app/data/models/activity.dart';

abstract class WordRepository {
  Future<List<Word>> getWords();
  Future<Word?> updateWord(Map payload);
  Future<Word?> createWord(Word word);
  Future<bool> deleteWord(int id);
  Future<bool> migrateLocalWordsToUser(int id);
}
