class MockActivities {
  json() {
    return '''
      [
    {
        "type": "question",
        "question": {
            "id": 1,
            "question": "X1 ¿Hello can you resolve this question? Sure, Nope?",
            "image_url": "https://i.pinimg.com/564x/29/2b/a2/292ba2025c0b8ff9b77e35d0f5a0509e.jpg"            
        },
        "word": {
            "id": 101,
            "word": "Speeding up!",
            "meaning": "When you speed up car!"
        },
        "design": {
            "background_color": "#726396",
            "word_background_color": "#44546A"
        }
    },
    {
        "type": "describe_the_picture",
        "image_activity": {
            "id": 2,
            "image_url": "https://i.pinimg.com/564x/ca/f0/20/caf0208f3c88aeb64e5caec5e64aebd6.jpg"            
        },
        "word": null,
        "design": {
            "background_color": "#575D5B",
            "word_background_color": "#45423C"
        }
    },
    {
        "type": "question",
        "question": {
            "id": 3,
            "question": "X2 ¿Hello can you resolve this question? Sure, Nope?",
            "image_url": "https://i.pinimg.com/564x/29/2b/a2/292ba2025c0b8ff9b77e35d0f5a0509e.jpg"            
        },
        "word": {
            "id": 102,
            "word": "Lastly 2",
            "meaning": "This should be a long meaning when you entered this word"
        },
        "design": {
            "background_color": "#726396",
            "word_background_color": "#44546A"
        }
    },
    {
        "type": "describe_the_picture",
        "image_activity": {
            "id": 4,
            "image_url": "https://i.pinimg.com/564x/ca/f0/20/caf0208f3c88aeb64e5caec5e64aebd6.jpg"            
        },
        "word": null,
        "design": {
            "background_color": "#575D5B",
            "word_background_color": "#45423C"
        }
    }
]
  ''';
  }
}
