import 'package:eng_mobile_app/data/models/activity.dart';
import 'package:eng_mobile_app/data/network/network.dart';

import 'package:eng_mobile_app/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

class HomeState {
  HomeState(
      {this.activities = const [],
      this.isRecording = false,
      this.isLoading = false});

  List<Activity> activities;
  bool isRecording;
  bool isLoading;

  HomeState copyWith({activities, isRecording, isLoading}) {
    return HomeState(
        activities: activities ?? this.activities,
        isRecording: isRecording ?? this.isRecording,
        isLoading: isLoading ?? this.isLoading);
  }
}

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier() : super(HomeState());

  void retrieveActivities() async {
    state = state.copyWith(isLoading: true);
    final resp = await Network().get('/activities');

    if(resp.ok) {
      state = state.copyWith(isLoading: false);
      return;
    }

    state = state.copyWith(activities: (resp.data as List)
          .map((x) => Activity.fromJson(x))
          .toList());

    state = state.copyWith(isLoading: false);




    // print('retrieveActivities----0');
    // await sleep(7000);
    // print('retrieveActivities----1');
    // // state = state.copyWith(isLoading: true);
    // // state.isLoading = true;
    // state = state.loading(true);
    // await sleep(7000);
    // print('retrieveActivities----2');
    // // state = state.copyWith(isLoading: false);
    // // state.isLoading = false; 
    // state = state.loading(false);
    // await sleep(7000);
    // print('retrieveActivities----3');
    // // state = state.copyWith(isLoading: true);
    // // state.isLoading = true;
    // state = state.loading(true);




    // state = state.copyWith(activities: []);
    // state = state.copyWith(isLoading: false);
  }
}

final homeProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  return HomeNotifier();
});
