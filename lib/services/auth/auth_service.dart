import 'package:eng_mobile_app/utils/helpers.dart';
import 'package:eng_mobile_app/data/models/user.dart';
import 'package:eng_mobile_app/data/network/network.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

User _fakeUser = User(
  id: -1,
  verified: false,
  screenFlow: false,
  email: 'Visitor',
);

class AuthService {
  User _user = _fakeUser;
  User get user => _user;
  bool get isAuthenticated => _user.id != -1;

  String _token = 'None';
  String get token => _token;

  Future<bool> checkTokenValidityAndGetUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String? accessToken = prefs.getString('access');

      if (accessToken == null) return false;

      _token = accessToken;

      final config = NetworkConfigWithJWBToken(_token).config();

      final tokenResp = await Network(config, retries: 2)
          .post('/token/verify', data: {'token': _token});
      if (!tokenResp.ok) return false;

      final respUser = await Network(config, retries: 2).get('/user/data');
      if (!respUser.ok) return false;

      _user = User.fromJson(respUser.data);
      return true;
    } catch (e, s) {
      _token = 'None';
      printError('checkTokenValidityOrCreateFakeUser: $e');
      printError(s.toString());
      return false;
    }
  }

  // Future<bool> checkTokenValidityOrCreateFakeUser() async {
  //   try {
  //     final prefs = await SharedPreferences.getInstance();
  //     String? accessToken = prefs.getString('access');

  //     if (accessToken != null) {
  //       _token = accessToken;

  //       final config = NetworkConfigWithJWBToken(_token).config();
  //       final respUser = await Network(config).get('/user/data');

  //       if (respUser.ok) {
  //         _user = User.fromJson(respUser.data);
  //         return true;
  //       }
  //     }

  //     Response respFakeUser = await Network().post('/user/fake-user', data: {});

  //     if (!respFakeUser.ok) return false;

  //     await prefs.setString('access', respFakeUser.data['access']);
  //     await prefs.setString('refresh', respFakeUser.data['refresh']);

  //     _token = respFakeUser.data['access'];
  //     _user = User.fromJson(respFakeUser.data);

  //     return true;
  //   } catch (e, s) {
  //     _token = 'None';
  //     printError('checkTokenValidityOrCreateFakeUser: $e');
  //     printError(s.toString());
  //     return false;
  //   }
  // }

  Future loginOut() async {
    try {
      _user = _fakeUser;
      _token = 'None';
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('access');
      await prefs.remove('refresh');
    } catch (e) {
      printError(e.toString());
    }
  }

  Future<Response> signIn(SignInPayload payload) async {
    try {
      final config = NetworkConfigWithJWBToken('None').config();
      Response response =
          await Network(config).post('/user/sign-in', data: payload.toMap());

      if (!response.ok) return response;

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('access', response.data['access']);
      await prefs.setString('refresh', response.data['refresh']);

      _token = response.data['access'];
      _user = User.fromJson(response.data['user']);

      return response;
    } catch (e, s) {
      _token = 'None';
      printError('signIn: $e');
      printError(s.toString());
      return Response(ok: false);
    }
  }

  Future<Response> signUp(SignUpPayload payload) async {
    try {
      final config = NetworkConfigWithJWBToken('None').config();

      final uuid = Uuid();
      Response response = await Network(config).post('/user/sign-up', data: {
        'uuid': uuid.v4(),
        'email': payload.email,
        'password': payload.password
      });

      if (!response.ok) return response;

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('access', response.data['access']);
      await prefs.setString('refresh', response.data['refresh']);

      _token = response.data['access'];
      _user = User.fromJson(response.data['user']);

      return response;
    } catch (e, s) {
      _token = 'None';
      printError('signUp: $e');
      printError(s.toString());
      return Response(ok: false);
    }
  }

  Future<User> getProfile() async {
    if (_user.id != -1) {
      final config = NetworkConfigWithJWBToken(_token).config();
      final resp = await Network(config).get('/user/data');
      if (!resp.ok) return _user;
      _user = User.fromJson(resp.data);
      return _user;
    }
    return _user;
  }

  // Future<bool> deleteUser(int id) async {
  //   try {
  //     final config = NetworkConfigWithJWBToken('None').config();
  //     Response response =
  //         await Network(config).post('/user/delete-user', data: {'id': id});

  //     if (!response.ok) return false;

  //     final prefs = await SharedPreferences.getInstance();
  //     await prefs.setString('access', response.data['access']);
  //     await prefs.setString('refresh', response.data['refresh']);

  //     _token = response.data['access'];
  //     _user = User.fromJson(response.data['user']);

  //     return true;
  //   } catch (e, s) {
  //     _token = 'None';
  //     printError('deleteUser: $e');
  //     printError(s.toString());
  //     return false;
  //   }
  // }
}

class SignInPayload {
  SignInPayload({required this.email, required this.password});

  final String email;
  final String password;

  toMap() {
    return {'email': email, 'password': password};
  }
}

class SignUpPayload {
  SignUpPayload({required this.email, required this.password});

  final String email;
  final String password;

  toMap() {
    return {'email': email, 'password': password};
  }
}
