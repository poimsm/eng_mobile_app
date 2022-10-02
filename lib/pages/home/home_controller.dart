import 'dart:async';
import 'dart:io';

import 'package:eng_mobile_app/data/models/activity.dart';
import 'package:eng_mobile_app/data/network/network.dart';
import 'package:eng_mobile_app/pages/home/enums.dart';

import 'package:eng_mobile_app/utils/helpers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:text_to_speech/text_to_speech.dart';

class HomeState {
  HomeState(
      {this.activities = const [],
      this.isRecording = false,
      this.loadingNextActivity = false,
      this.activity,
      this.currentIndex = 0,
      this.challengeState = ChallengeStates.instructions,
      this.showChallenge = false,
      this.hasAudioSaved = false,
      this.isPlaying = false,
      this.isLoading = true});

  List<Activity> activities;
  Activity? activity;
  int currentIndex;
  bool isRecording;
  bool isLoading;
  bool loadingNextActivity;
  bool showChallenge;
  bool hasAudioSaved;
  bool isPlaying;
  ChallengeStates challengeState;

  HomeState copyWith(
      {activities,
      isRecording,
      isLoading,
      activity,
      currentIndex,
      loadingNextActivity,
      challengeState,
      showChallenge,
      isPlaying,
      hasAudioSaved}) {
    return HomeState(
      activities: activities == null
          ? this.activities
          : [...this.activities, ...activities],
      isRecording: isRecording ?? this.isRecording,
      isLoading: isLoading ?? this.isLoading,
      activity: activity ?? this.activity,
      currentIndex: currentIndex ?? this.currentIndex,
      loadingNextActivity: loadingNextActivity ?? this.loadingNextActivity,
      challengeState: challengeState ?? this.challengeState,
      showChallenge: showChallenge ?? this.showChallenge,
      hasAudioSaved: hasAudioSaved ?? this.hasAudioSaved,
      isPlaying: isPlaying ?? this.isPlaying,
    );
  }
}

// FlutterTts flutterTts = FlutterTts();
TextToSpeech tts = TextToSpeech();
final player = AudioPlayer();
// FlutterSoundRecorder myRecorder = FlutterSoundRecorder();
// final aa = myRecorder.openRecorder();
// aa.startRe
final record = Record();
bool recordCompleted = false;

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier() : super(HomeState());

  bool micBlocked = false;

  Future<bool> retrieveActivities() async {
    state = state.copyWith(isLoading: true);
    final resp = await Network().get('/activities');
    if (!resp.ok) {
      state = state.copyWith(isLoading: false);
      return false;
    }

    final activitiesData =
        (resp.data as List).map((x) => Activity.fromJson(x)).toList();

    state =
        state.copyWith(activities: activitiesData, activity: activitiesData[0]);
    state = state.copyWith(isLoading: false);

    if (state.activity!.type == 'question') {
      speak(state.activity!.question!.questionVoice);
    } else {
      speak('Describe the picture!');
    }

    if (activitiesData[0].word != null) {
      await sleep(1000);
      state = state.copyWith(showChallenge: true);
    }
    return true;
  }

  void onNextActivity() async {
    state = state.copyWith(loadingNextActivity: true);
    final index = state.currentIndex;

    state = state.copyWith(
        showChallenge: false,
        challengeState: ChallengeStates.instructions,
        hasAudioSaved: false);

    if (index + 1 > state.activities.length - 1) {
      bool nextOK = await retrieveActivities();
      if (nextOK) {
        state = state.copyWith(
            activity: state.activities[index + 1], currentIndex: index + 1);
      }

      state = state.copyWith(loadingNextActivity: false);
      await sleep(1000);
      state = state.copyWith(showChallenge: true);
      return;
    }

    state = state.copyWith(
        activity: state.activities[index + 1], currentIndex: index + 1);

    await sleep(1000);
    state = state.copyWith(loadingNextActivity: false);
    if (state.activity!.type == 'question') {
      speak(state.activity!.question!.questionVoice);
    } else {
      speak('Describe the picture!');
    }

    // speak(state.activity.question.);
    await sleep(1000);
    state = state.copyWith(showChallenge: true);
  }

  void toggleRecording() async {
    if (state.isRecording) {
      stopMic();
    } else {
      recordMic();
    }

    state = state.copyWith(isRecording: !state.isRecording);
  }

  void onWordClicked(val) async {
    print('onWordClicked');
    state = state.copyWith(challengeState: val);
  }

  void speak(String text) async {
    await sleep(1000);
    tts.setVolume(1.0);
    tts.setRate(1.2);
    tts.setPitch(1.0);
    tts.speak(text);
  }

  void playAudio() async {
    try {
      if (state.isPlaying) {
        await player.stop();
        state = state.copyWith(isPlaying: false);
        return;
      }

      state = state.copyWith(isPlaying: true);

      Directory appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;
      String audioPath = '$appDocPath/my_voice.pm3';
      // player.setFilePath(audioPath);
      // final duration=await player.setAsset('assets/a01.mp3');
      final duration = await player.setFilePath(audioPath);

      print(duration);

      await player.play();
      state = state.copyWith(isPlaying: false);
    } catch (_) {
      state = state.copyWith(isPlaying: false);
    }
  }

  void stopMic() async {
    if (await record.isRecording()) {
      await record.stop();
    }
  }

  void recordMic() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    String audioPath = '$appDocPath/my_voice.pm3';

    if (await record.hasPermission()) {
      if (await record.isRecording()) {
        await record.stop();
      }

      await record.start(
        path: audioPath,
        encoder: AudioEncoder.aacLc,
        bitRate: 128000,
        samplingRate: 44100,
      );

      triggerRecordTracker();
    }
  }

  triggerRecordTracker() async {
    Timer(Duration(seconds: 5), () async {
      recordCompleted = true;
      await record.stop();
      state = state.copyWith(hasAudioSaved: true, isRecording: false);
      stopMic();
      print('LISTOOOOOOOOO');
    });
  }

  void readExample() {
    List<Map> ss = [
      {
        'text': 'Hello this is me oscar jaime Garcia',
        'duration': 2000,
      },
      {
        'text': "I live in the city of Valdivia but I'm from",
        'duration': 2000,
      },
      {
        'text': 'a small island called Mancera. This has a fortres!',
        'duration': 2000,
      }
    ];
  }
}

final homeProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  return HomeNotifier();
});
