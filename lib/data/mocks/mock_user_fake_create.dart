class MockUserFakeCreate {
  json() {
    return '''
    {
      "access": "access_token_asdasdas",
      "refresh": "refresh_token_asdasdas",
      "user": {
        "id": 3948,
        "total_sentences": 0,
        "verified": false,
        "screen_flow": true,
        "email": "fake_user_0001@mock.com"
      }
    }
  ''';
  }
}
