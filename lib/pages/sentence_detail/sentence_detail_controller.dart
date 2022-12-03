import 'package:eng_mobile_app/data/models/activity.dart';
import 'package:eng_mobile_app/data/repositories/sentence/sentence_repository.dart';
import 'package:eng_mobile_app/data/repositories/sentence/sentence_repository_impl.dart';
import 'package:eng_mobile_app/pages/sentence_list/enums.dart';
import 'package:eng_mobile_app/utils/helpers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SentenceDetailState {
  SentenceDetailState({
    this.isLoading = false,
    this.animateAddSentenceBtn = false,
    this.enableToSaveOrEdit = false,
    this.showVideo = false,
    this.showBanner = false,
  });

  bool isLoading;
  bool animateAddSentenceBtn;
  bool enableToSaveOrEdit;
  bool showVideo;
  bool showBanner;

  SentenceDetailState copyWith({
    isLoading,
    animateAddSentenceBtn,
    enableToSaveOrEdit,
    showVideo,
    showBanner,
  }) {
    return SentenceDetailState(
      isLoading: isLoading ?? this.isLoading,
      animateAddSentenceBtn:
          animateAddSentenceBtn ?? this.animateAddSentenceBtn,
      enableToSaveOrEdit: enableToSaveOrEdit ?? this.enableToSaveOrEdit,
      showVideo: showVideo ?? this.showVideo,
      showBanner: showBanner ?? this.showBanner,
    );
  }
}

class SentenceDetailNotifier extends StateNotifier<SentenceDetailState> {
  SentenceDetailNotifier(this.sentenceRepository)
      : super(SentenceDetailState());

  final SentenceRepository sentenceRepository;

  void checkEnableToSaveOrEdit(String sentenceText, String meaningText,
      bool isNewSentence, Sentence? sentence) {
    bool enable = false;

    if (isNewSentence) {
      enable = sentenceText.length > 2;
    } else {
      enable = sentenceText.length > 2 &&
          (sentenceText != sentence!.sentence ||
              meaningText != (sentence.meaning ?? ''));
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

  Future<Sentence?> createSentence(Map<String, dynamic> payload) async {
    state = state.copyWith(isLoading: true);
    final newSentence = await sentenceRepository.createSentence(Sentence(
        id: -1,
        sentence: payload['sentence'],
        meaning: payload['meaning'],
        origin: SentenceOrigin.user,
        type: SentenceType.normal));
    state = state.copyWith(isLoading: false);

    return newSentence;
  }

  Future<bool> deleteSentence(int id) async {
    state = state.copyWith(isLoading: true);
    final respOk = await sentenceRepository.deleteSentence(id);
    state = state.copyWith(isLoading: false);
    return respOk;
  }

  Future<Sentence?> updateSentence(Map payload) async {
    state = state.copyWith(isLoading: true);
    final sentence = await sentenceRepository.updateSentence(payload);
    state = state.copyWith(isLoading: false);
    return sentence;
  }

  void toggleAnimatedSentenceBtn() async {
    state = state.copyWith(animateAddSentenceBtn: true);
    await sleep(1000);
    state = state.copyWith(animateAddSentenceBtn: false);
  }
}

final sentenceDetailProvider = StateNotifierProvider.autoDispose<
    SentenceDetailNotifier, SentenceDetailState>((ref) {
  final sentenceRepository = ref.watch(sentenceRepositoryProvider);
  return SentenceDetailNotifier(sentenceRepository);
});
