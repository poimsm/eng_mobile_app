import 'package:eng_mobile_app/data/models/activity.dart';
import 'package:eng_mobile_app/data/network/network.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WordListState {
  WordListState({this.words = const [], this.isLoading = true});

  List<Word> words;
  bool isLoading;

  WordListState copyWith({words, isLoading}) {
    return WordListState(
      words: words ?? this.words,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class WordListNotifier extends StateNotifier<WordListState> {
  WordListNotifier() : super(WordListState());

  Future<bool> retrieveWords() async {
    // state = state.copyWith(isLoading: true);
    final resp = await Network().get('/word/?id=user_id');
    if (!resp.ok) {
      state = state.copyWith(isLoading: false);
      return false;
    }

    final wordsData =
        (resp.data as List).map((x) => Word.fromJson(x)).toList();

    state = state.copyWith(words: wordsData);
    state = state.copyWith(isLoading: false);
    return true;
  }

  void addNewWord(Word word) {
    state = state.copyWith(words: [word, ...state.words]);
  }

  void editWord(Word word) {

    List<Word> newWords = [];

    for (var w in state.words) {
      if(w.id == word.id) {
        newWords.add(word);
      } else {
        newWords.add(w);
      }
    }

    // final words = state.words.firstWhere((w) => w.id == word.id);
    state = state.copyWith(words: newWords);
  }

  void deleteWord(int id) {

    List<Word> newWords = [];

    for (var w in state.words) {
      if(w.id == id) {
        continue;
      } else {
        newWords.add(w);
      }
    }

    state = state.copyWith(words: newWords);
  }
}

final wordListProvider =
    StateNotifierProvider<WordListNotifier, WordListState>((ref) {
  return WordListNotifier();
});
