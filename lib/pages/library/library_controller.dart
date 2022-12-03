import 'package:eng_mobile_app/data/models/activity.dart';
import 'package:eng_mobile_app/data/models/library.dart';
import 'package:eng_mobile_app/data/network/network.dart';
import 'package:eng_mobile_app/data/repositories/library/library_repository.dart';
import 'package:eng_mobile_app/data/repositories/library/library_repository_impl.dart';
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
    this.words = const [],
    this.animateWords = false,
    this.wordCounter = 0,
    this.blocker = false,
    this.animateCardFavBtn = false,
    this.animateCardSpeakBtn = false,
    this.loadingCard = false,
  });

  List<ShortVideo> videos;
  List<InfoCard> cards;
  bool isLoading;
  bool isPlayingVideo;
  int videoIndex;
  List<Map> words;
  bool animateWords;
  int wordCounter;
  bool blocker;
  bool animateCardFavBtn;
  bool animateCardSpeakBtn;
  bool loadingCard;

  LibraryState copyWith({
    videos,
    cards,
    isLoading,
    isPlayingVideo,
    videoIndex,
    words,
    animateWords,
    wordCounter,
    blocker,
    animateCardFavBtn,
    animateCardSpeakBtn,
    loadingCard,
  }) {
    return LibraryState(
      videos: videos ?? this.videos,
      cards: cards ?? this.cards,
      isLoading: isLoading ?? this.isLoading,
      isPlayingVideo: isPlayingVideo ?? this.isPlayingVideo,
      videoIndex: videoIndex ?? this.videoIndex,
      words: words ?? this.words,
      animateWords: animateWords ?? this.animateWords,
      wordCounter: wordCounter ?? this.wordCounter,
      blocker: blocker ?? this.blocker,
      animateCardFavBtn: animateCardFavBtn ?? this.animateCardFavBtn,
      animateCardSpeakBtn: animateCardSpeakBtn ?? this.animateCardSpeakBtn,
      loadingCard: loadingCard ?? this.loadingCard,
    );
  }
}

class LibraryNotifier extends StateNotifier<LibraryState> {
  LibraryNotifier(this._libraryRepository) : super(LibraryState());

  final LibraryRepository _libraryRepository;

  void setTotalWords(int val) async {
    state = state.copyWith(wordCounter: val);
  }

  Future<void> fetchVideos() async {
    state = state.copyWith(isLoading: true);
    final videos = await _libraryRepository.getVideos();
    state = state.copyWith(isLoading: false, videos: videos);
  }

  Future<void> fetchCards() async {
    state = state.copyWith(isLoading: true, loadingCard: true);
    final cards = await _libraryRepository.getCards();
    state = state.copyWith(isLoading: false, cards: cards);
  }

  void setLoadingCard(bool val) {
    state = state.copyWith(loadingCard: val);
  }

  void toggleFavoriteCard(InfoCard card) async {
    bool isFavoriteFlag = !card.isFavorite!;
    card = card.copyWith(isFavorite: isFavoriteFlag);
    _libraryRepository.toggleCardFavorite(card);

    List<InfoCard> cards = state.cards;

    cards = cards.map((x) {
      if (x.id == card.id) {
        return x.copyWith(isFavorite: isFavoriteFlag);
      }
      return x;
    }).toList();

    List<Word> cardWords = [];

    for (var i = 0; i < card.words.length; i++) {
      cardWords.add(Word(
          id: card.words[i].id,
          word: card.words[i].word,
          origin: card.words[i].origin,
          type: card.words[i].type,
          extras: card.words[i].extras,
          saved: isFavoriteFlag,
          sourceType: SourceType.infoCard,
          infoCard: card));
    }

    List<Map> words = state.words;
    List<Map> newWords = words.map((e) => e).toList();

    bool foundCard = false;

    for (var i = 0; i < words.length; i++) {
      if (state.words[i]['type'] == 'card' &&
          state.words[i]['info_card_id'] == card.id) {
        foundCard = true;
        break;
      }
    }

    if (foundCard) {
      newWords.removeWhere((Map w) => w['info_card_id'] == card.id);
    } else {
      for (var i = 0; i < cardWords.length; i++) {
        newWords.add({
          'type': 'card',
          'info_card_id': card.id,
          'action': isFavoriteFlag ? 'add' : 'delete',
          'word': cardWords[i]
        });
      }
    }

    int wordCounter = state.wordCounter;
    for (var i = 0; i < cardWords.length; i++) {
      if (isFavoriteFlag) {
        wordCounter++;
      } else {
        wordCounter--;
      }
    }

    state =
        state.copyWith(cards: cards, words: newWords, wordCounter: wordCounter);
    // toggleAnimateTotalWords();
    toggleBlocker();
    toggleAnimatedCardFavBtn();
  }

