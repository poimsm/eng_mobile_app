import 'package:eng_mobile_app/data/models/library.dart';
import 'package:eng_mobile_app/pages/home/home_controller.dart';
import 'package:eng_mobile_app/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_icons/line_icons.dart';

class InfoCardWidget extends ConsumerStatefulWidget {
  const InfoCardWidget({
    super.key,
    required this.enableFavoriteBtn,
    required this.card,
    this.onToggleFavorite,
    this.elevation = 5.0,
  });

  final bool enableFavoriteBtn;
  final InfoCard card;
  final VoidCallback? onToggleFavorite;
  final double elevation;

  @override
  InfoCardState createState() => InfoCardState();
}

class InfoCardState extends ConsumerState<InfoCardWidget> {
  Size size = Size.zero;
  bool savedSentences = false;
  bool pressedToggleFav = false;
  bool animateCardSpeakBtn = false;
  bool blocker = false;

  void toggleAnimatedCardSpeakBtn() async {
    setState(() => animateCardSpeakBtn = true);
    await sleep(80);
    setState(() => animateCardSpeakBtn = false);
  }

  void toggleBlocker({int milliseconds = 800}) async {
    setState(() => blocker = true);
    await sleep(milliseconds);
    setState(() => blocker = false);
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      child: Container(
          height: size.width * 1.1,
          width: size.width * 0.9,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/dev/card06.png', width: size.width * 0.8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _collocationsBtn(widget.card.collocations),
                  _speakBtn(widget.card.voiceUrl),
                ],
              ),
            ],
          )),
    );
  }

  _collocationsBtn(List<String> examples) {
    return InkWell(
      onTap: () {
        _presentExampleActionSheet(examples);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        elevation: widget.elevation,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 13),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
          ),
          child: Text(
            'Examples',
            style: TextStyle(
              fontSize: 19,
            ),
          ),
        ),
      ),
    );
  }

  _speakBtn(String url) {
    return InkWell(
      onTap: () {
        if (blocker) return;
        toggleAnimatedCardSpeakBtn();
        toggleBlocker(milliseconds: 1000);
        ref.read(homeProvider.notifier).playVoice(url);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        elevation: 10,
        child: Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
          ),
          child: AnimatedContainer(
              duration: const Duration(milliseconds: 30),
              curve: Curves.bounceInOut,
              child: Icon(LineIcons.volumeUp,
                  color: Colors.black87, size: animateCardSpeakBtn ? 26 : 33)),
        ),
      ),
    );
  }

  void _presentExampleActionSheet(List<String> examples) async {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Container(
                width: size.width,
                height: size.height * 0.5,
                padding: EdgeInsets.only(top: 50, bottom: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Container(
                  height: size.height * 0.3,
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                          examples.length,
                          (i) => Container(
                                margin: EdgeInsets.only(bottom: 25),
                                child: Text(
                                  '${i + 1}. ${examples[i]}',
                                  style: TextStyle(
                                      fontSize: 19, color: Colors.black87),
                                ),
                              )),
                    ),
                  ),
                ));
          });
        });
  }
}
