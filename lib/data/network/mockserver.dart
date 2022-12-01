// ignore_for_file: avoid_print

import 'package:eng_mobile_app/data/mocks/index.dart';
import 'package:eng_mobile_app/data/mocks/mock_user_flow.dart';
import 'package:eng_mobile_app/utils/helpers.dart';

class MockReply {
  int statusCode;
  String data;

  MockReply(this.statusCode, this.data);
}

class MockServer {
  String endpoint;

  MockServer(this.endpoint);

  Future<MockReply> get() async {
    print('\x1B[33m -------------------------------- \x1B[0m');
    print('\x1B[33m |          MOCKSERVER          | \x1B[0m');
    print('\x1B[33m -------------------------------- \x1B[0m');

    await sleep(1000);

    if (endpoint.contains('/activities')) {
      return MockReply(200, MockActivities().json());
    }

    if (endpoint.contains('/word')) {
      return MockReply(200, MockMyWords().json());
    }

    if (endpoint.contains('/library/video')) {
      return MockReply(200, MockVideos().json());
    }

    if (endpoint.contains('/library/card')) {
      return MockReply(200, MockCards().json());
    }

    if (endpoint.contains('/global/config')) {
      return MockReply(200, MockBackendSettings().json());
    }

    if (endpoint.contains('/user/data')) {
      return MockReply(200, MockUserData().json());
    }

    return MockReply(404, 'Not Found');
  }

  Future<MockReply> post(Map<String, dynamic> data) async {
    print('\x1B[33m -------------------------------- \x1B[0m');
    print('\x1B[33m |          MOCKSERVER          | \x1B[0m');
    print('\x1B[33m -------------------------------- \x1B[0m');

    await sleep(1000);

    // if (endpoint.contains('/token/')) {
    //   await sleep(2000);
    //   return MockReply(200, MockAccessToken().json());
    // }

    if (endpoint.contains('/word/')) {
      return MockReply(200, MockNewWord().json());
    }

    if (endpoint.contains('/userflow')) {
      return MockReply(200, MockUserFlow().json());
    }

    if (endpoint.contains('/user/sign-in')) {
      return MockReply(200, MockUserSignIn().json());
    }

    if (endpoint.contains('/user/sign-up')) {
      return MockReply(200, MockUserSignUp().json());
    }

    if (endpoint.contains('/user/delete-user')) {
      return MockReply(200, MockUserDelete().json());
    }

    if (endpoint.contains('/user/fake-user')) {
      return MockReply(200, MockUserFakeCreate().json());
    }

    return MockReply(404, 'Not Found');
  }
}
