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
    this.isLoading = false,
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

  Future<bool> fetchWords() async {
    // state = state.copyWith(isLoading: true);
    final resp = await Network().get('/sentence/?page=1');
    // state = state.copyWith(isLoading: false);

    if (!resp.ok) {
      state = state.copyWith(isLoading: false);
      return false;
    }

    final wordsData =
        (resp.data['data'] as List).map((x) => Word.fromJson(x)).toList();

    state = state.copyWith(words: wordsData);
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

  void favoriteWordHandler(List<Map> favWords) {
    final words = state.words.map((e) => e).toList();
    List<Word> addedWords = [];
    for (var i = 0; i < favWords.length; i++) {
      if (favWords[i]['action'] == 'add') {
        addedWords.add(favWords[i]['word']);
      }

      if (favWords[i]['action'] == 'delete') {
        if (favWords[i]['type'] == 'card') {
          words.removeWhere((w) {
            return w.infoCard != null &&
                w.infoCard!.id == favWords[i]['short_video_id'];
          });
        }

        if (favWords[i]['type'] == 'video') {
          words.removeWhere((w) {
            return w.shortVideo != null &&
                w.shortVideo!.id == favWords[i]['short_video_id'];
          });
        }
      }
    }

    state = state.copyWith(words: [...addedWords, ...words]);
  }

  void addNewWord(Word word) async {
    final resp = await Network().get('/sentence/?page=1');
    if (!resp.ok) {
      state = state.copyWith(isLoading: false);
      return;
    }

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
