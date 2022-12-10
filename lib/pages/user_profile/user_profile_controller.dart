import 'package:eng_mobile_app/data/models/library.dart';
import 'package:eng_mobile_app/data/models/user.dart';
import 'package:eng_mobile_app/data/repositories/library/library_repository.dart';
import 'package:eng_mobile_app/data/repositories/library/library_repository_impl.dart';
import 'package:eng_mobile_app/data/repositories/user/enums.dart';
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
  });

  User user;
  List<Favorite> favorites;
  UserStats stats;
  Screens screen;
  InfoCard? infoCard;
  ShortVideo? shortVideo;

  UserProfileState copyWith({
    user,
    favorites,
    stats,
    screen,
    infoCard,
    shortVideo,
  }) {
    return UserProfileState(
      user: user ?? this.user,
      favorites: favorites ?? this.favorites,
      stats: stats ?? this.stats,
      screen: screen ?? this.screen,
      infoCard: infoCard ?? this.infoCard,
      shortVideo: shortVideo ?? this.shortVideo,
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
    state = state.copyWith(user: user, favorites: favorites, stats: stats);
    return true;
  }

  Future<void> openContent(Favorite favorite) async {
    final resp =
        await _libraryRepository.getCardOrVideoByFavoriteId(favorite.id);
    if (resp == null) return;
    if (resp.sourceType == SourceType.infoCard) {
      state = state.copyWith(infoCard: resp.infoCard, screen: Screens.infoCard);
      return;
    }
    state =
        state.copyWith(shortVideo: resp.infoCard, screen: Screens.shortVideo);
    return;
  }

  void setScreen(Screens val) async {
    state = state.copyWith(screen: val);
  }

  Future<FavoriteResponse?> getContentById(int id) async {
    final resp = await _libraryRepository.getCardOrVideoByFavoriteId(id);
    return resp;
  }

  void logout() async {
    _userRepository.logout();
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
