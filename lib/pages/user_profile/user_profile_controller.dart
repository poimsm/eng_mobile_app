import 'package:eng_mobile_app/data/models/library.dart';
import 'package:eng_mobile_app/data/models/user.dart';
import 'package:eng_mobile_app/data/repositories/library/library_repository.dart';
import 'package:eng_mobile_app/data/repositories/library/library_repository_impl.dart';
import 'package:eng_mobile_app/data/repositories/user/user_repository.dart';
import 'package:eng_mobile_app/data/repositories/user/user_repository_impl.dart';
import 'package:eng_mobile_app/pages/sentence_list/enums.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Screens { userProfile, infoCard, shortVideo }

class UserProfileState {
  UserProfileState({
    this.user = const User(
        id: -1, email: 'Visitor', screenFlow: false, verified: false),
    this.favorites = const [],
    this.stats = const UserStats(
      id: -1,
      totalSentences: 0,
      totalVideos: 0,
      totalCards: 0,
    ),
    this.screen = Screens.userProfile,
    this.infoCard,
    this.shortVideo,
    this.isAuthenticated = false,
  });

  User user;
  List<Favorite> favorites;
  UserStats stats;
  Screens screen;
  InfoCard? infoCard;
  ShortVideo? shortVideo;
  bool isAuthenticated;

  UserProfileState copyWith({
    user,
    favorites,
    stats,
    screen,
    infoCard,
    shortVideo,
    isAuthenticated,
  }) {
    return UserProfileState(
      user: user ?? this.user,
      favorites: favorites ?? this.favorites,
      stats: stats ?? this.stats,
      screen: screen ?? this.screen,
      infoCard: infoCard ?? this.infoCard,
      shortVideo: shortVideo ?? this.shortVideo,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }
}

class UserProfileNotifier extends StateNotifier<UserProfileState> {
  UserProfileNotifier(this._userRepository, this._libraryRepository)
      : super(UserProfileState());

  final UserRepository _userRepository;
  final LibraryRepository _libraryRepository;

  Future<bool> getPageData() async {
    final stats = await _userRepository.getStats();
    final user = await _userRepository.getProfile();
    final favorites = await _libraryRepository.getFavoriteResources();
    bool isAuth = _userRepository.isAuthenticated();
    state = state.copyWith(
        user: user,
        favorites: favorites,
        stats: stats,
        isAuthenticated: isAuth);
    return true;
  }

  Future<void> openContent(Favorite favorite) async {
    if (favorite.sourceType == SourceType.infoCard) {
      final card = await _libraryRepository.getInfoCardById(favorite.infoCard!);
      if (card == null) return;
      state = state.copyWith(infoCard: card, screen: Screens.infoCard);
      return;
    }

    final video =
        await _libraryRepository.getShortVideoById(favorite.shortVideo!);
    if (video == null) return;
    state = state.copyWith(shortVideo: video, screen: Screens.shortVideo);
    return;
  }

  void setScreen(Screens val) async {
    state = state.copyWith(screen: val);
  }

  void logout() async {
    _userRepository.logout();
    state = state.copyWith(isAuthenticated: false);
  }

  void screenFlow() async {
    // state = state.copyWith(animateAddSentenceBtn: true);
    // await sleep(1000);
    // state = state.copyWith(animateAddSentenceBtn: false);
  }
}

final userProfileProvider =
    StateNotifierProvider.autoDispose<UserProfileNotifier, UserProfileState>(
        (ref) {
  final userRepository = ref.watch(userRepositoryProvider);
  final libraryRepository = ref.watch(libraryRepositoryProvider);
  return UserProfileNotifier(userRepository, libraryRepository);
});
