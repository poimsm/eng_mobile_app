import 'package:eng_mobile_app/data/models/activity.dart';
import 'package:eng_mobile_app/data/models/library.dart';
import 'package:eng_mobile_app/data/network/network.dart';
import 'package:eng_mobile_app/data/repositories/library/library_repository.dart';
import 'package:eng_mobile_app/data/repositories/library/library_repository_impl.dart';
import 'package:eng_mobile_app/pages/sentence_list/enums.dart';
import 'package:eng_mobile_app/utils/helpers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LibraryState {
  LibraryState({
    this.isLoading = true,
    this.videos = const [],
    this.cards = const [],
    this.isPlayingVideo = false,
    this.videoIndex = 0,
    this.sentences = const [],
    this.animateSentences = false,
    this.sentenceCounter = 0,
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
  List<Map> sentences;
  bool animateSentences;
  int sentenceCounter;
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
    sentences,
    animateSentences,
    sentenceCounter,
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
      sentences: sentences ?? this.sentences,
      animateSentences: animateSentences ?? this.animateSentences,
      sentenceCounter: sentenceCounter ?? this.sentenceCounter,
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

  void setTotalSentences(int val) async {
    state = state.copyWith(sentenceCounter: val);
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

    List<Sentence> cardSentences = [];

    for (var i = 0; i < card.sentences.length; i++) {
      cardSentences.add(Sentence(
          id: card.sentences[i].id,
          sentence: card.sentences[i].sentence,
          origin: card.sentences[i].origin,
          type: card.sentences[i].type,
          extras: card.sentences[i].extras,
          saved: isFavoriteFlag,
          sourceType: SourceType.infoCard,
          infoCard: card));
    }

    List<Map> sentences = state.sentences;
    List<Map> newSentences = sentences.map((e) => e).toList();

    bool foundCard = false;

    for (var i = 0; i < sentences.length; i++) {
      if (state.sentences[i]['type'] == 'card' &&
          state.sentences[i]['info_card_id'] == card.id) {
        foundCard = true;
        break;
      }
    }

    if (foundCard) {
      newSentences.removeWhere((Map w) => w['info_card_id'] == card.id);
    } else {
      for (var i = 0; i < cardSentences.length; i++) {
        newSentences.add({
          'type': 'card',
          'info_card_id': card.id,
          'action': isFavoriteFlag ? 'add' : 'delete',
          'sentence': cardSentences[i]
        });
      }
    }

    int sentenceCounter = state.sentenceCounter;
    for (var i = 0; i < cardSentences.length; i++) {
      if (isFavoriteFlag) {
        sentenceCounter++;
      } else {
        sentenceCounter--;
      }
    }

    state = state.copyWith(
        cards: cards,
        sentences: newSentences,
        sentenceCounter: sentenceCounter);
    // toggleAnimateTotalSentences();
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

    List<Sentence> videoSentences = [];

    for (var i = 0; i < video.sentences.length; i++) {
      videoSentences.add(Sentence(
          id: video.sentences[i].id,
          sentence: video.sentences[i].sentence,
          origin: video.sentences[i].origin,
          type: video.sentences[i].type,
          extras: video.sentences[i].extras,
          saved: isFavoriteFlag,
          sourceType: SourceType.shortVideo,
          shortVideo: video));
    }

    List<Map> sentences = state.sentences;
    List<Map> newSentences = sentences.map((e) => e).toList();

    bool foundVideo = false;

    for (var i = 0; i < sentences.length; i++) {
      if (state.sentences[i]['type'] == 'video' &&
          state.sentences[i]['short_video_id'] == video.id) {
        foundVideo = true;
        break;
      }
    }

    if (foundVideo) {
      newSentences.removeWhere((Map w) => w['short_video_id'] == video.id);
    } else {
      for (var i = 0; i < videoSentences.length; i++) {
        newSentences.add({
          'type': 'video',
          'short_video_id': video.id,
          'action': isFavoriteFlag ? 'add' : 'delete',
          'sentence': videoSentences[i]
        });
      }
    }

    int sentenceCounter = state.sentenceCounter;
    for (var i = 0; i < videoSentences.length; i++) {
      if (isFavoriteFlag) {
        sentenceCounter++;
      } else {
        sentenceCounter--;
      }
    }

    state = state.copyWith(
        videos: videos,
        sentences: newSentences,
        sentenceCounter: sentenceCounter);
  }

  void playVideo(ShortVideo video, int index) {
    state = state.copyWith(isPlayingVideo: true, videoIndex: index);
  }

  void toggleVideo() {
    state = state.copyWith(isPlayingVideo: !state.isPlayingVideo);
  }

  void toggleAnimateTotalSentences() async {
    state = state.copyWith(animateSentences: true);
    await sleep(500);
    state = state.copyWith(animateSentences: false);
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
