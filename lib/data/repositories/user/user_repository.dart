import 'package:eng_mobile_app/data/models/user.dart';

abstract class UserRepository {
  Future<User> getProfile();
  Future<UserStats> getStats();
  Future<void> logout();
}
