class MockActivities {
  json() {
    return '''
      [
        {
          "type": "question",
          "question": {
            "id": 1,
            "question": "When a friend come over, do you like to cook for fun? Hm Like what?",
            "voice_url": "https://i.pinimg.com/audio_01.mp3",
            "image_url": "https://i.pinimg.com/564x/29/2b/a2/292ba2025c0b8ff9b77e35d0f5a0509e.jpg"
          },
          "word": {
            "id": 101,
            "word": "Speeding up!",
            "meaning": "When you speed up car!"
          },
          "example": {
            "id": 101,
            "example": [
              {
                "text": "",
                "duration": 0
              },
              {
                "text": "",
                "duration": 0
              },
              {
                "text": "",
                "duration": 0
              },
              {
                "text": "",
                "duration": 0
              },
              {
                "text": "",
                "duration": 0
              },
              {
                "text": "",
                "duration": 0
              }
            ],
            "voice_url": "https://i.pinimg.com/audio_01.mp3",
            "type": 0,
            "activity_id": 12
          },
          "style": {
            "background_screen": "#726396",
            "background_word": "#44546A"
          }
        },
        {
          "type": "describe_the_picture",
          "image_activity": {
            "id": 4,
            "image_url": "https://i.pinimg.com/564x/ca/f0/20/caf0208f3c88aeb64e5caec5e64aebd6.jpg"
          },
          "word": null,
          "example": {
            "id": 101,
            "example": [
              {
                "text": "",
                "duration": 0
              },
              {
                "text": "",
                "duration": 0
              },
              {
                "text": "",
                "duration": 0
              },
              {
                "text": "",
                "duration": 0
              },
              {
                "text": "",
                "duration": 0
              },
              {
                "text": "",
                "duration": 0
              }
            ],
            "voice_url": "https://i.pinimg.com/audio_01.mp3",
            "type": 0,
            "activity_id": 12
          },
          "style": {
            "background_screen": "#726396",
            "background_word": "#44546A"
          }
        },
        {
          "type": "question",
          "question": {
            "id": 3,
            "question": "When a friend come over, do you like to cook for fun? Hm Like what?",
            "voice_url": "When a friend come over, do you like to cook for fun? Like what?",
            "image_url": "https://i.pinimg.com/564x/29/2b/a2/292ba2025c0b8ff9b77e35d0f5a0509e.jpg"
          },
          "word": {
            "id": 102,
            "word": "Lastly 2",
            "meaning": "This should be a long meaning when you entered this word"
          },
          "example": {
            "id": 101,
            "example": [
              {
                "text": "",
                "duration": 0
              },
              {
                "text": "",
                "duration": 0
              },
              {
                "text": "",
                "duration": 0
              },
              {
                "text": "",
                "duration": 0
              },
              {
                "text": "",
                "duration": 0
              },
              {
                "text": "",
                "duration": 0
              }
            ],
            "voice_url": "https://i.pinimg.com/audio_01.mp3",
            "type": 0,
            "activity_id": 12
          },
          "style": {
            "background_screen": "#726396",
            "background_word": "#44546A"
          }
        },
        {
          "type": "describe_the_picture",
          "image_activity": {
            "id": 4,
            "image_url": "https://i.pinimg.com/564x/ca/f0/20/caf0208f3c88aeb64e5caec5e64aebd6.jpg"
          },
          "word": null,
          "style": {
            "background_screen": "#726396",
            "background_word": "#44546A"
          }
        }
      ]
  ''';
  }
}
