import 'dart:async';

import 'package:eng_mobile_app/pages/home/enums.dart';
import 'package:eng_mobile_app/pages/home/home_controller.dart';
import 'package:eng_mobile_app/pages/progress_bar.dart';
import 'package:eng_mobile_app/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:eng_mobile_app/routes/routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../data/models/activity.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ConsumerState<HomePage> {
  // String imageUrl =
  //     'https://i.pinimg.com/564x/29/2b/a2/292ba2025c0b8ff9b77e35d0f5a0509e.jpg';
  // String question = 'Hello world how are you being doing today morning?';
  Size size = Size.zero;
  // bool isRecording = false;
  // bool isLoading = false;

  List<Activity> acts = [];

  late HomeState homeState;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    ref.read(homeProvider.notifier).retrieveActivities();
  }

  @override
  Widget build(BuildContext context) {
    print('build <---');
    // final counter = ref.watch(homeProvider); 0xff726396
    size = MediaQuery.of(context).size;
    homeState = ref.watch(homeProvider);
    return Container(
        height: size.height,
        width: size.width,
        color: homeState.isLoading ? Colors.black : homeState.activity!.style.backgroundScreen.toColor(),
        child: homeState.isLoading
            ? _loader()
            : SafeArea(
                child: Stack(
                  children: [
                    SizedBox(
                      height: size.height,
                      width: size.width,
                    ),
                    // Text('${counter.isLoading} HEEEEEY'),
                    // if(false)_loadingBar(),
                    // _image(),
                    if (homeState.isRecording)
                      Positioned(
                        right: 0,
                        top: 10,
                        child: ProgressBar(),
                        // child: _loadingBar(),
                      ),
                    if (!homeState.isRecording && false)
                      Positioned(
                        right: 20,
                        top: 20,
                        child: _avatar(),
                      ),
                    Positioned(
                      left: 0,
                      top: size.height * 0.1,
                      child: _image(),
                    ),
                    Positioned(
                      top: size.height * 0.35,
                      left: 0,
                      child: _question(),
                    ),
                    if (!homeState.isRecording && homeState.activity!.word != null && homeState.showChallenge)
                      Positioned(
                        left: 20,
                        top: 40,
                        child: _challenge(),
                      ),
                    if (false)
                      Positioned(
                        top: size.height * 0.65,
                        right: 10,
                        // top: 20,
                        // right: 20,
                        child: _example(),
                      ),
                    Positioned(
                      left: 0,
                      bottom: 10,
                      child: _ctrlBtns(),
                    ),
                    if(homeState.isRecording && homeState.challengeState == ChallengeStates.accepted)Positioned(
                      left: size.width*0.4,
                      bottom: 120,
                      child: _challengeWord(),
                    ),
                    if(homeState.hasAudioSaved)Positioned(
                      right: 20,
                      top: size.height*0.6,
                      child: _audioBtn(),
                    )
                  ],
                ),
              ));
  }

  _loader() {
    return Center(
        child: SpinKitDualRing(
      color: Colors.white,
      size: 50.0,
    ));
  }

  _audioBtn() {
    return InkWell(
      onTap: () {
        ref.read(homeProvider.notifier).playAudio();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        // padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          // shape: BoxShape.circle,
          color: Colors.black.withOpacity(0.3)
        ),
        child: Image.asset('assets/audio.png', width: 35, color: Colors.white),
      ),
    );
  }

  _challengeWord() {
    return Stack(
      children: [
        // SizedBox(),
        Container(
          margin: EdgeInsets.only(bottom: 22),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
            color: Color(0xff44546A).withOpacity(1),
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Color(0xff8497B0))
          ),
          child: Text(homeState.activity!.word!.word, style: TextStyle(
            color: Colors.white,
            fontSize: 18,        
          ),),
        ),
        Positioned(
          left: 20,
          bottom: 0,
          child: RotatedBox(
            quarterTurns: 1,
            child: Icon(Icons.play_arrow, size: 35, color: Color(0xff44546A))),
        )
      ],
    );
  }

  _challenge() {
    final accepted = homeState.challengeState == ChallengeStates.accepted;
    return InkWell(
      onTap: () {
        // print(homeState.activity!.word!.toJson());
        _presentActionSheet();
        // Navigator.pushNamed(context, Routes.CHALLENGE);
      },
      child: Container(
        height: 80,
        width: size.width * 0.9,
        padding: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          // color: Color(0xff44546A),
          color: homeState.activity!.style.backgroundWord.toColor(),

          // boxShadow: [
          //           BoxShadow(
          //             color: Color.fromARGB(255, 214, 34, 34).withOpacity(0.6),
          //             blurRadius: 6.0,
          //             spreadRadius: 0.0,
          //             offset: Offset(
          //               0.0,
          //               3.0,
          //             ),
          //           ),
          //         ]
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            accepted ? '  ${homeState.activity!.word!.word}' : '  #Challenge',
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),

          accepted ?
          
          Image.asset('assets/check.png', width: 50, color: Colors.white) :
          Icon(Icons.play_arrow, size: 30, color: Colors.white)
        ]),
      ),
    );
  }

  _avatar() {
    return Image.asset(
      'assets/user.png',
      width: 60,
    );
  }

  _example() {
    // final counter = ref.watch(homeProvider);
    // final notifier = ref.read(homeProvider.notifier);
    return InkWell(
      onTap: () {
        // notifier.re('New Bye');
      },
      child: Container(
        // width: size.width*0.8,
        height: 60,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.orangeAccent),
        child: Row(
          children: [
            // 🎧 Example Icon(Icons.learn, size: 35, color: Colors.white),
            Text('{counter.name}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20)),
          ],
        ),
      ),
    );
  }

  _example2() {
    return Container(
      width: size.width * 0.8,
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.black.withOpacity(0.4)),
      child: Row(
        children: [
          Text('Example',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20)),
          Icon(Icons.chevron_right, size: 35, color: Colors.white)
        ],
      ),
    );
  }

  _question() {
    // final isLoading = ref.watch(homeProvider.select((state) => state.isLoading));
    Activity activity = homeState.activity!;
    String msg = activity.type == 'question'
        ? activity.question!.question
        : 'Describe the picture!';

    return Container(
        color: Colors.black.withOpacity(0.4),
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        width: size.width,
        child: homeState.loadingNextActivity?  SpinKitThreeBounce(
  color: Colors.white,
  size: 35.0,
): Text(
          msg,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              overflow: TextOverflow.clip),
        ));
  }

  _loadingBar() {
    print('_loadingBar <---');
    return Container(
      padding: EdgeInsets.only(
          left: size.width * 0.01, right: size.width * 0.01, top: 10),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12)),
          height: 40,
          width: size.width * 0.98,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(12)),
                height: 40,
                width: 150,
              ),
            ],
          )),
    );
  }

  _image() {
    print('_image <---');
    // final isLoading = ref.watch(homeProvider.select((state) => state.isLoading));
    final act = homeState.activity!;
    final isQuestion = act.type == 'question';
    final imageUrl = isQuestion ? act.question!.imageUrl : act.imageActivity!.imageUrl;
    return SizedBox(
      height: size.height * 0.7,
      width: size.width,
      child: Center(
        child: Stack(
          children: [
            Image.network(
              imageUrl,
              width: size.width,
              fit: BoxFit.cover,
            ),
            // if(true) Positioned(
            //   top: 240,
            //   child: Container(
            //     color: Colors.black.withOpacity(0.5),
            //     padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            //     width: size.width,
            //     child: Text(question, style: const TextStyle(
            //       color: Colors.white,
            //       fontWeight: FontWeight.bold,
            //       fontSize: 18,
            //       overflow: TextOverflow.clip
            //     ),)
            //   ),
            // )
          ],
        ),
      ),
    );
  }

  _ctrlBtns() {
    return 
    Container(
      width: size.width,
      height: size.height * 0.15,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        _myWordsBtn(),
        _micBtn(),
        _onNextBtn(),
      ]),
    );
  }

  _myWordsBtn() {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.WORD_LIST);
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black.withOpacity(0.2),
        ),
        child: Icon(Icons.water, color: Colors.white, size: 40),
      ),
    );
  }

  _onNextBtn() {
    return InkWell(
      onTap: () {
        // ref.read(homeProvider.notifier).playAudio();
        ref.read(homeProvider.notifier).onNextActivity();
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black.withOpacity(0.2),
        ),
        child: Icon(Icons.chevron_right, color: Colors.white, size: 40),
      ),
    );
  }

  _micBtn() {
    return InkWell(
      onTap: () {
        print('onTapDown');
        ref.read(homeProvider.notifier).toggleRecording();
        // ref.read(homeProvider.notifier).playAudio();
        // ref.read(homeProvider.notifier).recordMic();

        // ref.read(homeProvider.notifier).speaplayAudiok('heeey');
        // isRecording = true;        
        // setState(() {});
      },
      child: Container(
        padding: EdgeInsets.all(homeState.isRecording ? 27 : 12),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          // borderRadius: BorderRadius.circular(30),
          color: Color(0xff8D57FF).withOpacity(homeState.isRecording ? 0.65 : 0.8),
        ),
        child: Icon(homeState.isRecording ? Icons.pause : Icons.mic, color: Colors.white, size: homeState.isRecording ? 40 : 70),
      ),
    );
  }



  void _presentActionSheet() async {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {

          ChallengeStates state = ChallengeStates.instructions;
          List<Map> example = [
              {
                'text': 'Hello this is me oscar the great!',
                'duration': 3000,
              },
              {
                'text': "I live in the city of hello Valdivia but I'm from",
                'duration': 5000,
              },
              {
                'text': 'a small island called Mancera. This has a fortres!',
                'duration': 5000,
              }
            ];

            String example_voice = '''
            Hello this is me oscar the great!
            Hmmm I live in the city of hello Valdivia but I'm from
            a small island called Mancera. This has a fortres!
            ''';

            String exampleExtract = '';

            List<Map> words = [];

            // bool closed = false;

            // readExample();
        return StatefulBuilder(
          
          
          builder: (BuildContext context, StateSetter setState) {

            _wordList() {
            return List.generate(words.length, (i) {
              return TextSpan(
                  text: ' ' + words[i]['text'],
                  style: TextStyle(
                    color: Color(0xff6E5AA0),
                    fontWeight: words[i]['bold'] ? FontWeight.bold : FontWeight.normal,
                    fontSize: words[i]['bold'] ? 24 : 21,
                  ));
            });
          }

          _generateWords(String text, String keyword) {
            words = [];            
            // RegExp exp = RegExp(r'(\w+)');
            // Iterable<RegExpMatch> matches = exp.allMatches(text);
            // final matches = exp.allMatches(text).map((z) => z.group(0)).toList();

            List<String> matches = text.split(' ');
            for (final m in matches) {
              Map word = {
                'bold': m.toLowerCase() == keyword.toLowerCase() ? true : false,
                'text': m
              };

              words.add(word);              
            }
          }



_infoBoxWord(Size size) {

  String msg = '';

  if(state == ChallengeStates.instructions) {
    msg= homeState.activity!.word!.word;
  }

  if(state == ChallengeStates.meaning) {
    msg= homeState.activity!.word!.meaning!;
  }

  if(state == ChallengeStates.example) {
    msg= exampleExtract;
  }

  return Container(
            padding: EdgeInsets.symmetric(vertical:40, horizontal: 60),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                if(state == ChallengeStates.instructions) Text('Try to use this word in your answer 👇', style: TextStyle(
                  fontSize: 18,
                  color: Color(0xff555555)
                ),),

                if(state == ChallengeStates.meaning) SizedBox(
                  width: double.infinity,
                  child: Text('MEANING:', style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff777777)
                  ),),
                ), 
               
                if(state == ChallengeStates.example) Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('EXAMPLE', style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff777777)
                  ),),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      // shape: BoxShape.circle,
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey.withOpacity(0.1)
                    ),
                    child: Icon(Icons.pause, color: Color(0xff9889BD), size: 25))
                  ],
                ),                              
                SizedBox(height: 25,),
                if(state != ChallengeStates.example)Text(msg, textAlign: TextAlign.center, style: TextStyle(
                        fontSize: state == ChallengeStates.example? 24 : 26,
                        color: state == ChallengeStates.example? Color(0xff6E5AA0): Colors.black87
                      ),),

                if(state == ChallengeStates.example)RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: _wordList())),
                      SizedBox(
                    height: 20,
                  ),

                SizedBox(height: 35,),

                if(state == ChallengeStates.instructions) InkWell(
                  onTap: () async {
                    state = ChallengeStates.example;
                    // example_voice
                    ref.read(homeProvider.notifier).speak(example_voice);
                    for (var el in example) {
                      exampleExtract = el['text'];
                      _generateWords(el['text'], 'hello');
                      // if(!closed) {
                      //   setState(() {});
                      // }
                      try {
                        setState(() {});
                      } catch(_){

                      }
                      await sleep(el['duration']);
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                    child: Text('EXAMPLE', textAlign: TextAlign.center, style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff6E5AA0),
                            fontWeight: FontWeight.normal
                          ),),
                  ),
                ),
              ],
            )
          );
}

