class MockUserSignIn {
  json() {
    return '''
    {
      "access": "access_token_asdasdas",
      "refresh": "refresh_token_asdasdas",
      "user": {
        "id": 123,
        "total_sentences": 56,
        "verified": true,
        "screen_flow": true,
        "email": "signin_real0002@mock.com"
      }
    }
  ''';
  }
}
