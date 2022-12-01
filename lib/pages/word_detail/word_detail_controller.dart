import 'package:eng_mobile_app/data/models/activity.dart';
import 'package:eng_mobile_app/data/repositories/word/word_repository.dart';
import 'package:eng_mobile_app/data/repositories/word/word_repository_impl.dart';
import 'package:eng_mobile_app/pages/word_list/enums.dart';
import 'package:eng_mobile_app/utils/helpers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WordDetailState {
  WordDetailState({
    this.isLoading = false,
    this.animateAddWordBtn = false,
    this.enableToSaveOrEdit = false,
    this.showVideo = false,
    this.showBanner = false,
  });

  bool isLoading;
  bool animateAddWordBtn;
  bool enableToSaveOrEdit;
  bool showVideo;
  bool showBanner;

  WordDetailState copyWith({
    isLoading,
    animateAddWordBtn,
    enableToSaveOrEdit,
    showVideo,
    showBanner,
  }) {
    return WordDetailState(
      isLoading: isLoading ?? this.isLoading,
      animateAddWordBtn: animateAddWordBtn ?? this.animateAddWordBtn,
      enableToSaveOrEdit: enableToSaveOrEdit ?? this.enableToSaveOrEdit,
      showVideo: showVideo ?? this.showVideo,
      showBanner: showBanner ?? this.showBanner,
    );
  }
}

class WordDetailNotifier extends StateNotifier<WordDetailState> {
  WordDetailNotifier(this.wordRepository) : super(WordDetailState());

  final WordRepository wordRepository;

  void checkEnableToSaveOrEdit(
      String wordText, String meaningText, bool isNewWord, Word? word) {
    bool enable = false;

    if (isNewWord) {
      enable = wordText.length > 2;
    } else {
      enable = wordText.length > 2 &&
          (wordText != word!.word || meaningText != (word.meaning ?? ''));
    }

    if (state.enableToSaveOrEdit != enable) {
      state = state.copyWith(enableToSaveOrEdit: enable);
    }
  }

  setShowVideo(bool val) {
    state = state.copyWith(showVideo: val);
  }

  setShowBanner(bool val) {
    state = state.copyWith(showBanner: val);
  }

  Future<Word?> createWord(Map<String, dynamic> payload) async {
    state = state.copyWith(isLoading: true);
    final newWord = await wordRepository.createWord(Word(
        id: -1,
        word: payload['word'],
        meaning: payload['meaning'],
        origin: WordOrigin.user,
        type: WordType.normal));
    state = state.copyWith(isLoading: false);

    return newWord;
  }

  Future<bool> deleteWord(int id) async {
    state = state.copyWith(isLoading: true);
    final respOk = await wordRepository.deleteWord(id);
    state = state.copyWith(isLoading: false);
    return respOk;
  }

  Future<Word?> updateWord(Map payload) async {
    state = state.copyWith(isLoading: true);
    final word = await wordRepository.updateWord(payload);
    state = state.copyWith(isLoading: false);
    return word;
  }

  void toggleAnimatedWordBtn() async {
    state = state.copyWith(animateAddWordBtn: true);
    await sleep(1000);
    state = state.copyWith(animateAddWordBtn: false);
  }
}

final wordDetailProvider =
    StateNotifierProvider.autoDispose<WordDetailNotifier, WordDetailState>(
        (ref) {
  final wordRepository = ref.watch(wordRepositoryProvider);
  return WordDetailNotifier(wordRepository);
});