  void toggleFavoriteVideo(ShortVideo video) {
    bool isFavoriteFlag = !video.isFavorite!;
    video = video.copyWith(isFavorite: isFavoriteFlag);
    _libraryRepository.toggleVideoFavorite(video);

    List<ShortVideo> videos = state.videos;

    videos = videos.map((x) {
      if (x.id == video.id) {
        return x.copyWith(isFavorite: isFavoriteFlag);
      }
      return x;
    }).toList();

    List<Word> videoWords = [];

    for (var i = 0; i < video.words.length; i++) {
      videoWords.add(Word(
          id: video.words[i].id,
          word: video.words[i].word,
          origin: video.words[i].origin,
          type: video.words[i].type,
          extras: video.words[i].extras,
          saved: isFavoriteFlag,
          sourceType: SourceType.shortVideo,
          shortVideo: video));
    }

    List<Map> words = state.words;
    List<Map> newWords = words.map((e) => e).toList();

    bool foundVideo = false;

    for (var i = 0; i < words.length; i++) {
      if (state.words[i]['type'] == 'video' &&
          state.words[i]['short_video_id'] == video.id) {
        foundVideo = true;
        break;
      }
    }

    if (foundVideo) {
      newWords.removeWhere((Map w) => w['short_video_id'] == video.id);
    } else {
      for (var i = 0; i < videoWords.length; i++) {
        newWords.add({
          'type': 'video',
          'short_video_id': video.id,
          'action': isFavoriteFlag ? 'add' : 'delete',
          'word': videoWords[i]
        });
      }
    }

    int wordCounter = state.wordCounter;
    for (var i = 0; i < videoWords.length; i++) {
      if (isFavoriteFlag) {
        wordCounter++;
      } else {
        wordCounter--;
      }
    }

    state = state.copyWith(
        videos: videos, words: newWords, wordCounter: wordCounter);
  }

  void playVideo(ShortVideo video, int index) {
    state = state.copyWith(isPlayingVideo: true, videoIndex: index);
  }

  void toggleVideo() {
    state = state.copyWith(isPlayingVideo: !state.isPlayingVideo);
  }

  void toggleAnimateTotalWords() async {
    state = state.copyWith(animateWords: true);
    await sleep(500);
    state = state.copyWith(animateWords: false);
  }

  void toggleAnimatedCardFavBtn() async {
    state = state.copyWith(animateCardFavBtn: true);
    await sleep(80);
    state = state.copyWith(animateCardFavBtn: false);
  }

  void toggleAnimatedCardSpeakBtn() async {
    state = state.copyWith(animateCardSpeakBtn: true);
    await sleep(80);
    state = state.copyWith(animateCardSpeakBtn: false);
  }

  void toggleBlocker({int milliseconds = 800}) async {
    state = state.copyWith(blocker: true);
    await sleep(milliseconds);
    state = state.copyWith(blocker: false);
  }
}

final libraryProvider =
    StateNotifierProvider.autoDispose<LibraryNotifier, LibraryState>((ref) {
  final libraryRepository = ref.watch(libraryRepositoryProvider);
  return LibraryNotifier(libraryRepository);
});
