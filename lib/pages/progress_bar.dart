import 'package:flutter/material.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar({super.key});

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> with SingleTickerProviderStateMixin {
  Size size = Size.zero;

  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: Duration(seconds: 25),
      vsync: this);

    animation = Tween<double>(
      begin: 0.0,
      end: 1.0
    ).animate(animationController);

    animationController.forward();
  }

   @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {      
      return Container(
        padding: EdgeInsets.only(
            left: size.width * 0.01, right: size.width * 0.01, top: 10),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12)),
            height: 40,
            width: size.width * 0.98,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(12)),
                  height: 40,
                  width: size.width * 0.98 * animation.value,
                ),
              ],
            )),
      );
      }
    );
  }
}