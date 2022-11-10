import 'dart:math';

import 'package:flutter/material.dart';

class AudioBarWhite extends StatefulWidget {
  AudioBarWhite({this.playAnimation = false, this.audioLength = '0:00'});

  final bool playAnimation;
  final String audioLength;

  @override
  _AudioBarWhiteState createState() => _AudioBarWhiteState();
}

class _AudioBarWhiteState extends State<AudioBarWhite> {
  List<int> duration = [800, 600, 700, 500, 400];

  bool isSet = false;
  List heightList = [];

  @override
  Widget build(BuildContext context) {
    isSet = true;
    return Container(
      // color: Colors.red,
      // decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(6),
      //     gradient: LinearGradient(
      //       begin: Alignment.centerLeft,
      //       end: Alignment.centerRight,
      //       colors: [
      //         Color(0xffA374F0),
      //         Color(0xffF16CA6),
      //       ],
      //     )),
      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 6),
      child: Container(
          width: 50,
          height: 40,
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
                  height: 6 + _animation.value,
                  width: 4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white
                          .withOpacity(0.9)),
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
            width: 4,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white.withOpacity(0.9)),
          )
        ],
      ),
    );
  }
}
