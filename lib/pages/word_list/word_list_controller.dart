import 'package:eng_mobile_app/data/models/activity.dart';
import 'package:eng_mobile_app/data/network/network.dart';
import 'package:eng_mobile_app/utils/helpers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HistoryItem {
  HistoryItem({
    required this.questionType,
    required this.questionText,
    required this.wordText,
  });

  int questionType;
  String questionText;
  String wordText;
}

class WordListState {
  WordListState({
    this.words = const [],
    this.isLoading = true,
    this.animateAddWordBtn = false,
    this.showListBlinker = false,
    this.history = const [],
    this.userWords = const [],
  });

  List<Word> words;
  List<HistoryItem> history;
  bool isLoading;
  List<String> userWords;
  bool animateAddWordBtn;
  bool showListBlinker;

  WordListState copyWith({
    words,
    isLoading,
    history,
    userWords,
    animateAddWordBtn,
    showListBlinker,
  }) {
    return WordListState(
      words: words ?? this.words,
      isLoading: isLoading ?? this.isLoading,
      history: history ?? this.history,
      userWords: userWords ?? this.userWords,
      animateAddWordBtn: animateAddWordBtn ?? this.animateAddWordBtn,
      showListBlinker: showListBlinker ?? this.showListBlinker,
    );
  }
}

class WordListNotifier extends StateNotifier<WordListState> {
  WordListNotifier() : super(WordListState());

  Future<bool> retrieveWords() async {
    // state = state.copyWith(isLoading: true);
    // final resp = await Network().get('/word/?id=user_id');
    // if (!resp.ok) {
    //   state = state.copyWith(isLoading: false);
    //   return false;
    // }

    // final wordsData =
    //     (resp.data as List).map((x) => Word.fromJson(x)).toList();

    // state = state.copyWith(words: wordsData);
    // state = state.copyWith(isLoading: false);
    return true;
  }

  void toggleListBlinker() async {
    await sleep(500);
    state = state.copyWith(showListBlinker: true);
    await sleep(500);
    state = state.copyWith(showListBlinker: false);
  }

  void toggleAnimatedWordBtn() async {
    state = state.copyWith(animateAddWordBtn: true);
    await sleep(1000);
    state = state.copyWith(animateAddWordBtn: false);
  }

  void addUserWord(String wordText) {
    state = state.copyWith(userWords: [...state.userWords, wordText]);
  }

  void addUserWordList(List<Word> words) {
    List<String> wordsText = [];
    for (var i = 0; i < words.length; i++) {
      wordsText.add(words[i].word);
    }

    state = state.copyWith(userWords: [...state.userWords, ...wordsText]);
  }

  void addHistory({required Question question, Word? word}) {
    List<HistoryItem> history = [
      HistoryItem(
          questionType: question.type,
          questionText: question.question,
          wordText: word != null ? word.word : '')
    ];

    for (var i = 0; i < state.history.length; i++) {
      if (i < 12) {
        history.add(state.history[i]);
      }
    }

    state = state.copyWith(history: history);
  }

  void setWordsFromList(List<Word> newWords) async {
    List<Word> words = [...newWords, ...state.words];
    state = state.copyWith(words: words);
  }

  void setWordsFromMap(data) async {
    final wordsData = (data as List)
        .map((x) => Word(
              id: x['id'],
              word: x['sentence'],
              meaning: x['meaning'],
              origin: x['origin'],
              extras: x['extras'],
              type: x['type'],
            ))
        .toList();

    state = state.copyWith(words: [...wordsData, ...state.words]);
  }

  void addNewWord(Word word) {
    state = state.copyWith(words: [word, ...state.words]);
  }

  void editWord(Word word) {
    List<Word> newWords = [];

    for (var w in state.words) {
      if (w.id == word.id) {
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
      if (w.id == id) {
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
