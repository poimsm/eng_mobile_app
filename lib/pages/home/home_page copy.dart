import 'package:eng_mobile_app/pages/home/enums.dart';
import 'package:eng_mobile_app/pages/home/home_controller.dart';
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

  late HomeState state;

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
    state = ref.watch(homeProvider);
    return Container(
        height: size.height,
        width: size.width,
        color: state.isLoading ? Colors.black : state.activity!.design.backgroundColor.toColor(),
        child: state.isLoading
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
                    if (state.isRecording)
                      Positioned(
                        right: 0,
                        top: 10,
                        child: _loadingBar(),
                      ),
                    if (!state.isRecording && false)
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
                    if (!state.isRecording && state.activity!.word != null && state.showChallenge)
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

  _challenge() {
    return InkWell(
      onTap: () {
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
          color: state.activity!.design.wordBackgroundColor.toColor(),

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
            '  ${state.activity!.word!.word}',
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
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
    print('_question <-----');
    // final isLoading = ref.watch(homeProvider.select((state) => state.isLoading));
    Activity activity = state.activity!;
    String msg = activity.type == 'question'
        ? activity.question!.question
        : 'Describe the picture!';
    return Container(
        color: Colors.black.withOpacity(0.4),
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        width: size.width,
        child: state.loadingNextActivity?  SpinKitThreeBounce(
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
    final act = state.activity!;
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
    return Container(
      // color: Colors.yellow,
      width: size.width,
      height: size.height * 0.15,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        _myWordsBtn(),
        // Container(
        //   padding: EdgeInsets.only(bottom: 80),
        //   child: _micBtn(),
        // ),
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
      onTapDown: (_) {
        ref.read(homeProvider.notifier).startRecording();
        // isRecording = true;
        print('onTapDown');
        // setState(() {});
      },
      onTapUp: (_) {
        ref.read(homeProvider.notifier).stopRecording();
        // isRecording = false;
        print('onTapUp');
        // setState(() {});
      },
      onTapCancel: () {
        ref.read(homeProvider.notifier).stopRecording();
        // isRecording = false;
        // setState(() {});
        print('onTapCancel');
      },
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          // borderRadius: BorderRadius.circular(30),
          color: Color(0xff8D57FF).withOpacity(state.isRecording ? 0.65 : 0.8),
        ),
        child: Icon(Icons.mic, color: Colors.white, size: 70),
      ),
    );
  }

  void _presentActionSheet() async {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {

          WordActionStep wordStep = WordActionStep.word;
        return StatefulBuilder(
          
          
          builder: (BuildContext context, StateSetter setState) {

            _infoBoxExample(Size size) {
  return Container(
            // width: size.width*0.96,
            padding: EdgeInsets.symmetric(vertical:20, horizontal: 30),
            height: 220,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Stack(
              children: [
                SizedBox(),
                // Text('Try to use this word in your answer 👇', style: TextStyle(
                //   fontSize: 19,
                //   color: Color(0xff555555)
                // ),),
                // Text('MEANING:', style: TextStyle(
                //   fontSize: 18,
                //   color: Color(0xff777777)
                // ),),
                Container(
                    width: size.width - 80,
                    height: 220,
                    padding: EdgeInsets.only(top: 20),
                    child: Center(
                      child: Text('Speeding Up in the morning after today', textAlign: TextAlign.center, style: TextStyle(
                        fontSize: 24,
                        color: Color(0xff6E5AA0)
                      ),),
                    ),
                  ),
                // Positioned(
                //   top: 50,
                //   child: Container(
                //     width: size.width - 120,
                //     height: 100,
                //     child: Center(
                //       child: Text('Speeding Up in the morning after today', textAlign: TextAlign.center, style: TextStyle(
                //         fontSize: 24,
                //         color: Color(0xff6E5AA0)
                //       ),),
                //     ),
                //   ),
                // ),
                Positioned(
                  top: 10,
                  left: 0,
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.05),
                          shape: BoxShape.circle
                        ),
                        child: Icon(Icons.pause, size: 30, color: Colors.black.withOpacity(0.35))
                        ),
                        SizedBox(width: 15),
                        Text('EXAMPLE', style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff777777)
                        ),),
                    ],
                  ),
                ),
              ],
            )
          );
}

