import 'package:eng_mobile_app/data/models/activity.dart';
import 'package:eng_mobile_app/data/network/network.dart';
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
  WordDetailNotifier() : super(WordDetailState());

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

  Future<Word?> createWord(Map payload) async {
    state = state.copyWith(isLoading: true);

    final resp = await Network().post('/sentence/', data: payload);
    state = state.copyWith(isLoading: false);

    if (!resp.ok) return null;
    return Word.fromJson(resp.data);
  }

  Future<bool> deleteWord(int id) async {
    state = state.copyWith(isLoading: true);
    final resp = await Network().delete('/sentence/', data: {'id': id});
    state = state.copyWith(isLoading: false);
    return resp.ok;
  }

  Future<Word?> updateWord(Map payload) async {
    state = state.copyWith(isLoading: true);

    final resp = await Network().put('/sentence/', data: payload);
    state = state.copyWith(isLoading: false);

    if (!resp.ok) return null;
    return Word.fromJson(resp.data);
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
  return WordDetailNotifier();
});
