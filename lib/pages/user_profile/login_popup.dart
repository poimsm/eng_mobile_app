import 'package:eng_mobile_app/pages/layout/controller.dart';
import 'package:eng_mobile_app/routes/routes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import 'login_popup_controller.dart';

class LoginPopup extends ConsumerStatefulWidget {
  const LoginPopup({super.key});

  @override
  LoginPopupState createState() => LoginPopupState();
}

class LoginPopupState extends ConsumerState<LoginPopup> {
  @override
  void initState() {
    super.initState();
    _emailTextCtrl = TextEditingController();
    _passTextCtrl = TextEditingController();
  }

  @override
  void dispose() {
    _emailTextCtrl.dispose();
    _passTextCtrl.dispose();
    super.dispose();
  }

  Size size = Size.zero;
  late TextEditingController _emailTextCtrl;
  late TextEditingController _passTextCtrl;

  List<String> states = ['start', 'sign_up', 'sign_in'];
  String currentState = 'start';
  double height = 420;
  bool hidePassword = false;

  late LoginState loginState;
  late LoginPopupNotifier loginProvider;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    loginState = ref.watch(loginPopupProvider);
    loginProvider = ref.read(loginPopupProvider.notifier);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        color: Colors.white,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            if (currentState == states[0]) ...welcomeUser(context, setState),
            if (currentState == states[1])
              // ...createAccountFinish(context, setState),
              ...signUp(context, setState),
            if (currentState == states[2]) ...signIn(context, setState),
          ],
        ),
      ),
    );
  }

  chooseAvatar() {
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

  userName() {
    return Container(
      width: 290,
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
          hintText: 'Your name',
          counterStyle: TextStyle(fontSize: 15, color: Colors.black38),
          hintStyle: TextStyle(color: Colors.black26),
          border: InputBorder.none,
        ),
        onChanged: (_) {},
        controller: _emailTextCtrl,
      ),
    );
  }

  usernameField(BuildContext context) {
    return Container(
      width: 290,
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        maxLines: 1,
        style: TextStyle(fontSize: 20),
        decoration: InputDecoration(
          hintText: 'Your name',
          counterStyle: TextStyle(fontSize: 15, color: Colors.black38),
          hintStyle: TextStyle(color: Colors.black26),
          border: InputBorder.none,
        ),
        onChanged: (_) {},
        controller: _emailTextCtrl,
      ),
    );
  }

  emailField(BuildContext context) {
    return Container(
      width: 290,
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        maxLines: 1,
        style: TextStyle(fontSize: 20),
        decoration: InputDecoration(
          hintText: 'Email',
          counterStyle: TextStyle(fontSize: 15, color: Colors.black38),
          hintStyle: TextStyle(color: Colors.black26),
          border: InputBorder.none,
        ),
        onChanged: (_) {},
        controller: _emailTextCtrl,
      ),
    );
  }

  passwordField() {
    return Container(
      width: 290,
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 200,
            child: TextField(
              maxLines: 1,
              obscureText: hidePassword,
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(
                hintText: 'Password',
                counterStyle: TextStyle(fontSize: 15, color: Colors.black38),
                hintStyle: TextStyle(color: Colors.black26),
                border: InputBorder.none,
              ),
              onChanged: (_) {
                // final bool emailValid = RegExp(
                // r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                //     .hasMatch(_emailTextCtrl.text);
                // if (!emailValid) {
                //   showInvalidEmail = true;
                //   setState(() {});
                //   return;n
                // }
              },
              controller: _passTextCtrl,
            ),
          ),
          InkWell(
            onTap: () {
              hidePassword = !hidePassword;
              setState(() {});
            },
            child: Icon(
              hidePassword ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey,
              size: 25,
            ),
          )
        ],
      ),
    );
  }

  footerBtn(String title, VoidCallback callback) {
    return InkWell(
      onTap: () => callback(),
      child: Container(
        width: 290,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(0xff6E5AA0),
        ),
        child: Center(
          child: loginState.loading
              ? SpinKitRing(
                  lineWidth: 4,
                  color: Colors.white,
                  size: 30,
                )
              : Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
        ),
      ),
    );
  }

  footerText(VoidCallback callback) {
    return SizedBox(
      width: 150,
      child: RichText(
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
                recognizer: TapGestureRecognizer()..onTap = () => callback(),
                text: ' Log in',
                style: TextStyle(
                  color: Color(0xff6E5AA0),
                  fontSize: 22,
                  fontWeight: FontWeight.normal,
                )),
          ],
        ),
      ),
    );
  }

  forgotPassword(VoidCallback callback) {
    return Container(
        width: 290,
        alignment: Alignment.centerRight,
        child: Text('Forgot password?',
            style: TextStyle(
              color: Color(0xff6E5AA0),
              fontSize: 17,
              fontWeight: FontWeight.w500,
            )));
  }

  loginTitle() {
    return SizedBox(
      width: 290,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Join free 👻',
            style: TextStyle(
                fontSize: 26,
                color: Colors.black87,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Become a user and save your progress every day. Join this awesome and energetic study app :)',
            style: TextStyle(fontSize: 18, color: Colors.black54),
          ),
          // Text(
          //   '👉 Save your progress anytime!',
          //   style: TextStyle(fontSize: 18, color: Colors.black54),
          // ),
          // SizedBox(
          //   height: 10,
          // ),
          // Text(
          //   '👉 Keep a custome vocabulary list',
          //   style: TextStyle(fontSize: 18, color: Colors.black54),
          // ),
          // SizedBox(
          //   height: 10,
          // ),
          // Text(
          //   '👉 Be cool 😎 and unlock more features',
          //   style: TextStyle(fontSize: 18, color: Colors.black54),
          // ),
          // SizedBox(
          //   height: 10,
          // ),
        ],
      ),
    );
  }

  loginTitle2() {
    return SizedBox(
      width: 290,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Join free 👻',
            style: TextStyle(
                fontSize: 26,
                color: Colors.black87,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Become a user and save your progress every day. Join this awesome and energetic study app :)',
            style: TextStyle(fontSize: 18, color: Colors.black54),
          ),
        ],
      ),
    );
  }

  bubbleEngLvl(String lvl, bool isActive) {
    return Container(
      height: 70,
      width: 150,
      decoration: BoxDecoration(
        color: isActive ? Color(0xffFBFACD) : Color(0xfff1f1f1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          lvl,
          style: TextStyle(
              fontSize: 20,
              color: isActive ? Colors.yellow.shade800 : Colors.black26),
        ),
      ),
    );
  }

  englishLevel() {
    return SizedBox(
      width: 350,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              bubbleEngLvl('Begginer', false),
              bubbleEngLvl('Intermediate', true),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          bubbleEngLvl('Advanced', false),
        ],
      ),
    );
  }

  chooseLevel() {
    return SizedBox(
      width: 300,
      child: Text(
        'Pick your English level',
        style: TextStyle(fontSize: 19, color: Colors.black54),
      ),
    );
  }

  loginInTitle() {
    return SizedBox(
      width: 290,
      child: Text(
        'Please sign in to continue',
        style: TextStyle(
          fontSize: 21,
          color: Colors.black87,
        ),
      ),
    );
  }

  errorMsg(String msg, {double? fontSize = 18}) {
    return SizedBox(
      width: 290,
      child: Text(
        msg,
        style: TextStyle(color: Colors.red, fontSize: fontSize),
      ),
    );
  }

  List<Widget> signIn(BuildContext context, StateSetter setState) {
    return [
      SizedBox(
        height: 15,
      ),
      loginInTitle(),
      SizedBox(
        height: 25,
      ),
      emailField(context),
      SizedBox(
        height: 20,
      ),
      passwordField(),
      SizedBox(
        height: 20,
      ),
      forgotPassword(() {
        Navigator.pop(context);
      }),
      SizedBox(
        height: loginState.showServerErr ? 25 : 15,
      ),
      if (loginState.showServerErr) errorMsg(loginState.errMsg),
      SizedBox(
        height: 20,
      ),
      footerBtn('Sign In', () async {
        if (_passTextCtrl.text.isEmpty || _emailTextCtrl.text.isEmpty) {
          return;
        }

        loginProvider.ressetErrorsAndStartLoading();

        final respOk = await loginProvider.signIn(
            email: _emailTextCtrl.text, password: _passTextCtrl.text);
        if (!respOk) return;

        final screen = context.read<Screen>();
        screen.showToast('Welcome!');

        Navigator.pop(context, true);
      }),
    ];
  }

  List<Widget> welcomeUser(BuildContext context, StateSetter setState) {
    return [
      SizedBox(
        height: 10,
      ),
      SizedBox(
        width: double.infinity,
        child: Text(
          'Become a user',
          style: TextStyle(
              fontSize: 26, color: Colors.black87, fontWeight: FontWeight.w500),
        ),
      ),
      SizedBox(
        height: 15,
      ),
      Image.asset(
        'assets/avatars_01.png',
        width: 200,
      ),
      SizedBox(
        height: 15,
      ),
      Text(
        'And save your progress every day. Join this awesome and energetic study app :)',
        style: TextStyle(fontSize: 18, color: Colors.black54),
      ),
      SizedBox(
        height: 25,
      ),
      footerBtn('Sign Up', () async {
        currentState = states[1];
        height = 590;
        setState(() {});
      }),
      SizedBox(
        height: 25,
      ),
      footerText(() {
        _emailTextCtrl.text = '';
        _passTextCtrl.text = '';
        currentState = states[2];
        height = 440;
        setState(() {});
      })
    ];
  }

  List<Widget> signUp(BuildContext context, StateSetter setState) {
    return [
      // SizedBox(height: 10,),
      SizedBox(
        width: double.infinity,
        child: Text(
          'Create account',
          style: TextStyle(
              fontSize: 26, color: Colors.black87, fontWeight: FontWeight.w500),
        ),
      ),

      SizedBox(
        height: 25,
      ),
      emailField(context),

      if (loginState.showEmailErr) ...[
        SizedBox(
          height: 7,
        ),
        errorMsg(loginState.errMsg),
      ],
      SizedBox(
        height: 15,
      ),
      passwordField(),
      SizedBox(
        height: 30,
      ),
      chooseLevel(),
      SizedBox(
        height: 15,
      ),
      englishLevel(),
      SizedBox(
        height: 25,
      ),
      if (loginState.showServerErr) ...[
        errorMsg(loginState.errMsg),
        SizedBox(
          height: 10,
        ),
      ],

      footerBtn('Sign Up', () async {
        if (_passTextCtrl.text.isEmpty || _emailTextCtrl.text.isEmpty) {
          return;
        }

        final valid = loginProvider.checkValidEmail(_emailTextCtrl.text);
        if (!valid) return;

        final respOk = await loginProvider.signUp(
            email: _emailTextCtrl.text, password: _passTextCtrl.text);
        if (!respOk) return;

        final screen = context.read<Screen>();
        screen.showToast('Welcome!');

        Navigator.pop(context, true);
      }),
      SizedBox(
        height: 25,
      ),
    ];
  }
}
