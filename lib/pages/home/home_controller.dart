import 'dart:async';
import 'dart:io';

import 'package:eng_mobile_app/config.dart';
import 'package:eng_mobile_app/data/models/activity.dart';
import 'package:eng_mobile_app/data/models/library.dart';
import 'package:eng_mobile_app/data/repositories/activity/activity_repository.dart';
import 'package:eng_mobile_app/data/repositories/activity/activity_repository_impl.dart';
import 'package:eng_mobile_app/pages/home/enums.dart';
import 'package:eng_mobile_app/pages/sentence_list/enums.dart';

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
      this.isPlayingRecordedAudio = false,
      this.isVoicePlaying = false,
      this.showCollected = false,
      this.showExample = false,
      this.exampleText = '',
      this.showQuestionExample = false,
      this.showFail = false,
      this.newSentences = false,
      this.exampleArry = const [],
      this.challengeAnimated = false,
      this.seconds = 0,
      this.exampleAnimated = false,
      this.bubbleChallengeSentence,
      this.showNextBtn = true,
      this.activityCounter = 1,
      this.showQuizScreen = true,
      this.activityRoundCounter = 1,
      this.readyForNextActivity = true,
      this.showVideo = false,
      this.shortVideo,
      this.recordVoiceBusy = false,
      this.recordAudioPath = '',
      this.recordTemAudioPath = 'audio_0.mp3',
      this.audioCounter = 0,
      this.readyPlayRecordedAudioTicket = true,
      this.isLoading = false,
      this.blocker = false});

  List<Activity> activities;
  Activity? activity;
  int currentIndex;
  bool isRecording;
  bool isLoading;
  bool loadingNextActivity;
  bool showChallenge;
  bool hasAudioSaved;
  bool isPlayingRecordedAudio;
  bool isVoicePlaying;
  bool showCollected;
  bool showExample;
  String exampleText;
  bool showQuestionExample;
  List<Map> exampleArry;
  bool showFail;
  bool newSentences;
  bool challengeAnimated;
  bool exampleAnimated;
  int seconds;
  String? bubbleChallengeSentence;
  bool showNextBtn;
  int activityCounter;
  bool showQuizScreen;
  int activityRoundCounter;
  bool readyForNextActivity;
  bool showVideo;
  ShortVideo? shortVideo;
  bool recordVoiceBusy;
  String recordAudioPath;
  String recordTemAudioPath;
  int audioCounter;
  bool readyPlayRecordedAudioTicket;
  bool blocker;

  ChallengeStates challengeState;

  HomeState copyWith({
    activities,
    isRecording,
    isLoading,
    activity,
    currentIndex,
    loadingNextActivity,
    challengeState,
    showChallenge,
    isPlayingRecordedAudio,
    isVoicePlaying,
    showCollected,
    showExample,
    exampleText,
    showQuestionExample,
    showFail,
    exampleArry,
    newSentences,
    challengeAnimated,
    seconds,
    exampleAnimated,
    bubbleChallengeSentence,
    showNextBtn,
    activityCounter,
    showQuizScreen,
    activityRoundCounter,
    readyForNextActivity,
    showVideo,
    shortVideo,
    recordVoiceBusy,
    recordAudioPath,
    recordTemAudioPath,
    audioCounter,
    readyPlayRecordedAudioTicket,
    hasAudioSaved,
    blocker,
  }) {
    return HomeState(
      // activities: activities == null
      //     ? this.activities
      //     : [...this.activities, ...activities],
      activities: activities ?? this.activities,
      isRecording: isRecording ?? this.isRecording,
      isLoading: isLoading ?? this.isLoading,
      activity: activity ?? this.activity,
      currentIndex: currentIndex ?? this.currentIndex,
      loadingNextActivity: loadingNextActivity ?? this.loadingNextActivity,
      challengeState: challengeState ?? this.challengeState,
      showChallenge: showChallenge ?? this.showChallenge,
      hasAudioSaved: hasAudioSaved ?? this.hasAudioSaved,
      isPlayingRecordedAudio:
          isPlayingRecordedAudio ?? this.isPlayingRecordedAudio,
      isVoicePlaying: isVoicePlaying ?? this.isVoicePlaying,
      showCollected: showCollected ?? this.showCollected,
      showExample: showExample ?? this.showExample,
      exampleText: exampleText ?? this.exampleText,
      showQuestionExample: showQuestionExample ?? this.showQuestionExample,
      showFail: showFail ?? this.showFail,
      exampleArry: exampleArry ?? this.exampleArry,
      newSentences: newSentences ?? this.newSentences,
      challengeAnimated: challengeAnimated ?? this.challengeAnimated,
      seconds: seconds ?? this.seconds,
      exampleAnimated: exampleAnimated ?? this.exampleAnimated,
      bubbleChallengeSentence:
          bubbleChallengeSentence ?? this.bubbleChallengeSentence,
      showNextBtn: showNextBtn ?? this.showNextBtn,
      activityCounter: activityCounter ?? this.activityCounter,
      showQuizScreen: showQuizScreen ?? this.showQuizScreen,
      activityRoundCounter: activityRoundCounter ?? this.activityRoundCounter,
      readyForNextActivity: readyForNextActivity ?? this.readyForNextActivity,
      showVideo: showVideo ?? this.showVideo,
      shortVideo: shortVideo ?? this.shortVideo,
      recordVoiceBusy: recordVoiceBusy ?? this.recordVoiceBusy,
      recordAudioPath: recordAudioPath ?? this.recordAudioPath,
      recordTemAudioPath: recordTemAudioPath ?? this.recordTemAudioPath,
      audioCounter: audioCounter ?? this.audioCounter,
      readyPlayRecordedAudioTicket:
          readyPlayRecordedAudioTicket ?? this.readyPlayRecordedAudioTicket,
      blocker: blocker ?? this.blocker,
    );
  }
}

