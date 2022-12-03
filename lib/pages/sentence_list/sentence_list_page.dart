import 'dart:async';

import 'package:eng_mobile_app/data/models/activity.dart';
import 'package:eng_mobile_app/pages/layout/controller.dart';
import 'package:eng_mobile_app/pages/library/library_page.dart';
import 'package:eng_mobile_app/pages/sentence_detail/sentence_detail_page.dart';
import 'package:eng_mobile_app/pages/sentence_list/enums.dart';
import 'package:eng_mobile_app/pages/sentence_list/sentence_list_controller.dart';
import 'package:eng_mobile_app/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class SentenceListPage extends ConsumerStatefulWidget {
  const SentenceListPage({super.key});

  @override
  SentenceListPageState createState() => SentenceListPageState();
}

class SentenceListPageState extends ConsumerState<SentenceListPage> {
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 500), () {
      ref.read(sentenceListProvider.notifier).fetchSentences();
      ref.read(sentenceListProvider.notifier).toggleAnimatedSentenceBtn();
    });

    super.initState();
  }

  Size size = Size.zero;
  late SentenceListState sentenceListState;
  @override
  Widget build(BuildContext context) {
    sentenceListState = ref.watch(sentenceListProvider);
    size = MediaQuery.of(context).size;
    return SizedBox(
        height: size.height,
        width: size.width,
        child: SafeArea(
            child: Column(
          children: [
            _appbar(),
            // _title('YOURS'),
            // SizedBox(height: 200,),
            _mySentences(),
            Divider(
              height: 50,
            ),
            _title('LAST WORDS'),
            _history()
          ],
        )));
  }

  _title(String text) {
    return Container(
        width: size.width,
        padding: EdgeInsets.only(left: 20),
        child: Text(text,
            style: TextStyle(
                fontSize: 18,
                color: Colors.black87,
                fontWeight: FontWeight.bold)));
  }

  _mySentences() {
    return Column(
      children: [
        sentenceListState.isLoading
            ? _loadingSentences()
            : _scrolleableSentenceList(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [_getSentencesBtn(), _addSentenceBtn()],
        )
      ],
    );
  }

  _loadingSentences() {
    return SizedBox(
      width: size.width,
      height: size.height * 0.55,
      // color: Colors.red,
      child: Center(
          child: SpinKitThreeBounce(
        color: Colors.grey,
        size: 40,
      )),
    );
  }

  _scrolleableSentenceList() {
    Widget sentences = Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      width: size.width,
      height: size.height * 0.55,
      child: sentenceListState.sentences.isNotEmpty
          ? _sentenceList()
          : SizedBox(
              height: size.height * 0.55,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Oops… There are no sentences',
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.7), fontSize: 21)),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Tap',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black38,
                          // fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      SizedBox(
                        child: Image.asset(
                          'assets/add_grey_01.png',
                          width: 29,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'to add one',
                        style: TextStyle(fontSize: 18, color: Colors.black38),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                ],
              )),
    );

    return Stack(
      children: [
        sentences,
        if (sentenceListState.showListBlinker)
          Container(
              height: size.height * 0.5,
              width: size.width,
              color: Colors.blue.withOpacity(0.1))
      ],
    );
  }

  _history() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: size.width,
      height: size.height * 0.15,
      child: _historyList(),
    );
  }

  _historyList() {
    return ListView.builder(
        itemCount: sentenceListState.history.length,
        itemBuilder: (context, i) =>
            _historyItem(sentenceListState.history[i]));
  }

  _historyItem(HistoryItem item) {
    Widget questionChild;

    if (item.questionType == QuestionType.teacher) {
      List<String> questionSplit = item.questionText.split("[sentence]");

      questionChild = RichText(
        textAlign: TextAlign.left,
        text: TextSpan(
          children: [
            TextSpan(
                text: questionSplit[0],
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                )),
            TextSpan(
                text: questionSplit[1],
                style: TextStyle(
                  color: Color(0xff7562A5),
                  fontWeight: FontWeight.normal,
                  fontSize: 19,
                )),
            TextSpan(
                text: questionSplit[2],
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                )),
          ],
        ),
      );
    } else {
      questionChild = RichText(
        textAlign: TextAlign.left,
        text: TextSpan(
          children: [
            TextSpan(
                text: item.questionText,
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                )),
            TextSpan(
                text: ' ${item.sentenceText}  ',
                style: TextStyle(
                  color: Color(0xff7562A5),
                  fontWeight: FontWeight.normal,
                  fontSize: 19,
                )),
          ],
        ),
      );
    }

    return Container(
        margin: EdgeInsets.only(top: 20),
        width: double.infinity,
        child: questionChild);
  }

  _appbar() {
    return SizedBox(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.arrow_back,
                        size: 30,
                      ),
                    ),
                    Text(
                      'Words',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff222222)),
                    )
                  ],
                ),
              ],
            )
          ]),
          InkWell(
            onTap: () {
              ref.read(sentenceListProvider.notifier).deleteAllLocalSentences();
              // Navigator.pushNamed(context, Routes.STORE);
            },
            child: Container(
                padding: EdgeInsets.all(5),
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/user_16.png',
                  width: 60,
                )),
          ),
        ],
      ),
    );
  }

  _getSentencesBtn() {
    return InkWell(
        onTap: () async {
          // ref.read(sentenceListProvider.notifier).toggleListBlinker();
          // return;

          final resp = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => LibraryPage(
                    totalSentences: sentenceListState.sentences.length)),
          );

          if (resp != null) {
            ref
                .read(sentenceListProvider.notifier)
                .favoriteSentenceHandler(resp['sentences']);
            // if (resp['shouldBlink']) {
            //   ref.read(sentenceListProvider.notifier).toggleListBlinker();
            // }
          }
        },
        child: Image.asset(
          'assets/explore02.png',
          width: 165,
        ));
    // return Container(
    //   padding: EdgeInsets.symmetric(vertical: 14, horizontal: 30),
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(20),
    //     border: Border.all(color: Colors.black)
    //   ),
    //   child: Text('Get sentences', style: TextStyle(
    //     fontSize: 18,
    //     fontWeight: FontWeight.bold
    //   ),),
    // );
  }

  _addSentenceBtn() {
    bool animate = sentenceListState.animateAddSentenceBtn;
    return InkWell(
      onTap: () async {
        final resp = await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  SentenceDetailPage(isNewSentence: true, sentence: null)),
        );

        if (resp != null) {
          Timer(Duration(milliseconds: 300), () {
            context.read<Screen>().showToast(resp['toast'], seconds: 2);
          });
        }
      },
      child: AnimatedContainer(
        width: animate ? 65 : 60,
        height: animate ? 65 : 60,
        decoration: BoxDecoration(
            color: animate ? Colors.white : Color(0xff6E5AA0),
            // color: Color(0xff6E5AA0),
            shape: BoxShape.circle,
            border: Border.all(
                width: 3,
                color: Color(0xff6E5AA0).withOpacity(animate ? 0.8 : 0))),
        duration: const Duration(milliseconds: 400),
        // curve: Curves.elasticIn,
        child: AnimatedRotation(
          turns: animate ? 0.03 : 0.0,
          duration: const Duration(milliseconds: 300),
          child: Icon(
            Icons.add,
            // size: sentenceListState.animateAddSentenceBtn ? 45:37,
            size: 40,
            // color: Colors.white,
            color: animate ? Color(0xff6E5AA0) : Colors.white,
            // color: Colors.white.withOpacity(sentenceListState.animateAddSentenceBtn? 1: 0.8)
          ),
        ),
        // Icon(Icons.add, size: sentenceListState.animateAddSentenceBtn ? 42:37, color: Colors.white),
      ),
    );
  }

  _sentenceList() {
    return ListView.builder(
        itemCount: sentenceListState.sentences.length + 1,
        itemBuilder: (context, i) {
          if (i == sentenceListState.sentences.length) {
            return SizedBox(
              height: 100,
              width: 10,
            );
          }

          return _sentenceNormalItem(sentenceListState.sentences[i]);
        });
  }

  _sentenceNormalItem(Sentence sentence) {
    return InkWell(
      onTap: () async {
        final resp = await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  SentenceDetailPage(isNewSentence: false, sentence: sentence)),
        );

        if (resp != null) {
          Timer(Duration(milliseconds: 300), () {
            context.read<Screen>().showToast(resp['toast']);
          });
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        width: size.width * 0.8,
        child: Row(
          mainAxisAlignment: sentence.origin == SentenceOrigin.resource
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            if (sentence.origin == SentenceOrigin.resource)
              Container(width: 25),
            Text(
              sentence.type == SentenceType.group
                  ? getGroupHead(sentence.extras!)
                  : sentence.sentence,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, color: Color(0xff6E5AA0)),
            ),
            if (sentence.origin == SentenceOrigin.resource)
              SizedBox(
                width: 30,
                // child: Image.asset('assets/bookmark.png', width: 30),
              )
          ],
        ),
      ),
    );
  }
}
