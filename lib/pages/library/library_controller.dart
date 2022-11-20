import 'package:eng_mobile_app/data/models/activity.dart';
import 'package:eng_mobile_app/data/models/library.dart';
import 'package:eng_mobile_app/data/network/network.dart';
import 'package:eng_mobile_app/pages/word_list/enums.dart';
import 'package:eng_mobile_app/utils/helpers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class LibraryState {
  LibraryState({
    this.isLoading = true,
    this.videos = const [],
    this.cards = const [],
    this.isPlayingVideo = false,
    this.videoIndex = 0,
    this.haveSavedWords = false,
    this.words = const [],
    this.animateWords = false,
  });

  List<ShortVideo> videos;
  List<InfoCard> cards;
  bool isLoading;
  bool isPlayingVideo;
  bool haveSavedWords;
  int videoIndex;
  List<Word> words;
  bool animateWords;

  LibraryState copyWith({
    videos,
    cards,
    isLoading,
    isPlayingVideo,
    haveSavedWords,
    videoIndex,
    words,
    animateWords,
    }) {

    return LibraryState(
      videos: videos ?? this.videos,
      cards: cards ?? this.cards,
      isLoading: isLoading ?? this.isLoading,
      isPlayingVideo: isPlayingVideo ?? this.isPlayingVideo,
      haveSavedWords: haveSavedWords ?? this.haveSavedWords,
      videoIndex: videoIndex ?? this.videoIndex,
      words: words ?? this.words,
      animateWords: animateWords?? this.animateWords,
    );
  }
}

class LibraryNotifier extends StateNotifier<LibraryState> {
  LibraryNotifier() : super(LibraryState());

  Future<bool> fetchVideos() async {
    state = state.copyWith(isLoading: true);
    final resp = await Network().get('/library/videos/?id=12');
    if (!resp.ok) {
      state = state.copyWith(isLoading: false);
      return false;
    }

    final data =
        (resp.data as List).map((x) => ShortVideo.fromJson(x)).toList();

    state = state.copyWith(videos: data);
    state = state.copyWith(isLoading: false);
    return true;
  }

  Future<bool> fetchCards() async {
    state = state.copyWith(isLoading: true);
    final resp = await Network().get('/library/cards/?id=12');
    if (!resp.ok) {
      state = state.copyWith(isLoading: false);
      return false;
    }

    final data =
        (resp.data as List).map((x) => InfoCard.fromJson(x)).toList();

    state = state.copyWith(cards: data);
    state = state.copyWith(isLoading: false);
    return true;
  }

  void saveCard(InfoCard card) {    
    card = card.copyWith(saved: true);

    List<InfoCard> cards = state.cards;

    cards = cards.map((x) {
        if(x.id == card.id) {
          return x.copyWith(saved: true);
        }
        return x;
      }).toList();

    List<Word> cardWords = [];

    for (var i = 0; i < card.words.length; i++) {
      cardWords.add(
        Word(
          id: card.words[i].id,
          word: card.words[i].word,
          origin: card.words[i].origin,
          type: card.words[i].type,
          extras: card.words[i].extras,
          saved: true,
          sourceType: SourceType.infoCard,
          infoCard: card
        )
      );
    }

    List<Word> words = [...state.words, ...cardWords];

    state = state.copyWith(cards: cards, haveSavedWords: true, words: words);

    toggleAnimateWord();
  }

  void saveVideoWords(ShortVideo video) {
    List<Word> videoWords = [];
    for (var i = 0; i < video.words.length; i++) {
      videoWords.add(
      video.words[i].copyWith(shortVideo: video)
      );
      // videoWords.add(
      //   Word.fromJson(videoWords.toJson())
      // );
    }
    List<Word> words = [...state.words, ...videoWords];
    state = state.copyWith(haveSavedWords: true, words: words);
  }

  void playVideo(ShortVideo video, int index) {
    state = state.copyWith(isPlayingVideo: true, videoIndex: index);
  }

  void toggleVideo() {
    state = state.copyWith(isPlayingVideo: !state.isPlayingVideo);
  }

  void toggleAnimateWord() async {
    state = state.copyWith(animateWords: true);
    await sleep(500);
    state = state.copyWith(animateWords: false);
  }
}

// .autoDispose<
//     SettingsAppearanceController, SnapFormState>
    
final libraryProvider =
    StateNotifierProvider.autoDispose<LibraryNotifier, LibraryState>((ref) {
  return LibraryNotifier();
});