TextToSpeech tts = TextToSpeech();
final player = AudioPlayer();
final record = Record();
bool recordCompleted = false;
Timer? _timer;
List<Timer?> voiceTrackerList = [];
List<Timer?> audioTrackerList = [];
Timer? _timerAudio;
Timer? _timerVoice;
int currentExamplePlay = 0;

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier(this.activityRepository) : super(HomeState());

  bool micBlocked = false;
  ActivityRepository activityRepository;

  void toggleNewSentence() {
    state = state.copyWith(newSentences: true);
  }

  void toggleChallengeAnimated() async {
    state = state.copyWith(challengeAnimated: true);
    await sleep(1000);
    state = state.copyWith(challengeAnimated: false);
  }

  Future<bool> fetchActivities() async {
    state = state.copyWith(isLoading: true, showQuizScreen: false);

    final activities = await activityRepository.getActivities();

    if (activities.isEmpty) {
      state = state.copyWith(showQuizScreen: true, isLoading: false);
      return false;
    }

    state = state.copyWith(
        activityRoundCounter: state.activityRoundCounter + 1,
        activities: activities,
        activity: activities[0],
        isLoading: false);

    playVoice(state.activity!.question.voiceUrl, shouldStop: false);

    state = state.copyWith(isLoading: false);

    if (activities[0].sentence != null) {
      await sleep(1000);
      state = state.copyWith(showChallenge: true);
    }

    return true;
  }

  delayedPlayRecordedAudioTicket() async {
    state = state.copyWith(readyPlayRecordedAudioTicket: false);
    await sleep(500);
    state = state.copyWith(readyPlayRecordedAudioTicket: true);
  }

  delayedNextActivityTicket() async {
    state = state.copyWith(readyForNextActivity: false);
    await sleep(2050);
    state = state.copyWith(readyForNextActivity: true);
  }

  Future<Activity?> onNextActivity() async {
    delayedNextActivityTicket();
    stopVoice();

    state = state.copyWith(loadingNextActivity: true);
    delayedShowNextBtn();

    if (state.activityCounter == state.activities.length) {
      state = state.copyWith(
          loadingNextActivity: false,
          showQuizScreen: true,
          hasAudioSaved: false,
          currentIndex: 0,
          challengeState: ChallengeStates.instructions,
          activityCounter: 1);
      return null;
    }

    final index = state.currentIndex;

    state = state.copyWith(
        showExample: false,
        showChallenge: false,
        showQuestionExample: false,
        bubbleChallengeSentence: null,
        activityCounter: state.activityCounter + 1,
        challengeState: ChallengeStates.instructions,
        hasAudioSaved: false);

    state = state.copyWith(
      activity: state.activities[index + 1],
      currentIndex: index + 1,
    );

    if (state.activity!.question.type == QuestionType.teacher) {
      state = state.copyWith(challengeState: ChallengeStates.accepted);
    }

    await sleep(1000);
    state = state.copyWith(loadingNextActivity: false);
    playVoice(state.activity!.question.voiceUrl, shouldStop: false);

    await sleep(1000);
    state = state.copyWith(showChallenge: true);

    return state.activity;
  }

  void delayedShowNextBtn() async {
    state = state.copyWith(showNextBtn: false);
    await sleep(300);

    state = state.copyWith(showNextBtn: true);
  }

  void toggleRecording() async {
    if (state.recordVoiceBusy) return;
    recordVoiceBusyTracker();

    if (state.isRecording) {
      toggleFail();
      stopMic();
    } else {
      if (state.isVoicePlaying) {
        await stopVoice();
      }

      if (state.isPlayingRecordedAudio) {
        await stopPlayingRecordedAudio();
      }

      recordMic();
    }

    state = state.copyWith(isRecording: !state.isRecording);
  }

  void recordVoiceBusyTracker() async {
    state = state.copyWith(recordVoiceBusy: true);
    await sleep(1000);
    state = state.copyWith(recordVoiceBusy: false);
  }

  void toggleFail() async {
    // if(!state.hasAudioSaved) {
    state = state.copyWith(showFail: true);
    await sleep(2500);
    state = state.copyWith(showFail: false);
    // }
  }

  void onSentenceClicked(val, [sleepTime = 0]) async {
    state = state.copyWith(challengeState: val);
    if (sleepTime > 0) {
      await sleep(sleepTime);
      state = state.copyWith(showQuestionExample: true);

      if (val == ChallengeStates.accepted) {
        await sleep(300);
        state = state.copyWith(exampleAnimated: true);
        await sleep(600);
        state = state.copyWith(exampleAnimated: false);
      }
    }
  }

  void speak(String text, {double speed = 1.2}) async {
    if (text.isEmpty) return;
    tts.setVolume(1.0);
    tts.setRate(speed);
    tts.setPitch(1.0);
    tts.speak(text);
  }

  Future stopVoice() async {
    try {
      if (!state.isVoicePlaying) return;
      await player.stop();
      state = state.copyWith(isVoicePlaying: false);
    } catch (_) {}
  }

  playVoice(String url, {bool shouldStop = true}) async {
    try {
      if (state.isVoicePlaying) {
        await player.stop();
        state = state.copyWith(isVoicePlaying: false);
        if (_timerVoice != null) {
          _timerVoice!.cancel();
        }

        if (shouldStop) {
          return;
        }
      }

      final duration =
          Config.MOCK ? await player.setAsset(url) : await player.setUrl(url);
      _timerVoice = Timer(duration!, () {
        state = state.copyWith(isVoicePlaying: false);
      });

      state = state.copyWith(isVoicePlaying: true);
      await player.play();
    } catch (_) {}
  }

  void playRecordedAudio() async {
    try {
      if (!state.readyPlayRecordedAudioTicket) return;
      delayedPlayRecordedAudioTicket();

      if (state.isPlayingRecordedAudio) {
        await stopPlayingRecordedAudio();
      } else {
        state = state.copyWith(isPlayingRecordedAudio: true);

        _timerAudio = Timer(Duration(seconds: 20), () {
          state = state.copyWith(isPlayingRecordedAudio: false);
        });

        Directory appDocDir = await getApplicationDocumentsDirectory();
        String appDocPath = appDocDir.path;
        String audioPath = '$appDocPath/${state.recordAudioPath}}';
        // player.setFilePath(audioPath);
        // final duration=await player.setAsset('assets/a01.mp3');
        final duration = await player.setFilePath(audioPath);

        await player.play();
      }
    } catch (_) {
      state = state.copyWith(isPlayingRecordedAudio: false);
    }
  }

  Future stopPlayingRecordedAudio() async {
    await player.stop();
    state = state.copyWith(isPlayingRecordedAudio: false);
    if (_timerAudio != null) {
      _timerAudio!.cancel();
    }
    return;
  }

  void playAudio2() async {
    try {
      if (state.isPlayingRecordedAudio) {
        await player.stop();
        state = state.copyWith(isPlayingRecordedAudio: false);
        return;
      }

      state = state.copyWith(isPlayingRecordedAudio: true);

      Directory appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;
      String audioPath = '$appDocPath/my_voice.pm3';
      // player.setFilePath(audioPath);
      // final duration=await player.setAsset('assets/a01.mp3');
      final duration = await player.setFilePath(audioPath);

      await player.play();

      int currentIndex = audioTrackerList.length;

      audioTrackerList.add(Timer(duration!, () {
        int innerIdx = currentIndex;
        if (innerIdx + 1 == audioTrackerList.length) {
          state = state.copyWith(isPlayingRecordedAudio: false);
        }
      }));
    } catch (_) {
      state = state.copyWith(isPlayingRecordedAudio: false);
    }
  }

  void stopMic() async {
    if (await record.isRecording()) {
      if (_timer != null) {
        _timer!.cancel();
        state = state.copyWith(seconds: 0);
      }
      await record.stop();
    }
  }

  void recordMic() async {
    if (await record.hasPermission()) {
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;
      String audioPath = '$appDocPath/${state.recordTemAudioPath}}';

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
    _timer = Timer.periodic(Duration(seconds: 1), (timer) async {
      state = state.copyWith(seconds: state.seconds + 1);

      if (state.seconds == 4) {
        // toggleChallengeAnimated();
      }

      // if(state.seconds == 10) {
      //   toggleChallengeAnimated();
      // }

      if (state.seconds == 20) {
        recordCompleted = true;
        await record.stop();
        bool shouldHaveSavedAudio = state.isRecording ? true : false;
        state = state.copyWith(
            hasAudioSaved: false, isRecording: false, seconds: 0);
        stopMic();
        await sleep(500);
        state = state.copyWith(hasAudioSaved: shouldHaveSavedAudio);

        if (shouldHaveSavedAudio) {
          state = state.copyWith(
            recordAudioPath: state.recordTemAudioPath,
            audioCounter: state.audioCounter + 1,
            recordTemAudioPath: 'audio_${state.audioCounter + 1}.pm3',
          );
        }

        timer.cancel();
      }
    });
  }

  void toggleVideo(ShortVideo? video) async {
    if (state.showVideo) {
      state = state.copyWith(showVideo: false, shortVideo: null);
      return;
    }

    state = state.copyWith(showVideo: true, shortVideo: video);
  }

  void toggleExample() async {
    state = state.copyWith(showExample: !state.showExample);

    if (state.showExample) {
      currentExamplePlay++;
      final ex = state.activity!.example!;
      String sentence = state.activity!.sentence != null
          ? state.activity!.sentence!.sentence
          : '';
      _playExample(ex, currentExamplePlay, sentence);
      await player.setAsset(ex.voiceUrl);
      player.play();
    } else {
      player.stop();
      state = state.copyWith(showExample: false);
      currentExamplePlay++;
    }
  }

  void _playExample(Example ex, int index, String sentence) async {
    for (var i = 0; i < ex.example.length; i++) {
      if (index != currentExamplePlay) break;

      state = state.copyWith(
          exampleArry: _buildExample(ex.example[i]['text'], sentence));
      await sleep(ex.example[i]['duration']);
    }

    if (index != currentExamplePlay) return;
    state = state.copyWith(showExample: false);
  }

  void bubbleChallengeSentenceTrigger() {
    Sentence sentence = state.activity!.sentence!;
    bool isGroup = sentence.type == SentenceType.group;
    String sentenceText =
        isGroup ? getGroupRandomTail(sentence.extras!) : sentence.sentence;
    state = state.copyWith(bubbleChallengeSentence: sentenceText);
  }

  void toggleBlocker({int milliseconds = 800}) async {
    state = state.copyWith(blocker: true);
    await sleep(milliseconds);
    state = state.copyWith(blocker: false);
  }
}

List<Map> _buildExample(exampleText, String targetSentence) {
  final rr = exampleText.split(" ");

  List<Map> sentences = [];

  for (var elem in rr) {
    sentences.add({
      "text": elem,
      "highlight": (elem as String).toLowerCase().trim() ==
          targetSentence.toLowerCase().trim()
    });
  }

  List<Map> result = [
    {'text': '', 'highlight': false}
  ];
  bool prev = false;
  bool highlight = false;
  int index = 0;
  for (var elem in sentences) {
    if (elem['highlight']) {
      highlight = true;
    } else {
      highlight = false;
    }

    if (prev == highlight) {
      result[index]['text'] += ' ' + elem['text'];
      result[index]['highlight'] = highlight;
    } else {
      prev = highlight;
      index++;
      result.add({'text': '', 'highlight': false});

      result[index]['text'] += ' ' + elem['text'];
      result[index]['highlight'] = highlight;
    }
  }

  return result;
}

final homeProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  final activityRepository = ref.watch(activityRepositoryProvider);
  return HomeNotifier(activityRepository);
});