_infoBoxMeaning(Size size) {
  return Container(
            // width: size.width*0.96,
            padding: EdgeInsets.symmetric(vertical:30, horizontal: 50),
            height: 220,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Stack(
              children: [
                Text('MEANING', style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff777777)
                ),),
                Positioned(
                  top: 40,
                  child: Container(
                    width: size.width - 120,
                    height: 100,
                    child: Center(
                      child: Text('Speeding Up in', textAlign: TextAlign.center, style: TextStyle(
                        fontSize: 24,
                        color: Color(0xff6E5AA0)
                      ),),
                    ),
                  ),
                ),
              ],
            )
          );
}

_infoBoxWord(Size size) {
  return Container(
            // width: size.width*0.96,
            padding: EdgeInsets.symmetric(vertical:30, horizontal: 50),
            height: 220,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Stack(
              children: [
                Text('Try to use this word in your answer 👇', style: TextStyle(
                  fontSize: 19,
                  color: Color(0xff555555)
                ),),
                // Text('MEANING:', style: TextStyle(
                //   fontSize: 18,
                //   color: Color(0xff777777)
                // ),),
                Positioned(
                  top: 50,
                  child: Container(
                    width: size.width - 120,
                    height: 100,
                    child: Center(
                      child: Text('Speeding Up', textAlign: TextAlign.center, style: TextStyle(
                        fontSize: 24,
                        color: Color(0xff6E5AA0)
                      ),),
                    ),
                  ),
                ),
              ],
            )
          );
}

             _wordSheet() {
    return Container(
        width: size.width,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          if(wordStep == WordActionStep.word) _infoBoxWord(size),
          if(wordStep == WordActionStep.meaning) _infoBoxMeaning(size),
          if(wordStep == WordActionStep.example) _infoBoxExample(size),
          // SizedBox(height: 10),
          if(wordStep != WordActionStep.meaning)InkWell(
            onTap: () {
              // Navigator.pop(context);

              if(wordStep == WordActionStep.word) {
                wordStep = WordActionStep.meaning;
                setState(() {});
              } else {
                Navigator.pop(context);
              }              
              
              // ref.read(homeProvider.notifier).onWordClicked(WordActionStep.meaning);
            },
            child: Container(
              // width: size.width*0.9,
              margin: EdgeInsets.only(top: 10),
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                // color: Colors.white,
                // border: Border.all(color: Color(0xff44546A), width: wordStep == WordActionStep.example? 3 : 0)
                // color: wordStep == WordActionStep.example ? Colors.black.withOpacity(0.1) :Colors.white,
                color: wordStep == WordActionStep.example ? Color(0xff6E5AA0) :Colors.white,
              ),
              child: Center(
                child: Text(
                  wordStep == WordActionStep.example ? 'Meaning' : 'Meaning',
                  style: TextStyle(
                    // color: Colors.black54,
                      color: wordStep == WordActionStep.example ? Colors.white : Colors.black54,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          // SizedBox(height: 10),
          if(wordStep != WordActionStep.example) InkWell(
            onTap: () {
              if(wordStep == WordActionStep.word) {                
                wordStep = WordActionStep.example;
                setState(() {});
              } else {
                Navigator.pop(context);
              } 
              // wordStep = WordActionStep.example;
              // setState(() {});
            },
            child: Container(
              // width: size.width*0.9,
              height: 70,
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xff6E5AA0),
              ),
              child: Center(
                child: Text(
                  'Example',
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

          


        // builder: (context) {
        //   return _wordSheet();
        // }
        );
  });
  }}

//   _wordSheet2() {
//     return Container(
//         width: size.width,
//         padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
//         child: Column(mainAxisSize: MainAxisSize.min, children: [
//           if(wordStep == WordActionStep.word) _infoBoxWord(size),
//           if(wordStep == WordActionStep.meaning) _infoBoxMeaning(size),
//           if(wordStep == WordActionStep.example) _infoBoxExample(size),
//           // SizedBox(height: 10),
//           if(wordStep != WordActionStep.meaning)InkWell(
//             onTap: () {
//               // Navigator.pop(context);
//               ref.read(homeProvider.notifier).onWordClicked(WordActionStep.meaning);
//             },
//             child: Container(
//               // width: size.width*0.9,
//               margin: EdgeInsets.only(top: 10),
//               height: 70,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: state.wordStep == WordActionStep.example ? Color(0xff6E5AA0) :Colors.white,
//               ),
//               child: Center(
//                 child: Text(
//                   'Meaning',
//                   style: TextStyle(
//                       color: Colors.black54,
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//           ),
//           // SizedBox(height: 10),
//           if(state.wordStep != WordActionStep.example) InkWell(
//             onTap: () {
//               wordStep = 
//               ref.read(homeProvider.notifier).onWordClicked(WordActionStep.example);
//             },
//             child: Container(
//               // width: size.width*0.9,
//               height: 70,
//               margin: EdgeInsets.only(top: 10),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: Color(0xff6E5AA0),
//               ),
//               child: Center(
//                 child: Text(
//                   'Example',
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//           ),
//         ]));
//   }
// }

// _infoBoxExample(Size size) {
//   return Container(
//             // width: size.width*0.96,
//             padding: EdgeInsets.symmetric(vertical:20, horizontal: 30),
//             height: 220,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: Colors.white,
//             ),
//             child: Stack(
//               children: [
//                 SizedBox(),
//                 // Text('Try to use this word in your answer 👇', style: TextStyle(
//                 //   fontSize: 19,
//                 //   color: Color(0xff555555)
//                 // ),),
//                 // Text('MEANING:', style: TextStyle(
//                 //   fontSize: 18,
//                 //   color: Color(0xff777777)
//                 // ),),
//                 Container(
//                     width: size.width - 80,
//                     height: 220,
//                     padding: EdgeInsets.only(top: 20),
//                     child: Center(
//                       child: Text('Speeding Up in the morning after today', textAlign: TextAlign.center, style: TextStyle(
//                         fontSize: 24,
//                         color: Color(0xff6E5AA0)
//                       ),),
//                     ),
//                   ),
//                 // Positioned(
//                 //   top: 50,
//                 //   child: Container(
//                 //     width: size.width - 120,
//                 //     height: 100,
//                 //     child: Center(
//                 //       child: Text('Speeding Up in the morning after today', textAlign: TextAlign.center, style: TextStyle(
//                 //         fontSize: 24,
//                 //         color: Color(0xff6E5AA0)
//                 //       ),),
//                 //     ),
//                 //   ),
//                 // ),
//                 Positioned(
//                   top: 10,
//                   left: 0,
//                   child: Container(
//                     padding: EdgeInsets.all(8),
//                     decoration: BoxDecoration(
//                       color: Colors.black.withOpacity(0.05),
//                       shape: BoxShape.circle
//                     ),
//                     child: Icon(Icons.pause, size: 30, color: Colors.black.withOpacity(0.35))),
//                 ),
//               ],
//             )
//           );
// }

// _infoBoxMeaning(Size size) {
//   return Container(
//     padding: EdgeInsets.symmetric(vertical:30, horizontal: 50),
//             height: 220,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: Colors.white,
//             ),
//             child: Center(
//               child: Text('Speeding Up in the morning after today', textAlign: TextAlign.center, style: TextStyle(
//                         fontSize: 24,
//                         color: Color(0xff6E5AA0)
//                       ),),
//             ),

//   );
// }

// _infoBoxWord(Size size) {
//   return Container(
//             // width: size.width*0.96,
//             padding: EdgeInsets.symmetric(vertical:30, horizontal: 50),
//             height: 220,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: Colors.white,
//             ),
//             child: Stack(
//               children: [
//                 Text('Try to use this word in your answer 👇', style: TextStyle(
//                   fontSize: 19,
//                   color: Color(0xff555555)
//                 ),),
//                 // Text('MEANING:', style: TextStyle(
//                 //   fontSize: 18,
//                 //   color: Color(0xff777777)
//                 // ),),
//                 Positioned(
//                   top: 50,
//                   child: Container(
//                     width: size.width - 120,
//                     height: 100,
//                     child: Center(
//                       child: Text('Speeding Up in the morning after today', textAlign: TextAlign.center, style: TextStyle(
//                         fontSize: 24,
//                         color: Color(0xff6E5AA0)
//                       ),),
//                     ),
//                   ),
//                 ),
//               ],
//             )
//           );
// }

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