_meaningBtn() {
          return InkWell(
            onTap: () {
              state = ChallengeStates.meaning;
              setState(() {});
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white,),
                borderRadius: BorderRadius.circular(5)
              ),
              child: Text('MEANING', style: TextStyle(
                color: Colors.white,
                fontSize: 15
              ),),
            ),
          );
        }
        _header() {
          return Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Row(children: [
                Text('#Challenge:', style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 16,
                ),),
                SizedBox(width: 5,),
                Text('Everything', style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                  fontSize: 16,
                ),),
              ],),
              if(homeState.activity!.word!.meaning != null)_meaningBtn()
            ],),
          );
        }

        

             _wordSheet() {
    return Container(
        width: size.width,
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(20),
        //   color: Colors.white
        // ),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          _header(),
          SizedBox(height: 6,),
          // if(state == ChallengeStates.instructions) _infoBoxWord(size),
          _infoBoxWord(size),
          // _infoBoxMeaning(size),
          // if(wordStep == WordActionStep.meaning) _infoBoxMeaning(size),
          // if(state == ChallengeStates.example) _infoBoxExample(size),

          InkWell(
            onTap: () {
              ref.read(homeProvider.notifier).onWordClicked(ChallengeStates.accepted);
              ref.read(homeProvider.notifier).speak('Challenge accepted!');
              Navigator.pop(context);
            },
            child: Container(
              height: 70,
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xff6E5AA0),
              ),
              child: Center(
                child: Text(
                  'Accept challenge',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ]));
  }


            return _wordSheet();
          }
        );
  });
  }}


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
