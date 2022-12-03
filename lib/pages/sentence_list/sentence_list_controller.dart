import 'package:eng_mobile_app/data/models/activity.dart';
import 'package:eng_mobile_app/data/repositories/screen_flow/screen_flow_repository_impl.dart';
import 'package:eng_mobile_app/data/repositories/screen_flow/screen_flow_repository.dart';
import 'package:eng_mobile_app/data/repositories/sentence/sentence_repository.dart';
import 'package:eng_mobile_app/data/repositories/sentence/sentence_repository_impl.dart';
import 'package:eng_mobile_app/utils/helpers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HistoryItem {
  HistoryItem({
    required this.questionType,
    required this.questionText,
    required this.sentenceText,
  });

  int questionType;
  String questionText;
  String sentenceText;
}

class SentenceListState {
  SentenceListState({
    this.sentences = const [],
    this.isLoading = false,
    this.animateAddSentenceBtn = false,
    this.showListBlinker = false,
    this.history = const [],
    this.userSentences = const [],
  });

  List<Sentence> sentences;
  List<HistoryItem> history;
  bool isLoading;
  List<String> userSentences;
  bool animateAddSentenceBtn;
  bool showListBlinker;

  SentenceListState copyWith({
    sentences,
    isLoading,
    history,
    userSentences,
    animateAddSentenceBtn,
    showListBlinker,
  }) {
    return SentenceListState(
      sentences: sentences ?? this.sentences,
      isLoading: isLoading ?? this.isLoading,
      history: history ?? this.history,
      userSentences: userSentences ?? this.userSentences,
      animateAddSentenceBtn:
          animateAddSentenceBtn ?? this.animateAddSentenceBtn,
      showListBlinker: showListBlinker ?? this.showListBlinker,
    );
  }
}

class SentenceListNotifier extends StateNotifier<SentenceListState> {
  SentenceListNotifier(this.sentenceRepository, this.screenFlowRepository)
      : super(SentenceListState());

  final SentenceRepository sentenceRepository;
  final ScreenFlowRepository screenFlowRepository;

  Future<bool> fetchSentences() async {
    final sentences = await sentenceRepository.getSentences();
    state = state.copyWith(sentences: sentences);
    return true;
  }

  Future<void> deleteAllLocalSentences() async {
    sentenceRepository.deleteAllLocalSentences();
  }

  void toggleListBlinker() async {
    await sleep(500);
    state = state.copyWith(showListBlinker: true);
    await sleep(500);
    state = state.copyWith(showListBlinker: false);
  }

  void toggleAnimatedSentenceBtn() async {
    state = state.copyWith(animateAddSentenceBtn: true);
    await sleep(1000);
    state = state.copyWith(animateAddSentenceBtn: false);
  }

  void addUserSentence(String sentenceText) {
    state =
        state.copyWith(userSentences: [...state.userSentences, sentenceText]);
  }

  void addHistory({required Question question, Sentence? sentence}) {
    List<HistoryItem> history = [
      HistoryItem(
          questionType: question.type,
          questionText: question.question,
          sentenceText: sentence != null ? sentence.sentence : '')
    ];

    for (var i = 0; i < state.history.length; i++) {
      if (i < 12) {
        history.add(state.history[i]);
      }
    }

    state = state.copyWith(history: history);
  }

  void favoriteSentenceHandler(List<Map> favSentences) {
    final sentences = state.sentences.map((e) => e).toList();
    List<Sentence> addedSentences = [];
    for (var i = 0; i < favSentences.length; i++) {
      if (favSentences[i]['action'] == 'add') {
        addedSentences.add(favSentences[i]['sentence']);
      }

      if (favSentences[i]['action'] == 'delete') {
        if (favSentences[i]['type'] == 'card') {
          sentences.removeWhere((w) {
            return w.infoCard != null &&
                w.infoCard!.id == favSentences[i]['short_video_id'];
          });
        }

        if (favSentences[i]['type'] == 'video') {
          sentences.removeWhere((w) {
            return w.shortVideo != null &&
                w.shortVideo!.id == favSentences[i]['short_video_id'];
          });
        }
      }
    }

    state = state.copyWith(sentences: [...addedSentences, ...sentences]);
  }

  void addSentenceUI(Sentence sentence) async {
    state = state.copyWith(isLoading: true);
    state = state
        .copyWith(sentences: [sentence, ...state.sentences], isLoading: false);
  }

  void editSentenceUI(Sentence sentence) {
    List<Sentence> newSentences = [];

    for (var w in state.sentences) {
      if (w.id == sentence.id) {
        newSentences.add(sentence);
      } else {
        newSentences.add(w);
      }
    }

    state = state.copyWith(sentences: newSentences);
  }

  void deleteSentenceUI(int id) {
    List<Sentence> newSentences = [];

    for (var w in state.sentences) {
      if (w.id == id) {
        continue;
      } else {
        newSentences.add(w);
      }
    }

    state = state.copyWith(sentences: newSentences);
  }
}

final sentenceListProvider =
    StateNotifierProvider<SentenceListNotifier, SentenceListState>((ref) {
  final sentenceRepository = ref.watch(sentenceRepositoryProvider);
  final screenFlowRepository = ref.watch(screenFlowRepositoryProvider);
  return SentenceListNotifier(sentenceRepository, screenFlowRepository);
});
