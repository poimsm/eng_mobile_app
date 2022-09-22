class MockActivities {
  json() {
    return '''
      [
    {
        "type": "question",
        "question": {
            "id": 1,
            "question": "X1 ¿Hello can you resolve this question? Sure, Nope?",
            "image_url": "https://...."            
        },
        "word": {
            "id": 101,
            "word": "Lastly 1"
        },
        "design": {
            "background_color": "#444"
        }
    },
    {
        "type": "describe_the_picture",
        "image_activity": {
            "id": 2,
            "image_url": "https://...."            
        },
        "word": null,
        "design": {
            "background_color": "#444"
        }
    },
    {
        "type": "question",
        "question": {
            "id": 3,
            "question": "X2 ¿Hello can you resolve this question? Sure, Nope?",
            "image_url": "https://...."            
        },
        "word": {
            "id": 102,
            "word": "Lastly 2"
        },
        "design": {
            "background_color": "#444"
        }
    },
    {
        "type": "describe_the_picture",
        "image_activity": {
            "id": 4,
            "image_url": "https://...."            
        },
        "word": null,
        "design": {
            "background_color": "#444"
        }
    }
]
  ''';
  }
}
