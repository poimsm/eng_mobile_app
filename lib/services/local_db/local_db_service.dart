// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'package:eng_mobile_app/data/models/activity.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDBService {
  Database? _database;

  Future<bool> initDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'eng_database_01.db');

    _database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
          CREATE TABLE sentences(
            id INTEGER PRIMARY KEY,
            sentence TEXT,
            meaning TEXT,
            origin INTEGER,
            type INTEGER,
            saved BOOLEAN,
            extras TEXT,
            source_type INTEGER,
            info_card INTEGER,
            short_video INTEGER
          )
        ''');
    });

    return true;
  }

  Future<int> createLocalSentence(LocalSentence sentence) async {
    final Completer<int> completer = Completer<int>();

    await _database!.transaction((txn) async {
      int id = await txn.rawInsert('''
      INSERT INTO sentences(
        sentence, meaning, origin, type, saved,
        extras, source_type, info_card, short_video
      )
        VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)
      ''', [
        sentence.sentence,
        sentence.meaning,
        sentence.origin,
        sentence.type,
        sentence.saved,
        sentence.extras,
        sentence.sourceType,
        sentence.infoCard,
        sentence.shortVideo
      ]);
      completer.complete(id);
    });
    return completer.future;
  }

  Future updateLocalSentence(Map payload) async {
    await _database!.rawUpdate(
        'UPDATE sentences SET sentence = ?, meaning = ? WHERE id = ?',
        [payload['id'], payload['sentence'], payload['meaning']]);
  }

  Future deleteAllLocalSentences() async {
    await _database!.rawDelete('DELETE FROM sentences');
  }

  Future deleteLocalSentencesByVideoId(int id) async {
    await _database!
        .rawDelete('DELETE FROM sentences WHERE short_video = ?', [id]);
  }

  Future deleteLocalSentencesByCardId(int id) async {
    await _database!
        .rawDelete('DELETE FROM sentences WHERE info_card = ?', [id]);
  }

  Future deleteLocalSentenceById(int id) async {
    await _database!.rawDelete('DELETE FROM sentences WHERE id = ?', [id]);
  }

  Future<List<LocalSentence>> getLocalSentences() async {
    List list =
        await _database!.rawQuery('SELECT * FROM sentences ORDER BY id DESC');
    List<LocalSentence> sentences =
        list.map((e) => LocalSentence.fromJson(e)).toList();
    return sentences;
  }

  Future<Map<String, dynamic>> getSentenceById(int id) async {
    List list =
        await _database!.rawQuery('SELECT * FROM sentences where id = ?', [id]);
    return list[0];
  }
}
