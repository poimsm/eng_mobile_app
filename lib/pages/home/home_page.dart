import 'dart:convert';

import 'package:eng_mobile_app/data/mocks/index.dart';
import 'package:eng_mobile_app/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:eng_mobile_app/routes/routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/activity.dart';

class HomePage extends ConsumerStatefulWidget  {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState  extends ConsumerState<HomePage> {
  String imageUrl = 'https://i.pinimg.com/564x/29/2b/a2/292ba2025c0b8ff9b77e35d0f5a0509e.jpg';
  String question = 'Hello world how are you being doing today morning?';
  Size size = Size.zero;
  bool isRecording = false;

  List<Activity> acts = [];


  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    final data = jsonDecode(MockActivities().json());
    // acts.add(Activity.fromJson(json));

    acts = (data as List)
          .map((x) => Activity.fromJson(x))
          .toList();

    print('AKIIIIIIIIIIIII');
    print(acts);
  }
  @override
  Widget build(BuildContext context) {
    // final counter = ref.watch(counterProvider);
    size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      color: Color(0xff726396),
      child: SafeArea(
        child: Stack(children: [
          SizedBox(
            height: size.height,
        width: size.width,
          ),
          if(isRecording)_loadingBar(),
          // _image(),
          // if(isRecording)Positioned(
          //   right: 0,
          //   top: 10,
          //   child: _loadingBar(),
          // ),
          if(!isRecording && false)Positioned(
            right: 20,
            top: 20,
            child: _avatar(),
          ),
          Positioned(
            left: 0,
            top: size.height*0.1,
            child: _image(),
          ),
          if(true)Positioned(
            left: 20,
            top: 40,
            child: _suggestedWord(),
          ),
          if(false)Positioned(
            top: size.height*0.65,
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
        ],),
      )
    );
  }

  _suggestedWord() {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.CHALLENGE);
      },
      child: Container(
        height: 80,
        width: size.width*0.9,
        padding: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xff44546A),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('  ' + 'Speeding!', style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),),
          Icon(Icons.play_arrow, size: 30, color: Colors.white)
          ]
        ),
      ),
    );
  }

  _avatar() {
    return Image.asset('assets/user.png', width: 60,);
  }

  _example() {
    final counter = ref.watch(counterProvider);
    final notifier = ref.read(counterProvider.notifier);
    return InkWell(
      onTap: () {
        notifier.setName('New Bye');
      },
      child: Container(
        // width: size.width*0.8,
        height: 60,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.orangeAccent
        ),
        child: Row(
          children: [          
            // 🎧 Example Icon(Icons.learn, size: 35, color: Colors.white),
            Text('${counter.name}', style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 20
            )),
            
          ],
        ),
      ),
    );
  }

  _example2() {
    return Container(
      width: size.width*0.8,
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.black.withOpacity(0.4)
      ),
      child: Row(
        children: [
          Text('Example', style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 20
          )),
          Icon(Icons.chevron_right, size: 35, color: Colors.white)
        ],
      ),
    );
  }

  _loadingBar() {
    return Container(
      padding: EdgeInsets.only(
        left: size.width*0.01,
        right: size.width*0.01,
        top: 10
        ),
      child: Container(
        
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12)
        ),
        height: 40,
        width: size.width*0.98,
        child: Stack(children: [
          Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.7),
            borderRadius: BorderRadius.circular(12)
          ),
          height: 40,
          width: 150,
        ),
        ],)
      ),
    );
  }

  _image() {
    return SizedBox(
      height: size.height*0.7,
      width: size.width,
      child: Center(
        child: Stack(
          children: [
            Image.network(imageUrl, 
            width: size.width, 
            fit: BoxFit.cover,
            ),
            if(true) Positioned(
              top: 240,
              child: Container(
                color: Colors.black.withOpacity(0.5),
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                width: size.width,
                child: Text(question, style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  overflow: TextOverflow.clip
                ),)
              ),
            )
          ],
        ),
      ),
    );
  }

  _ctrlBtns() {
    return Container(
      // color: Colors.yellow,
      width: size.width,
      height: size.height*0.15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
        _iconBtn(Icons.water),
        // Container(
        //   padding: EdgeInsets.only(bottom: 80),
        //   child: _micBtn(),
        // ),
        _micBtn(),
        _iconBtn(Icons.chevron_right),
      ]),
    );
  }


  _iconBtn(icon) {
    return InkWell(
      onTap: () {
        // _presentActionSheet();
        Navigator.pushNamed(context, Routes.WORDS);
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black.withOpacity(0.2),
        ),
        
        child: Icon(icon, color: Colors.white, size: 40),
      ),
    );
  }

  _micBtn() {
    return InkWell(
      onTapDown: (_) {
        isRecording = true;
        print('Entroooooo');
        setState(() {});
      },
      onTapUp: (_) {
        isRecording = false;
        print('Saliooooo');
        setState(() {});
      },
      onTapCancel: () {
        isRecording = false;
        setState(() {});
        print('onTapCancel');
      },
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          // borderRadius: BorderRadius.circular(30),
          color: Color(0xff8D57FF).withOpacity(isRecording ? 0.65: 0.8),
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
          return _wordSheet();
        });
  }

  _wordSheet() {
    return Container(
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            // width: size.width*0.96,
            height: 220,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          Container(
            // width: size.width*0.9,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Center(
              child: Text('Meaning', style: TextStyle(
                color: Colors.black54,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),),
            ),
          ),
          SizedBox(height: 10),
          Container(
            // width: size.width*0.9,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xff6E5AA0),
            ),
            child: Center(
              child: Text('Example', style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),),
            ),
          ),
        ]
      )
    );
  }
}