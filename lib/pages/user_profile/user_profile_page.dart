// ignore_for_file: use_build_context_synchronously

import 'package:eng_mobile_app/pages/layout/controller.dart';
import 'package:eng_mobile_app/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  final user = GetIt.I.get<AuthService>().user;

  Size size = Size.zero;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.02,
              ),
              _title(),
              SizedBox(height: 20),
              _logo(),
              SizedBox(height: 20),
              _userAccount(),
              SizedBox(
                height: 30,
              ),
              // _thankYouBox(),
              _feedbackBox(),
              SizedBox(
                height: 30,
              ),
              // Divider(),
              // SizedBox(height: 20,),
              _logout(),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _thankYouBox() {
    return Container(
      // height: 150,
      width: size.width * 0.7,
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            'A BIG thank you!',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 26, color: Colors.black87),
          ),
          SizedBox(
            height: 20,
          ),
          // Text('For sharing your comments and ideas ✌️ with us',
          // style: TextStyle(
          //   fontSize: 19,
          //   color: Colors.black54,
          // ),),
          // Text('For sharing your comments and ideas ✌️ with us',
          // style: TextStyle(
          //   fontSize: 19,
          //   color: Colors.black54,
          // ),),
          RichText(
            textAlign: TextAlign.left,
            text: TextSpan(
              children: [
                TextSpan(
                    text: 'For sharing your comments and ideas ',
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.normal,
                      fontSize: 18.5,
                    )),
                WidgetSpan(
                  child: Image.asset(
                    'assets/planet.png',
                    width: 22,
                  ),
                ),
                TextSpan(
                    text: ' with us. We’ll talk to you soon!',
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.normal,
                      fontSize: 18.5,
                    )),
              ],
            ),
          ),
          // SizedBox(height: 15,),
          // SizedBox(
          //   width: size.width*0.85,
          //   child: Text('We’ll talk to you soon!',
          //   style: TextStyle(
          //     fontSize: 18.5,
          //     color: Colors.black54,
          //   ),),
          // ),
          // SizedBox(height: 15,),
          // Text('🪐  ✨  ⚡️  ☄️  💥  🚀  💜  💙  💚',
          // style: TextStyle(
          //   fontSize: 18,
          //   color: Colors.black,
          // ),)
        ],
      ),
    );
  }

  _feedbackBox() {
    String placeholder = '''
Do you have some feedback about the app?

Write it here! We are always looking for ways to improve
''';
    return Column(
      children: [
        Container(
          width: size.width * 0.85,
          height: 250,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey.withOpacity(0.5))),
          child: TextField(
            maxLines: 12,
            // maxLength: 200,
            textCapitalization: TextCapitalization.sentences,
            style: TextStyle(fontSize: 20),
            decoration: InputDecoration(
              counterStyle: TextStyle(fontSize: 15, color: Colors.black38),
              hintText: placeholder.trim(),
              hintStyle: TextStyle(color: Colors.black26),
              border: InputBorder.none,
            ),
            // controller: meaningCtrl,
            onChanged: (_) {},
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: size.width * 0.85,
          alignment: Alignment.centerRight,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xff6E5AA0)),
            child: Text(
              'Send',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        )
      ],
    );
  }

  _title() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            child: Text(
          'FALOU',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87),
        )),
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.close,
            color: Colors.black87,
            size: 26,
          ),
        )
      ],
    );
  }

  _logo() {
    return Image.asset('assets/update_01.png', width: size.width * 0.4);
  }

  _userAccount() {
    return Row(
      children: [
        Image.asset(
          'assets/user_17.png',
          width: 70,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          user.email,
          style: TextStyle(fontSize: 18, color: Colors.black87),
        )
      ],
    );
  }

  _menu() {
    return Column(
      children: [
        // _vocabulary(),
        SizedBox(
          height: 35,
        ),
        _feedBack(),
        SizedBox(
          height: 35,
        ),
        _logout()
      ],
    );
  }

  _vocabulary() {
    return Container(
      width: size.width * 0.85,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Vocabulary List',
            style: TextStyle(fontSize: 22, color: Colors.black87),
          ),
          if (false)
            Container(
              width: 150,
              // color: Colors.red,
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xff7F7AE0)),
                    child: Text(
                      '80',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'words',
                    style: TextStyle(fontSize: 21, color: Color(0xff7F7AE0)),
                  )
                ],
              ),
            )
        ],
      ),
    );
  }

  _feedBack() {
    return Container(
      width: size.width * 0.85,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'How To Improve?',
            style: TextStyle(fontSize: 22, color: Colors.black87),
          ),
          Icon(
            Icons.chevron_right,
            color: Colors.grey,
            size: 25,
          )
        ],
      ),
    );
  }

  _logout() {
    return Container(
      width: size.width * 0.85,
      child: InkWell(
        onTap: () async {
          final screen = context.read<Screen>();
          final authService = GetIt.I.get<AuthService>();

          screen.startLoading();
          await authService.loginOut();
          screen.stopLoading();

          screen.showToast('Logged out');

          Navigator.pop(context);
        },
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Log Out',
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.black87,
                    // color: Colors.red,
                    fontWeight: FontWeight.normal),
              ),
              Icon(
                Icons.chevron_right,
                color: Colors.grey,
                size: 25,
              )
            ],
          ),
        ),
      ),
    );
  }
}
