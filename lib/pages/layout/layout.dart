import 'package:flutter/material.dart';
import 'package:eng_mobile_app/pages/layout/controller.dart';
import 'package:eng_mobile_app/utils/helpers.dart';
import 'package:provider/provider.dart';
import './example.dart';

class Layout extends StatelessWidget {
  final Widget child;
  const Layout(this.child, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<Screen>(create: (context) {
      final provider = Screen();
      provider.screenSize = size;
      return Screen();
    }, builder: (context, _) {
      return Scaffold(
        body: Stack(
          children: [
            child,
            if (false)
              Positioned(top: 0, left: 0, child: _exampleChallengeModal(size)),
            Positioned(
                top: 0,
                left: 0,
                child: Consumer<Screen>(builder: (context, provider, child) {
                  return _loader(provider.loading, size);
                })),
            Positioned(
                top: 0,
                left: 0,
                child: Consumer<Screen>(builder: (context, provider, child) {
                  return _toast(
                      provider.renderToast, provider.toastMessage, size);
                }))
          ],
        ),
      );
    });
  }

  _exampleChallengeModal(Size size) {
    // List<String> aa = [
    // ];

    return Container(
      height: size.height,
      width: size.width,
      color: Colors.black.withOpacity(0.6),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: size.width * 0.85,
              child: RichText(
                textAlign: TextAlign.left,
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: '#Challenge:',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        )),
                    TextSpan(
                        text: ' classical ipsum!',
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 5),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 35),
              width: size.width * 0.85,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text('Tips',
                  //     style: TextStyle(
                  //         color: Colors.black.withOpacity(0.9),
                  //         fontSize: 18,
                  //         fontWeight: FontWeight.bold)),
                  Text(
                    'Try to use this sentence in your answer 👈',
                    style: TextStyle(fontSize: 18, color: Color(0xff595959)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Classical ipsum!',
                    style: TextStyle(fontSize: 28, color: Color(0xff595959)),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  _exampleTwoChallengeBtns()
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2)),
              child: Icon(
                Icons.close,
                color: Colors.white,
                size: 30,
              ),
            )
          ],
        ),
      ),
    );
  }

  _exampleChallengeModal2(Size size) {
    // List<String> aa = [
    // ];

    return Container(
      height: size.height,
      width: size.width,
      color: Colors.black.withOpacity(0.6),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Text('Hola mundo', style: TextStyle(color: Colors.white),),
            SizedBox(
              width: size.width * 0.85,
              child: RichText(
                textAlign: TextAlign.left,
                text: TextSpan(
                  // text: 'Hello ',
                  // style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                        text: '#Challenge:',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        )),
                    TextSpan(
                        text: ' classical ipsum!',
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 5),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 35),
              width: size.width * 0.85,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'Hello world how are you being doing today morning? Will it cost that much right?',
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.9),
                          fontSize: 24,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 20,
                  ),
                  RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: _sentenceList())),
                  SizedBox(
                    height: 20,
                  ),
                  _exampleChallengeBtn()
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2)),
              child: Icon(
                Icons.close,
                color: Colors.white,
                size: 30,
              ),
            )
          ],
        ),
      ),
    );
  }

  _sentenceList() {
    return List.generate(sentences.length, (i) {
      return TextSpan(
          text: ' ' + sentences[i]['text'],
          style: TextStyle(
            color: sentences[i]['active']
                ? Color(0xff6E5AA0)
                : sentences[i]['bold']
                    ? Colors.black54
                    : Colors.grey,
            fontWeight:
                sentences[i]['bold'] ? FontWeight.bold : FontWeight.normal,
            fontSize: sentences[i]['bold'] ? 22 : 18.5,
          ));
    });
  }

  _exampleTwoChallengeBtns() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _smallBtn('Meaning'),
        _smallBtnColor('Example'),
      ],
    );
  }

  _smallBtn(txt) {
    return Container(
      height: 50,
      width: 130,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black54)),
      child: Center(
          child: Text(
        txt,
        style: TextStyle(
            fontSize: 18, color: Colors.black54, fontWeight: FontWeight.bold),
      )),
    );
  }

  _smallBtnColor(txt) {
    return Container(
      height: 50,
      width: 130,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Color(0xff6E5AA0)),
      child: Center(
          child: Text(
        txt,
        style: TextStyle(
            fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
      )),
    );
  }

  _exampleChallengeBtn() {
    return Container(
      height: 50,
      width: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Color(0xff6E5AA0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.play_circle_fill, color: Colors.white),
          SizedBox(
            width: 10,
          ),
          Text(
            'Listen',
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  _infoSentenceModal(Size size) {
    return Container(
      height: size.height,
      width: size.width,
      color: Colors.black.withOpacity(0.65),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 400,
              width: size.width * 0.8,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6), color: Colors.white),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2)),
              child: Icon(
                Icons.close,
                color: Colors.white,
                size: 30,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _loader(bool isLoading, Size size) {
    return isLoading
        ? Container(
            width: size.width,
            height: size.height,
            color: Colors.white.withOpacity(0.5),
            child: Center(
              child: CircularProgressIndicator(color: Colors.black87),
            ),
          )
        : Container();
  }

  Widget _toast(bool showToast, String message, Size size) {
    return showToast
        ? SizedBox(
            height: size.height,
            width: size.width,
            child: Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 14),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Color(0xff555555).withOpacity(0.95)),
                child: Text(
                  message,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          )
        : Container();
  }

  _showToast(String message, context) async {
    await sleep(500);

    late BuildContext dialogContext;
    showDialog(
        context: context,
        barrierColor: Colors.transparent,
        barrierDismissible: false,
        builder: (_) {
          dialogContext = _;
          return Center(
            child: Material(
              type: MaterialType.transparency,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black.withOpacity(0.65)),
                child: Text(
                  message,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          );
        });

    await sleep(4000);
    Navigator.pop(dialogContext);
  }
}
