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
          CREATE TABLE words(
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

  Future<int> createLocalWord(LocalWord word) async {
    final Completer<int> completer = Completer<int>();

    await _database!.transaction((txn) async {
      int id = await txn.rawInsert('''
      INSERT INTO words(
        sentence, meaning, origin, type, saved,
        extras, source_type, info_card, short_video
      )
        VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)
      ''', [
        word.word,
        word.meaning,
        word.origin,
        word.type,
        word.saved,
        word.extras,
        word.sourceType,
        word.infoCard,
        word.shortVideo
      ]);
      completer.complete(id);
    });
    return completer.future;
  }

  Future updateLocalWord(Map payload) async {
    await _database!.rawUpdate(
        'UPDATE words SET sentence = ?, meaning = ? WHERE id = ?',
        [payload['id'], payload['word'], payload['meaning']]);
  }

  Future deleteAllLocalWords() async {
    await _database!.rawDelete('DELETE FROM words');
  }

  Future deleteLocalWordsByVideoId(int id) async {
    await _database!.rawDelete('DELETE FROM words WHERE short_video = ?', [id]);
  }

  Future deleteLocalWordsByCardId(int id) async {
    await _database!.rawDelete('DELETE FROM words WHERE info_card = ?', [id]);
  }

  Future deleteLocalWordById(int id) async {
    await _database!.rawDelete('DELETE FROM words WHERE id = ?', [id]);
  }

  Future<List<LocalWord>> getLocalWords() async {
    List list =
        await _database!.rawQuery('SELECT * FROM words ORDER BY id DESC');
    List<LocalWord> words = list.map((e) => LocalWord.fromJson(e)).toList();
    return words;
  }

  Future<Map<String, dynamic>> getWordById(int id) async {
    List list =
        await _database!.rawQuery('SELECT * FROM words where id = ?', [id]);
    return list[0];
  }
}
