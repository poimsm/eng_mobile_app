import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.3,
          ),
          Image.asset('assets/alert_01.png', width: 120),
          SizedBox(
            height: 30,
          ),
          Text(
            'Something went wrong.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 19, color: Colors.black54),
          ),
          Text(
            'Please try again later',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 19, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
