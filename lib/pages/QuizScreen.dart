import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../utils/helpers.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen(
      {super.key,
      required this.isWelcome,
      required this.onStartQuiz,
      required this.onAddWords,
      required this.onCreateUser});

  final bool isWelcome;
  final VoidCallback onStartQuiz;
  final VoidCallback onAddWords;
  final VoidCallback onCreateUser;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  Size size = Size.zero;
  late TextEditingController _emailCtrl;
  late TextEditingController _passCtrl;

  @override
  void initState() {
    super.initState();
    _emailCtrl = TextEditingController();
    _passCtrl = TextEditingController();
  }

  bool showAccountPopup = false;

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
                if (!widget.isWelcome) _addWordsBtn(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _appbar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_avatar(), _settings()],
      ),
    );
  }

  _avatar() {
    return InkWell(
      onTap: () {
        // showAccountPopup = true;
        // setState(() {});

        _presentActionSheet();
      },
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white.withOpacity(0.5), width: 3)),
        child: Image.asset(
          'assets/user_17.png',
          width: 45,
        ),
      ),
    );
  }

  _settings() {
    return Container(
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

  _addWordsBtn() {
    return Material(
      // borderRadius: BorderRadius.circular(25),
      color: Colors.transparent,
      // animationDuration: Duration(milliseconds: 120),
      child: InkWell(
        onTap: () async {
          // await sleep(150);
          widget.onAddWords();
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

  _chooseAvatar() {
    return SizedBox(
      width: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset('assets/user_17.png', width: 40),
          Image.asset('assets/user_17.png', width: 70),
          Image.asset('assets/user_17.png', width: 40),
        ],
      ),
    );
  }

  _emailField() {
    return Container(
      width: 270,
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        maxLines: 1,
        textCapitalization: TextCapitalization.sentences,
        style: TextStyle(fontSize: 20),
        decoration: InputDecoration(
          hintText: 'Email',
          counterStyle: TextStyle(fontSize: 15, color: Colors.black38),
          hintStyle: TextStyle(color: Colors.black26),
          border: InputBorder.none,
        ),
        onChanged: (_) {},
        controller: _emailCtrl,
      ),
    );
  }

  _passwordField() {
    return Container(
      width: 270,
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        maxLines: 1,
        textCapitalization: TextCapitalization.sentences,
        style: TextStyle(fontSize: 20),
        decoration: InputDecoration(
          hintText: 'Password',
          counterStyle: TextStyle(fontSize: 15, color: Colors.black38),
          hintStyle: TextStyle(color: Colors.black26),
          border: InputBorder.none,
        ),
        onChanged: (_) {},
        controller: _passCtrl,
      ),
    );
  }

  _createAccountBtn() {
    return Container(
      width: 270,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xff6E5AA0),
      ),
      child: Center(
        child: Text(
          'Create account',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  _userFooter() {
    return SizedBox(
      width: 150,
      child: RichText(
        textAlign: TextAlign.left,
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
                text: 'Do you have an account?',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.normal,
                  fontSize: 19,
                )),
            TextSpan(
                text: ' Log in',
                style: TextStyle(
                  color: Color(0xff6E5AA0),
                  fontSize: 19,
                  fontWeight: FontWeight.normal,
                )),
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
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
              height: 450,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  _chooseAvatar(),
                  SizedBox(
                    height: 10,
                  ),
                  _emailField(),
                  SizedBox(
                    height: 15,
                  ),
                  _passwordField(),
                  SizedBox(
                    height: 25,
                  ),
                  _createAccountBtn(),
                  SizedBox(
                    height: 15,
                  ),
                  _userFooter()
                ],
              ),
            );
          });
        });
  }
}
