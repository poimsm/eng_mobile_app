import 'package:eng_mobile_app/utils/helpers.dart';
import 'package:eng_mobile_app/data/models/user.dart';
import 'package:eng_mobile_app/data/network/network.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  User _user = const User(id: -1, anonymous: true, email: 'fake@fake');
  User get user => _user;

  String _token = 'None';
  String get token => _token;

  Future<bool> checkTokenValidity() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String? accessToken = prefs.getInt('access') as String?;

      if (accessToken == null) return false;

      _token = accessToken;

      final respUser = await Network().get('/user/data');

      if (!respUser.ok) {
        _token = 'None';
        return false;
      }

      _user = User.fromJson(respUser.data);

      return true;
    } catch (e, s) {
      _token = 'None';
      printError('checkTokenValidity: $e');
      printError(s.toString());
      return false;
    }
  }

  void loginOut() async {
    try {
      _user = const User(id: -1, anonymous: true, email: 'fake@fake');
      _token = 'None';
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('access');
      await prefs.remove('refresh');
    } catch (e) {
      printError(e.toString());
    }
  }

  Future<bool> createAnonymousUser(payload) async {
    try {
      Response response =
          await Network().post('/user/fake-user', data: payload);

      if (!response.ok) return false;

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('access', response.data['access']);
      await prefs.setString('refresh', response.data['refresh']);

      _token = response.data['access'];
      _user = User.fromJson(response.data);

      return true;
    } catch (e, s) {
      _token = 'None';
      printError('createAnonymousUser: $e');
      printError(s.toString());
      return false;
    }
  }

  Future<bool> signIn(payload) async {
    try {
      Response respToken = await Network().post('/token', data: payload);

      if (!respToken.ok) return false;
      _token = respToken.data['access'];

      Response respUser = await Network().get('/user/data');

      if (!respUser.ok) {
        _token = 'None';
        return false;
      }

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('access', respToken.data['access']);
      await prefs.setString('refresh', respToken.data['refresh']);

      _token = respToken.data['access'];
      _user = User.fromJson(respUser.data);

      return true;
    } catch (e, s) {
      _token = 'None';
      printError('signIn: $e');
      printError(s.toString());
      return false;
    }
  }

  Future<bool> createNewUser(payload) async {
    try {
      Response response = await Network().post('/user/register', data: payload);

      if (!response.ok) return false;
      _user = User.fromJson(response.data);

      return true;
    } catch (e, s) {
      printError('createNewUser: $e');
      printError(s.toString());
      return false;
    }
  }
}
