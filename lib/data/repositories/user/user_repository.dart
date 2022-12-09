import 'package:eng_mobile_app/data/models/library.dart';
import 'package:eng_mobile_app/data/models/user.dart';

import 'enums.dart';

abstract class UserRepository {
  Future<List<Favorite>> getFavoriteResources();
  Future<FavoriteResponse?> getCardOrVideoByFavoriteId(int id);
  Future<User> getProfile();
  Future<UserStats> getStats();
}
