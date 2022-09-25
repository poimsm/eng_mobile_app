import 'package:eng_mobile_app/data/models/activity.dart';
import 'package:eng_mobile_app/data/network/network.dart';
import 'package:eng_mobile_app/pages/home/enums.dart';

import 'package:eng_mobile_app/utils/helpers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      this.isLoading = true});

  List<Activity> activities;
  Activity? activity;
  int currentIndex;
  bool isRecording;
  bool isLoading;
  bool loadingNextActivity;
  bool showChallenge;
  bool hasAudioSaved;
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
    );
  }
}

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
    await sleep(1000);
    state = state.copyWith(showChallenge: true);
  }

  void startRecording() async {
    print('start_micBlocked:::: $micBlocked');
    micBlocked = true;
    print('startRecording 0');
    if (state.isRecording) return;
    print('startRecording 1');
    state = state.copyWith(isRecording: true);
    await sleep(50);
    micBlocked = false;
    print('start_1_micBlocked:::: $micBlocked');
  }

  void stopRecording() async {
    print('stop_micBlocked:::: $micBlocked');
    // if(micBlocked) return;
    print('stopRecording 0');
    if (!state.isRecording) return;
    print('stopRecording 1');
    state = state.copyWith(isRecording: false);
  }

  void toggleRecording() async {
    state = state.copyWith(isRecording: !state.isRecording);
  }

  void onWordClicked(val) async {
    print('onWordClicked');
    state = state.copyWith(challengeState: val);
  }
}

final homeProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  return HomeNotifier();
});
