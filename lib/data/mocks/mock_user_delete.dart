class MockUserDelete {
  json() {
    return '''
    {
      "access": "access_token_asdasdas",
      "refresh": "refresh_token_asdasdas",
      "user": {
        "id": 1210,
        "total_sentences": 0,
        "verified": false,
        "screen_flow": true,
        "email": "delete_fake0002@fake.com"
      }
    }
  ''';
  }
}
