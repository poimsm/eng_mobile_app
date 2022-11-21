import 'package:eng_mobile_app/config.dart';
import 'package:eng_mobile_app/data/models/activity.dart';
import 'package:eng_mobile_app/pages/QuizScreen.dart';
import 'package:eng_mobile_app/pages/audio_bar_white.dart';
import 'package:eng_mobile_app/pages/home/enums.dart';
import 'package:eng_mobile_app/pages/home/home_controller.dart';
import 'package:eng_mobile_app/pages/single_video.dart';
import 'package:eng_mobile_app/pages/word_list/enums.dart';
import 'package:eng_mobile_app/pages/word_list/word_list_controller.dart';
import 'package:eng_mobile_app/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:eng_mobile_app/routes/routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ConsumerState<HomePage> {
  Size size = Size.zero;
  List<Activity> acts = [];
  late HomeState homeState;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);

    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      systemNavigationBarColor: Colors.black,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    homeState = ref.watch(homeProvider);

    if (homeState.isLoading) {
      return Container(
          height: size.height,
          width: size.width,
          color: Colors.black,
          child: Center(
              child: SpinKitThreeBounce(
            color: Colors.white,
            size: 50.0,
          )));
    }

    if (homeState.showQuizScreen) {
      return SafeArea(
        child: QuizScreen(
          isWelcome: homeState.activityRoundCounter == 1,
          onCreateUser: () {},
          onStartQuiz: () {
            ref.read(homeProvider.notifier).retrieveActivities();
          },
          onAddWords: () {
            Navigator.pushNamed(context, Routes.WORD_LIST);
          },
        ),
      );
    }

    Widget contentPage = SafeArea(
      child: Stack(
        children: [
          SizedBox(
            height: size.height,
            width: size.width,
          ),

          if (!homeState.activity!.style.useGradient)
            Positioned(
              left: 0,
              top: size.height * homeState.activity!.style.imagePosition,
              child: _image(),
            ),
          Positioned(
            top: size.height * homeState.activity!.style.questionPosition,
            left: 0,
            child: _question(),
          ),
          if ([QuestionType.normal, QuestionType.describe]
                  .contains(homeState.activity!.question.type) &&
              homeState.activity!.word != null &&
              homeState.showChallenge)
            Positioned(
              left: 20,
              top: homeState.challengeState == ChallengeStates.accepted
                  ? 30
                  : 40,
              child: homeState.challengeState == ChallengeStates.accepted
                  ? _challengeAccepted()
                  : _challenge(),
            ),
          Positioned(
            left: 0,
            bottom: 10,
            child: _ctrlBtns(),
          ),
          if (homeState.isRecording &&
              homeState.challengeState == ChallengeStates.accepted)
            Positioned(
              left: size.width * 0.4,
              bottom: 120,
              child: _challengeBubble(),
            ),
          if (homeState.hasAudioSaved)
            Positioned(
              right: 20,
              top: size.height * 0.6,
              child: _audioBtn(),
            ),
          if (homeState.activity!.question.type == QuestionType.describe &&
              !homeState.isRecording)
            Positioned(
              right: 20,
              top: 20,
              child: _seeExampleBtn(),
            ),
          if (homeState.activity!.question.type == QuestionType.describe &&
              homeState.showExample)
            Positioned(
              right: 20,
              top: 20,
              child: _exampleExpanded(),
            ),
          if ([QuestionType.normal, QuestionType.teacher]
                  .contains(homeState.activity!.question.type) &&
              homeState.showQuestionExample &&
              !homeState.showExample)
            Positioned(
                left: 0,
                top: size.height * 0.63,
                child: SizedBox(
                  height: 70,
                  width: 150,
                  child: Center(
                    child: _seeExampleBtn(),
                  ),
                )),
          if ([QuestionType.normal, QuestionType.teacher]
                  .contains(homeState.activity!.question.type) &&
              homeState.showQuestionExample &&
              homeState.showExample)
            Positioned(
              left: 20,
              top: size.height * 0.65,
              child: _exampleExpanded(),
            ),
          if ([QuestionType.teacher]
              .contains(homeState.activity!.question.type))
            Positioned(
              right: 20,
              top: size.height * 0.03,
              child: _wordTeacher(),
            ),
          // Positioned(
          //   top: 10,
          //   left: 15,
          //   child: _progress(),
          // ),
          Positioned(
            bottom: size.height * 0.23,
            right: 15,
            child: _step(),
          ),
          if (homeState.showFail) _overlayFail(),
          if (homeState.showVideo)
            Positioned(
              top: 0,
              left: 0,
              child: SingleVideo(
                video: homeState.shortVideo!,
                onSaveWords: () {},
              ),
            ),
        ],
      ),
    );

    if (homeState.activity!.style.useGradient) {
      return Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: [0.1, 0.9],
              colors: [
                homeState.activity!.style.bottomGradientColor!.toColor(),
                homeState.activity!.style.topGradientColor!.toColor()
              ],
            ),
          ),
          child: contentPage);
    }

    return WillPopScope(
      onWillPop: () async {
        if (homeState.showVideo) {
          ref.read(homeProvider.notifier).toggleVideo(null);
          return false;
        }
        return true;
      },
      child: Container(
          height: size.height,
          width: size.width,
          color: homeState.activity!.style.backgroundScreen.toColor(),
          child: contentPage),
    );
  }

  _wordTeacher() {
    return InkWell(
      onTap: () {
        _presentActionSheet();
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white.withOpacity(0.8)),
        child: Text(
          'Pull off',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }

  _step() {
    return Transform.rotate(
      angle: 0.2,
      child: ClipPath(
        clipper: TrapeziumClipper(),
        child: Container(
          height: 50,
          width: 80,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
          ),
          child: Center(
            child: Text(
              '${homeState.activityCounter}/${homeState.activities.length}',
              style: TextStyle(
                  color: Colors.black.withOpacity(0.8),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  _progress() {
    return Stack(
      children: [
        Container(
          height: 15,
          width: 350,
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20)),
        ),
        Container(
          height: 15,
          width: 100,
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(20)),
        ),
      ],
    );
  }

  _overlayFail() {
    return Container(
      width: size.width,
      height: size.height,
      color: Colors.black.withOpacity(0.7),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/fail.png',
            width: 170,
          ),
          SizedBox(
            height: 20,
          ),
          RichText(
            textAlign: TextAlign.left,
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                    text: 'Must speak',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 19,
                    )),
                TextSpan(
                    text: ' 20',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    )),
                TextSpan(
                    text: ' seconds!',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 19,
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }

  _seeExampleBtn() {
    return InkWell(
      onTap: () {
        ref.read(homeProvider.notifier).toggleExample();
      },
      child: AnimatedContainer(
        curve: Curves.ease,
        duration: Duration(
          milliseconds: 400,
        ),
        padding: EdgeInsets.symmetric(
            vertical: homeState.exampleAnimated ? 13 : 10,
            horizontal: homeState.exampleAnimated ? 23 : 17),
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            borderRadius:
                BorderRadius.circular(homeState.exampleAnimated ? 12 : 10)),
        child: Text(
          'Example',
          style: TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.black54,
              fontSize: homeState.exampleAnimated ? 19 : 18),
        ),
      ),
    );
  }

  _exampleExpanded() {
    return SizedBox(
      width: size.width - 40,
      child: InkWell(
        onTap: () {
          ref.read(homeProvider.notifier).toggleExample();
        },
        child: Center(
          child: Container(
            width: size.width - 40,
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30)),
            child: RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                children: <TextSpan>[
                  ...List.generate(homeState.exampleArry.length, (int index) {
                    if (!homeState.exampleArry[index]['highlight']) {
                      return TextSpan(
                          text: homeState.exampleArry[index]['text'] +
                              (index == 0 ? '' : ' '),
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                          ));
                    }

                    return TextSpan(
                        text: homeState.exampleArry[index]['text'],
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 25,
                          fontWeight: FontWeight.normal,
                        ));
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _audioBtn() {
    return InkWell(
      onTap: () {
        ref.read(homeProvider.notifier).playRecordedAudio();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.black.withOpacity(0.3)),
        child: AudioBarWhite(playAnimation: homeState.isPlayingRecordedAudio),
      ),
    );
  }

  _challengeBubble() {
    Word word = homeState.activity!.word!;
    bool isGroup = word.type == WordType.group;
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 22),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
              color: Color(0xff44546A).withOpacity(1),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Color(0xff8497B0).withOpacity(0.4))),
          child: Text(
            homeState.bubbleChallengeWord!,
            // isGroup? getGroupRandomTail(word.group) : word.word,
            style: TextStyle(
              color: Colors.white,
              fontSize: isGroup ? 16 : 18,
            ),
          ),
        ),
        Positioned(
          left: 20,
          bottom: 0,
          child: RotatedBox(
              quarterTurns: 1,
              child:
                  Icon(Icons.play_arrow, size: 35, color: Color(0xff44546A))),
        )
      ],
    );
  }

  _challengeAccepted() {
    bool isGroup = homeState.activity!.word!.type == WordType.group;
    String wordText = '';
    if (isGroup) {
      wordText = getGroupShortTail(homeState.activity!.word!.extras!);
    } else {
      wordText = homeState.activity!.word!.word;
    }
    return InkWell(
      onTap: () {
        _presentActionSheet();
      },
      child: Container(
          width: size.width * 0.9,
          padding:
              EdgeInsets.symmetric(horizontal: isGroup ? 30 : 50, vertical: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: homeState.activity!.style.backgroundChallenge.toColor(),
          ),
          child: Column(
            children: [
              RichText(
                textAlign: TextAlign.left,
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: isGroup
                            ? 'Try to use these WORDS in your answer 👇'
                            : 'Try to use this WORD in your answer 👇',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 18,
                        )),
                  ],
                ),
              ),
              SizedBox(height: 20),
              AnimatedDefaultTextStyle(
                textAlign: TextAlign.center,
                child: Text(wordText),
                style: homeState.challengeAnimated
                    ? TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                      )
                    : TextStyle(
                        color: Colors.white,
                        // fontWeight: isGroup? FontWeight.w500 : FontWeight.normal,
                        fontSize: isGroup ? 23 : 24,
                      ),
                duration: Duration(milliseconds: 200),
              ),
            ],
          )),
    );
  }

  _challenge() {
    return InkWell(
      onTap: () {
        _presentActionSheet();
      },
      child: Container(
        height: 80,
        width: size.width * 0.9,
        padding: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: homeState.activity!.style.backgroundChallenge.toColor(),
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            '  Challenge Me❕',
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Icon(Icons.play_arrow, size: 30, color: Colors.white)
        ]),
      ),
    );
  }

  _image() {
    final act = homeState.activity!;
    return SizedBox(
      height: size.height * 0.7,
      width: size.width,
      child: Center(
        child: Stack(
          children: [
            Config.MOCK
                ? Image.asset(
                    act.question.imageUrl,
                    width: size.width,
                    fit: BoxFit.cover,
                  )
                : Image.network(
                    act.question.imageUrl,
                    width: size.width,
                    fit: BoxFit.cover,
                  )
          ],
        ),
      ),
    );
  }

  _question() {
    Activity activity = homeState.activity!;

    Widget question;

    if (activity.question.type == QuestionType.teacher) {
      List<String> questionList = activity.question.question.split("[word]");
      question = Container(
        color: Colors.black.withOpacity(activity.style.questionOpacity),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
        width: size.width,
        child: homeState.loadingNextActivity
            ? SpinKitThreeBounce(
                color: Colors.white,
                size: 35.0,
              )
            : RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: questionList[0],
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: activity.style.questionFontSize,
                        )),
                    TextSpan(
                        text: questionList[1],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: activity.style.questionFontSize + 4,
                          fontWeight: FontWeight.bold,
                        )),
                    TextSpan(
                        text: questionList[2],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: activity.style.questionFontSize,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              ),
      );
    } else {
      question = Container(
          color: Colors.black.withOpacity(activity.style.questionOpacity),
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
          width: size.width,
          child: homeState.loadingNextActivity
              ? SpinKitThreeBounce(
                  color: Colors.white,
                  size: 35.0,
                )
              : Text(
                  activity.question.question,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: activity.style.questionFontSize,
                      overflow: TextOverflow.clip),
                ));
    }

    return question;
  }

  _ctrlBtns() {
    return SizedBox(
      width: size.width,
      height: size.height * 0.15,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        _myWordsBtn(),
        homeState.isRecording ? _stopBtn() : _micBtn(),
        _onNextBtn(),
      ]),
    );
  }

  _myWordsBtn() {
    return Stack(
      children: [
        SizedBox(
          height: 80,
          width: 70,
          child: Center(
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, Routes.WORD_LIST);
              },
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black.withOpacity(0.2),
                ),
                child: Icon(Icons.add, size: 40, color: Colors.white),
                // child: Image.asset('assets/user_14.png', width: 45),
                // child: Icon(LineIcons.stream, color: Colors.white, size: 40),
              ),
            ),
          ),
        ),
        if (homeState.newWords)
          Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration:
                    BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                child: Text(
                  '5',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 14),
                ),
              ))
      ],
    );
  }

  _onNextBtn() {
    if (!homeState.showNextBtn) {
      return SizedBox(
        height: 50,
        width: 56,
      );
    }
    return InkWell(
      onTap: () async {
        if (!homeState.readyForNextActivity) return;

        bool acceptedChallenge =
            homeState.challengeState == ChallengeStates.accepted;

        final activity = await ref.read(homeProvider.notifier).onNextActivity();

        int idx = homeState.currentIndex + (activity == null ? 0 : -1);
        Activity lastActivity = homeState.activities[idx];
        Word? word = acceptedChallenge ? lastActivity.word : null;

        ref
            .read(wordListProvider.notifier)
            .addHistory(question: lastActivity.question, word: word);
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black.withOpacity(0.2),
        ),
        child: Icon(Icons.chevron_right, color: Colors.white, size: 45),
      ),
    );
  }

  _micBtn() {
    return InkWell(
      onTap: () {
        ref.read(homeProvider.notifier).toggleRecording();
        ref.read(homeProvider.notifier).bubbleChallengeWordTrigger();
      },
      child: Container(
        padding: EdgeInsets.all(homeState.isRecording ? 27 : 12),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color:
              Color(0xff8D57FF).withOpacity(homeState.isRecording ? 0.65 : 0.8),
        ),
        child: Icon(homeState.isRecording ? Icons.stop_circle : Icons.mic,
            color: Colors.white, size: homeState.isRecording ? 40 : 70),
      ),
    );
  }

  _stopBtn() {
    return InkWell(
      onTap: () {
        ref.read(homeProvider.notifier).toggleRecording();
      },
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Color(0xff8D57FF).withOpacity(0.9),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                homeState.seconds.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Container(
              height: 70,
              width: 1,
              color: Colors.white.withOpacity(0.1),
            ),
            SizedBox(
              width: 5,
            ),
            Icon(Icons.stop_circle, color: Colors.white, size: 70),
          ],
        ),
      ),
    );
  }

  void _presentActionSheet() async {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (context) {
          ChallengeStates state = ChallengeStates.instructions;
          double speed = 1.2;

          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            acceptChallenge() {
              return homeState.challengeState == ChallengeStates.accepted
                  ? Container()
                  : InkWell(
                      onTap: () {
                        if (homeState.challengeState ==
                            ChallengeStates.accepted) return;
                        ref
                            .read(homeProvider.notifier)
                            .onWordClicked(ChallengeStates.accepted, 1500);
                        ref
                            .read(homeProvider.notifier)
                            .speak('Challenge accepted!');
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 70,
                        margin: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xff6E5AA0).withOpacity(1),
                        ),
                        child: Center(
                          child: Text(
                            'Accept',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    );
            }

            infoBoxWord(Size size) {
              String msg = '';

              Activity act = homeState.activity!;
              bool isGroup = act.word!.type == WordType.group;

              if (state == ChallengeStates.instructions) {
                msg = homeState.activity!.word!.word;
              }

              if (state == ChallengeStates.meaning) {
                if (act.word!.sourceType == SourceType.infoCard) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50)),
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: SizedBox(
                          width: 350,
                          height: 350,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Config.MOCK
                                  ? Image.asset(act.word!.infoCard!.imageUrl)
                                  : Image.network(
                                      act.word!.infoCard!.imageUrl))),
                    ),
                  );
                }

                if (act.word!.sourceType == SourceType.shortVideo) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50)),
                    child: Column(
                      children: [
                        SizedBox(height: 25, width: size.width),
                        RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' SOLUTION: ',
                                  style: TextStyle(
                                    color: Colors.black45,
                                    fontSize: 17,
                                  )),
                              TextSpan(
                                  text: 'Very empty',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 23,
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Config.MOCK
                                  ? Image.asset(
                                      act.word!.shortVideo!.cover,
                                      width: size.width * 0.65,
                                      height: size.width * 1,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.network(
                                      act.word!.shortVideo!.cover,
                                      width: size.width * 0.65,
                                      height: size.width * 1,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                            Positioned(
                              child: Container(
                                width: size.width * 0.65,
                                height: size.width * 1,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black.withOpacity(0.2),
                                ),
                                child: Center(
                                  child: InkWell(
                                    onTap: () {
                                      ref
                                          .read(homeProvider.notifier)
                                          .toggleVideo(act.word!.shortVideo);
                                      Navigator.pop(context);
                                      // showVideo = true;
                                      // setState(() {});
                                    },
                                    child: Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.9),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          Icons.play_arrow,
                                          size: 50,
                                          color: Color(0xff727272),
                                        )),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  );
                }

                if (isGroup) {
                  msg = getGroupHead(act.word!.extras!);
                } else {
                  msg = act.word!.meaning!;
                }
              }

              return InkWell(
                onTap: () {
                  if (state == ChallengeStates.meaning) {
                    Navigator.pop(context);
                  }
                },
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 40, horizontal: 30),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (state == ChallengeStates.instructions)
                          SizedBox(
                            width: size.width * 0.7,
                            child: RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: isGroup
                                          ? 'Try to use these'
                                          : 'Try to use this',
                                      style: TextStyle(
                                        color: Color(0xff555555),
                                        fontWeight: FontWeight.normal,
                                        fontSize: 18,
                                      )),
                                  TextSpan(
                                      text: isGroup ? ' WORDS' : ' WORD',
                                      style: TextStyle(
                                        color: Color(0xff444444),
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal,
                                      )),
                                  TextSpan(
                                      text: ' in your answer',
                                      style: TextStyle(
                                        color: Color(0xff555555),
                                        fontWeight: FontWeight.normal,
                                        fontSize: 18,
                                      )),
                                  TextSpan(
                                      text: ' 👇',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 18,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        if (state == ChallengeStates.meaning)
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(bottom: 10),
                            child: Text(
                              'SOLUTION:',
                              style: TextStyle(
                                  fontSize: 16, color: Color(0xff777777)),
                            ),
                          ),
                        if (state != ChallengeStates.example)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(),
                              SizedBox(
                                width: size.width *
                                    (state == ChallengeStates.meaning
                                        ? 0.7
                                        : 0.5),
                                child: isGroup &&
                                        state != ChallengeStates.meaning
                                    ? Column(children: [
                                        SizedBox(
                                          height: 20,
                                        ),
                                        ...List.generate(
                                            getGroupTailList(homeState
                                                    .activity!.word!.extras!)
                                                .length, (i) {
                                          if (i > 3) {
                                            return Container();
                                          }

                                          return Text(
                                            getGroupTailList(homeState
                                                .activity!.word!.extras!)[i],
                                            style: TextStyle(fontSize: 22),
                                          );
                                        }),
                                        SizedBox(
                                          height: 20,
                                        )
                                      ])
                                    : Text(
                                        msg,
                                        textAlign:
                                            state == ChallengeStates.meaning
                                                ? TextAlign.left
                                                : TextAlign.center,
                                        style: TextStyle(
                                            fontSize:
                                                state == ChallengeStates.meaning
                                                    ? 22
                                                    : msg.length > 10
                                                        ? 24
                                                        : 26,
                                            color:
                                                state == ChallengeStates.example
                                                    ? Color(0xff6E5AA0)
                                                    : Colors.black87),
                                      ),
                              ),
                              if (state == ChallengeStates.meaning) Container(),
                              if (state != ChallengeStates.meaning)
                                Material(
                                  child: Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          ref
                                              .read(homeProvider.notifier)
                                              .speak(msg, speed: speed);

                                          if (speed == 0.5) {
                                            speed = 1.2;
                                          } else {
                                            speed = 0.5;
                                          }
                                        },
                                        child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 8),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black26),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Icon(
                                                Icons.volume_down_outlined,
                                                size: 30,
                                                color: Colors.black45)),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          state = ChallengeStates.meaning;
                                          setState(() {});
                                        },
                                        child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 8),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black26),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Icon(Icons.lightbulb_outline,
                                                size: 30,
                                                color: Colors.black45)),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        if (state == ChallengeStates.instructions)
                          acceptChallenge(),
                      ],
                    )),
              );
            }

            wordSheet() {
              return Container(
                  width: size.width,
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    infoBoxWord(size),
                  ]));
            }

            return wordSheet();
          });
        });
  }
}

class TrapeziumClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double radius = 10;
    double pi = 3.141516;

    Path path = Path()
      ..lineTo(size.width * 0.93 - radius, 0)
      ..arcTo(
          Rect.fromCircle(
              center: Offset(size.width * 0.93 - radius, radius),
              radius: radius),
          1.5 * pi,
          0.5 * pi,
          true)
      ..lineTo(size.width, size.height - radius)
      ..arcTo(
          Rect.fromCircle(
              center: Offset(size.width - radius, size.height - radius),
              radius: radius),
          0,
          0.5 * pi,
          false)
      ..lineTo(radius * 1.5, size.height)
      ..arcTo(
          Rect.fromCircle(
              center: Offset(radius * 1.5, size.height - radius),
              radius: radius),
          0.5 * pi,
          0.5 * pi,
          false)
      ..lineTo(0, radius)
      ..arcTo(Rect.fromCircle(center: Offset(radius, radius), radius: radius),
          1 * pi, 0.5 * pi, false)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(TrapeziumClipper oldClipper) => false;
}

extension ColorExtension on String {
  toColor() {
    var hexColor = this.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}
