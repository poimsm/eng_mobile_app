import 'package:eng_mobile_app/pages/layout/controller.dart';
import 'package:eng_mobile_app/routes/routes.dart';
import 'package:eng_mobile_app/services/auth/auth_service.dart';
import 'package:eng_mobile_app/utils/helpers.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class LoginBottomSheet extends StatefulWidget {
  const LoginBottomSheet({super.key});

  @override
  LoginBottomSheetState createState() => LoginBottomSheetState();
}

class LoginBottomSheetState extends State<LoginBottomSheet> {
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

  Future<bool> signIn() async {
    setState(() => loading = true);
    final respOk = await GetIt.I.get<AuthService>().signIn(SignInPayload(
          email: _emailTextCtrl.text,
          password: _passTextCtrl.text,
        ));
    setState(() => loading = false);
    return respOk;
  }

  Future<bool> signUp() async {
    setState(() => loading = true);
    // final uu = GetIt.I.get<AuthService>();
    final respOk = await GetIt.I.get<AuthService>().signUp(SignUpPayload(
          email: _emailTextCtrl.text,
          password: _passTextCtrl.text,
        ));
    setState(() => loading = false);
    return respOk;
  }

  Size size = Size.zero;
  late TextEditingController _emailTextCtrl;
  late TextEditingController _passTextCtrl;

  List<String> states = ['creating_account', 'choosing_eng_level', 'login_in'];
  String currentState = 'creating_account';
  double height = 500;
  bool hidePassword = false;
  bool loading = false;

  FormModel signInModel = FormModel();
  FormModel signUpModel = FormModel();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          color: Colors.white,
        ),
        child: Column(
          children: [
            if (currentState == states[0])
              ...createAccountStart(context, setState),
            if (currentState == states[1])
              ...createAccountFinish(context, setState),
            if (currentState == states[2]) ...loginInUser(context, setState),
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
                //   return;
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
          child: loading
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
            'Create account 👻',
            style: TextStyle(
                fontSize: 26,
                color: Colors.black87,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Never stop learning ever! Join this awesome app :)',
            style: TextStyle(fontSize: 18, color: Colors.black54),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  bubbleEngLvl(String lvl, bool isActive) {
    return Container(
      height: 50,
      width: 150,
      decoration: BoxDecoration(
        color: isActive ? Colors.yellow.shade100 : Color(0xfff1f1f1),
        borderRadius: BorderRadius.circular(15),
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
              bubbleEngLvl('Intermediate', false),
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
        style: TextStyle(fontSize: 21, color: Colors.black87),
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

  List<Widget> loginInUser(BuildContext context, StateSetter setState) {
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
        height: signInModel.showServerErr ? 25 : 15,
      ),
      if (signInModel.showServerErr) errorMsg(signInModel.errMsg),
      SizedBox(
        height: 25,
      ),
      footerBtn('Sign In', () async {
        setState(() => signInModel = FormModel());

        if (_passTextCtrl.text.isEmpty || _emailTextCtrl.text.isEmpty) {
          return;
        }

        final respOk = await signIn();

        if (!respOk) {
          setState(() {
            signInModel = FormModel(
                showServerErr: true, errMsg: 'Password or email incorrect');
          });
          return;
        }

        final screen = context.read<Screen>();
        screen.showToast('Welcome to FALOU!');

        Navigator.pop(context);
        Navigator.pushNamed(context, Routes.USER_PROFILE);
      }),
    ];
  }

  List<Widget> createAccountStart(BuildContext context, StateSetter setState) {
    return [
      loginTitle(),
      SizedBox(
        height: 25,
      ),
      emailField(context),
      if (signUpModel.showInvalidEmailErr)
        SizedBox(
          height: 5,
        ),
      if (signUpModel.showInvalidEmailErr)
        errorMsg(signUpModel.errMsg, fontSize: 17),
      SizedBox(
        height: 15,
      ),
      passwordField(),
      SizedBox(
        height: 25,
      ),
      if (signUpModel.showServerErr) errorMsg(signUpModel.errMsg),
      footerBtn('Sign Up', () async {
        if (_passTextCtrl.text.isEmpty || _emailTextCtrl.text.isEmpty) {
          return;
        }

        setState(() => signUpModel = FormModel());

        final bool emailValid = RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(_emailTextCtrl.text);

        if (!emailValid) {
          setState(() => {
                signUpModel = FormModel(
                    errMsg: '  Invalid email', showInvalidEmailErr: true)
              });
          return;
        }

        final respOk = await signUp();

        if (!respOk) {
          return;
        }

        final screen = context.read<Screen>();
        screen.showToast('Welcome to FALOU!');

        Navigator.pop(context);
        Navigator.pushNamed(context, Routes.USER_PROFILE);
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

  List<Widget> createAccountFinish(BuildContext context, StateSetter setState) {
    return [
      SizedBox(
        height: 25,
      ),
      chooseLevel(),
      SizedBox(
        height: 25,
      ),
      englishLevel(),
      SizedBox(
        height: 65,
      ),
      footerBtn('Finish', () {
        Navigator.pop(context);
      }),
    ];
  }
}

class FormModel {
  FormModel({
    this.showInvalidEmailErr = false,
    this.showServerErr = false,
    this.errMsg = '',
  });
  bool showInvalidEmailErr;
  bool showServerErr;
  String errMsg;
  FormModel copyWith({showInvalidEmailErr, showServerErr, errMsg}) {
    return FormModel(
      showInvalidEmailErr: showInvalidEmailErr ?? this.showInvalidEmailErr,
      showServerErr: showServerErr ?? this.showServerErr,
      errMsg: errMsg ?? this.errMsg,
    );
  }
}
