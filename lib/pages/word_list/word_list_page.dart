import 'dart:async';

import 'package:eng_mobile_app/data/models/activity.dart';
import 'package:eng_mobile_app/pages/layout/controller.dart';
import 'package:eng_mobile_app/pages/library/library_page.dart';
import 'package:eng_mobile_app/pages/word_detail/word_detail_page.dart';
import 'package:eng_mobile_app/pages/word_list/enums.dart';
import 'package:eng_mobile_app/pages/word_list/word_list_controller.dart';
import 'package:eng_mobile_app/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class WordListPage extends ConsumerStatefulWidget {
  const WordListPage({super.key});

  @override
  WordListPageState createState() => WordListPageState();
}

class WordListPageState extends ConsumerState<WordListPage> {
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 500), () {
      ref.read(wordListProvider.notifier).fetchWords();
      ref.read(wordListProvider.notifier).toggleAnimatedWordBtn();
    });

    super.initState();
  }

  Size size = Size.zero;
  late WordListState wordListState;
  @override
  Widget build(BuildContext context) {
    wordListState = ref.watch(wordListProvider);
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
            _myWords(),
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

  _myWords() {
    return Column(
      children: [
        wordListState.isLoading ? _loadingWords() : _scrolleableWordList(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [_getWordsBtn(), _addWordBtn()],
        )
      ],
    );
  }

  _loadingWords() {
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

  _scrolleableWordList() {
    Widget words = Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      width: size.width,
      height: size.height * 0.55,
      child: wordListState.words.isNotEmpty
          ? _wordList()
          : SizedBox(
              height: size.height * 0.55,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Oops… There are no words',
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
        words,
        if (wordListState.showListBlinker)
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
        itemCount: wordListState.history.length,
        itemBuilder: (context, i) => _historyItem(wordListState.history[i]));
  }

  _historyItem(HistoryItem item) {
    Widget questionChild;

    if (item.questionType == QuestionType.teacher) {
      List<String> questionSplit = item.questionText.split("[word]");

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
                text: ' ${item.wordText}  ',
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
              ref.read(wordListProvider.notifier).deleteAllLocalWords();
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

  _getWordsBtn() {
    return InkWell(
        onTap: () async {
          // ref.read(wordListProvider.notifier).toggleListBlinker();
          // return;

          final resp = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    LibraryPage(totalWords: wordListState.words.length)),
          );

          if (resp != null) {
            ref
                .read(wordListProvider.notifier)
                .favoriteWordHandler(resp['words']);
            // if (resp['shouldBlink']) {
            //   ref.read(wordListProvider.notifier).toggleListBlinker();
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
    //   child: Text('Get words', style: TextStyle(
    //     fontSize: 18,
    //     fontWeight: FontWeight.bold
    //   ),),
    // );
  }

  _addWordBtn() {
    bool animate = wordListState.animateAddWordBtn;
    return InkWell(
      onTap: () async {
        final resp = await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  WordDetailPage(isNewWord: true, word: null)),
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
            // size: wordListState.animateAddWordBtn ? 45:37,
            size: 40,
            // color: Colors.white,
            color: animate ? Color(0xff6E5AA0) : Colors.white,
            // color: Colors.white.withOpacity(wordListState.animateAddWordBtn? 1: 0.8)
          ),
        ),
        // Icon(Icons.add, size: wordListState.animateAddWordBtn ? 42:37, color: Colors.white),
      ),
    );
  }

  _wordList() {
    return ListView.builder(
        itemCount: wordListState.words.length + 1,
        itemBuilder: (context, i) {
          if (i == wordListState.words.length) {
            return SizedBox(
              height: 100,
              width: 10,
            );
          }

          return _wordNormalItem(wordListState.words[i]);
        });
  }

  _wordNormalItem(Word word) {
    return InkWell(
      onTap: () async {
        final resp = await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  WordDetailPage(isNewWord: false, word: word)),
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
          mainAxisAlignment: word.origin == WordOrigin.resource
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            if (word.origin == WordOrigin.resource) Container(width: 25),
            Text(
              word.type == WordType.group
                  ? getGroupHead(word.extras!)
                  : word.word,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, color: Color(0xff6E5AA0)),
            ),
            if (word.origin == WordOrigin.resource)
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
