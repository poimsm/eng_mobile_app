import 'package:flutter/material.dart';

class NewAppVersionPage extends StatelessWidget {
  const NewAppVersionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.2,
            ),
            Image.asset('assets/update_01.png', width: 120),
            SizedBox(
              height: size.height * 0.1,
            ),
            Text('New update is available',
                style: TextStyle(fontSize: 24, color: Color(0xff6E5AA0))),
            SizedBox(
              height: 15,
            ),
            Text(
                'To keep using this app please upgrade to the latest version available on PlayStore',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.black54)),
            SizedBox(
              height: size.height * 0.25,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: 60,
                width: size.width * 0.8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xff0F9D58)),
                child: Center(
                  child: Text(
                    'UPDATE NOW',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      // fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
