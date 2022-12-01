class MockUserSignUp {
  json() {
    return '''
    {
      "access": "access_token_asdasdas",
      "refresh": "refresh_token_asdasdas",
      "user": {
        "id": 122,
        "total_words": 0,
        "verified": true,
        "screen_flow": true,
        "email": "signup_real0001@mock.com"
      }
    }
  ''';
  }
}
