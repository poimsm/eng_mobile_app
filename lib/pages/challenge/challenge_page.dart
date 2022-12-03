import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  ChallengePage({Key? key}) : super(key: key);

  @override
  State<ChallengePage> createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  Size size = Size.zero;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
        height: size.height,
        width: size.width,
        child: SafeArea(
            child: Stack(
          children: [
            Column(
              children: [
                _appbar(),
                SizedBox(
                  height: 30,
                ),
                _card()
              ],
            ),
            Positioned(
                left: 0,
                bottom: 45,
                child: SizedBox(
                  width: size.width,
                  child: Center(
                    child: _newSentenceBox(),
                  ),
                ))
          ],
        )));
  }

  _appbar() {
    return Container(
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back,
                size: 30,
              ),
            ),
            Text(
              'Challenge',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            )
          ]),
          Padding(
              padding: EdgeInsets.only(right: 30),
              child: Image.asset(
                'assets/fox.png',
                width: 100,
              ))
        ],
      ),
    );
  }

  _card() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 50, horizontal: 30),
            child: Column(
              children: [
                Text(
                  'Try to use this sentence in your answer 👈',
                  style: TextStyle(fontSize: 18, color: Color(0xff595959)),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Everything',
                  style: TextStyle(fontSize: 28, color: Color(0xff595959)),
                ),
                SizedBox(
                  height: 40,
                ),
                if (false)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _meaning(),
                      SizedBox(
                        height: 20,
                      ),
                      _example(),
                    ],
                  ),
                // SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _btn('Meaning'),
                    _btn('Example'),
                  ],
                )
              ],
            ),
          )),
    );
  }

  _meaning() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'MEANING',
          style: TextStyle(
              color: Colors.black87, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          'Correr muy rapido',
          style: TextStyle(
            color: Color(0xff595959),
            fontSize: 18,
          ),
        ),
      ],
    );
  }

  _example() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'EXAMPLE SENTENCE',
          style: TextStyle(
              color: Colors.black87, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          'When I was everything I like to go football',
          style: TextStyle(
            color: Color(0xff595959),
            fontSize: 18,
          ),
        ),
      ],
    );
  }

  _card2() {
    return Card(
        child: Container(
      padding: EdgeInsets.symmetric(vertical: 50, horizontal: 15),
      child: Column(
        children: [
          Text(
            'Try to use this sentence in your answer 🙂',
            style: TextStyle(fontSize: 17, color: Color(0xff595959)),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'Everything',
            style: TextStyle(fontSize: 28, color: Color(0xff595959)),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _btn('Meaning'),
              _btn('Example'),
            ],
          )
        ],
      ),
    ));
  }

  _btn(String title) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xff6E5AA0),
      ),
      child: Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16),
      ),
    );
  }

  _newSentenceBox() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
          width: size.width * 0.8,
          height: 60,
          // padding: EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.black54)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon(Icons.add, size: 30, color: Colors.white),
              Text(
                'Got it!',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              )
            ],
          )),
    );
  }
}
