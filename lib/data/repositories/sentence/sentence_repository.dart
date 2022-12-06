import 'package:eng_mobile_app/data/models/activity.dart';

abstract class SentenceRepository {
  Future<List<Sentence>> getSentences();
  Future<Sentence?> updateSentence(Map payload);
  Future<Sentence?> createSentence(Sentence sentence);
  Future<bool> deleteSentence(int id);
  Future<void> deleteAllLocalSentences();
  Future<void> migrateLocalSentencesToUser();
}
