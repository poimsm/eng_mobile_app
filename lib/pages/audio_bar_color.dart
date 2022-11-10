import 'dart:math';

import 'package:flutter/material.dart';

class AudioBarColor extends StatefulWidget {
  AudioBarColor({this.playAnimation = false, this.audioLength = '0:00'});

  final bool playAnimation;
  final String audioLength;

  @override
  _AudioBarColorState createState() => _AudioBarColorState();
}

class _AudioBarColorState extends State<AudioBarColor> {
  List<int> duration = [800, 600, 700, 500, 400];

  bool isSet = false;
  List heightList = [];

  @override
  Widget build(BuildContext context) {
    isSet = true;
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xff6F5BA1),
                Color(0xffB579C1),
              ],
            )),
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 15),
        child: Row(
          children: [
            Container(
                padding: EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                ),
                child:
                    Icon(Icons.play_arrow, color: Color(0xff7562A5), size: 28)),
            SizedBox(width: 10),
            Container(
                width: 100,
                height: 50,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      7,
                      (index) {
                        if(heightList.length - 1 < index) {
                          heightList.add(5 + Random().nextInt(20).toDouble());
                        }
                      return widget.playAnimation
                          ? AnimatedBar(
                              duration: duration[index % 5], index: index)
                          : StaticBar(index, heightList[index]);
                      }))),
                  
            SizedBox(width: 10),
            Text(widget.audioLength,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.5,
                ))
          ],
        ),
      ),
    );
  }
}

class AnimatedBar extends StatefulWidget {
  AnimatedBar({this.duration = 0, this.index = 0});

  final int duration;
  final int index;

  @override
  State<AnimatedBar> createState() => _AnimatedBarState();
}

class _AnimatedBarState extends State<AnimatedBar>
    with TickerProviderStateMixin {
  final int totalBars = 7;

  late Animation<double> _animation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: widget.duration));
    _animation = Tween(begin: 0.0, end: 25.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.decelerate));
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Container(
                  height: 7 + _animation.value,
                  width: 6,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white
                          .withOpacity(1 - widget.index / totalBars)),
                );
              }),
        ],
      ),
    );
  }
}

class StaticBar extends StatelessWidget {
  const StaticBar(this.index, this.height);

  final int index;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            height: height,
            width: 6,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white.withOpacity(1 - index / 10)),
          )
        ],
      ),
    );
  }
}
