import 'package:eng_mobile_app/data/models/activity.dart';
import 'package:eng_mobile_app/pages/login_popup/login_popup.dart';
import 'package:eng_mobile_app/routes/routes.dart';
import 'package:eng_mobile_app/services/auth/auth_service.dart';
import 'package:eng_mobile_app/services/local_db/local_db_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:line_icons/line_icons.dart';

import '../utils/helpers.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen(
      {super.key,
      required this.isWelcome,
      required this.onStartQuiz,
      required this.onAddSentences,
      required this.onCreateUser});

  final bool isWelcome;
  final VoidCallback onStartQuiz;
  final VoidCallback onAddSentences;
  final VoidCallback onCreateUser;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  bool showAccountPopup = false;
  Size size = Size.zero;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      color: Color(0xff6E5AA0),
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                _appbar(),
                SizedBox(height: size.height * 0.05),
                _image(),
                SizedBox(
                    height: size.height * (widget.isWelcome ? 0.05 : 0.03)),
                _messageQuiz(),
                SizedBox(
                    height: size.height * (widget.isWelcome ? 0.05 : 0.04)),
                _startQuizBtn(),
                if (!widget.isWelcome) SizedBox(height: size.height * 0.03),
                if (!widget.isWelcome) _addSentencesBtn(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _appbar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_avatar(), _settings()],
      ),
    );
  }

  _avatar() {
    return InkWell(
      onTap: () {
        if (GetIt.I.get<AuthService>().isAuthenticated) {
          Navigator.pushNamed(context, Routes.USER_PROFILE);
        } else {
          showModalBottomSheet(
              context: context,
              backgroundColor: Colors.transparent,
              isScrollControlled: true,
              builder: (_) => LoginPopup());
        }
      },
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border:
                  Border.all(color: Colors.white.withOpacity(0.5), width: 3)),
          child: Image.asset(
            'assets/user_17.png',
            width: 45,
          ),
        ),
      ),
    );
  }

  _settings() {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Icon(LineIcons.horizontalSliders, size: 35, color: Colors.white),
    );
  }

  _image() {
    Widget imageWidget;

    if (widget.isWelcome) {
      imageWidget =
          Image.asset('assets/podcast_01.png', width: size.width * 0.8);
    } else {
      imageWidget = Image.asset('assets/book_02.png', width: size.width * 0.6);
    }

    return imageWidget;
  }

  _messageQuiz() {
    String msg = '';

    if (widget.isWelcome) {
      msg = "We will ask you 6 questions… Ready?";
    } else {
      msg = "Amazing, you’ve practiced first Question Round!";
    }
    return Container(
      width: size.width * 0.9,
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 40),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0),
          borderRadius: BorderRadius.circular(15)),
      child: Text(
        msg,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  _startQuizBtn() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Material(
        color: Color(0xffFEAD22),
        borderRadius: BorderRadius.circular(25),
        child: InkWell(
          splashColor: Colors.white.withOpacity(0.6),
          borderRadius: BorderRadius.circular(25),
          onTap: () async {
            await sleep(200);
            widget.onStartQuiz();
          },
          child: Container(
            width: widget.isWelcome ? 200 : size.width * 0.85,
            padding: EdgeInsets.symmetric(vertical: 25, horizontal: 40),
            child: widget.isWelcome
                ? Text(
                    'START',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  )
                : Row(
                    children: [
                      Icon(Icons.refresh, color: Colors.white, size: 40),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'TAKE QUIZ AGAIN',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 21,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  _addSentencesBtn() {
    return Material(
      // borderRadius: BorderRadius.circular(25),
      color: Colors.transparent,
      // animationDuration: Duration(milliseconds: 120),
      child: InkWell(
        onTap: () async {
          // await sleep(150);
          widget.onAddSentences();
        },
        borderRadius: BorderRadius.circular(25),
        child: Container(
          width: size.width * 0.85,
          padding: EdgeInsets.symmetric(vertical: 22, horizontal: 40),
          decoration: BoxDecoration(
              border: Border.all(color: Color(0xffCAB4EF), width: 3),
              borderRadius: BorderRadius.circular(25)),
          child: Row(
            children: [
              Icon(Icons.add, color: Colors.white, size: 40),
              SizedBox(
                width: 10,
              ),
              Text(
                'ADD WORDS',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
