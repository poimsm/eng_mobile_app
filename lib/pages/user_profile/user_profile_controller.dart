import 'package:eng_mobile_app/data/models/library.dart';
import 'package:eng_mobile_app/data/models/user.dart';
import 'package:eng_mobile_app/data/repositories/user/enums.dart';
import 'package:eng_mobile_app/data/repositories/user/user_repository.dart';
import 'package:eng_mobile_app/data/repositories/user/user_repository_impl.dart';
import 'package:eng_mobile_app/services/auth/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

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
  });

  User user;
  List<Favorite> favorites;
  UserStats stats;

  UserProfileState copyWith({
    user,
    favorites,
    stats,
  }) {
    return UserProfileState(
      user: user ?? this.user,
      favorites: favorites ?? this.favorites,
      stats: stats ?? this.stats,
    );
  }
}

class UserProfileNotifier extends StateNotifier<UserProfileState> {
  UserProfileNotifier(this._userRepository, this._authService)
      : super(UserProfileState());

  final UserRepository _userRepository;
  final AuthService _authService;

  Future<bool> getPageData() async {
    final stats = await _userRepository.getStats();
    final user = await _userRepository.getProfile();
    final favorites = await _userRepository.getFavoriteResources();
    state = state.copyWith(user: user, favorites: favorites, stats: stats);
    return true;
  }

  Future<FavoriteResponse?> getContentById(int id) async {
    final resp = await _userRepository.getCardOrVideoByFavoriteId(id);
    return resp;
  }

  void logout() async {
    _authService.loginOut();
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
  final authService = GetIt.I.get<AuthService>();
  return UserProfileNotifier(userRepository, authService);
});
