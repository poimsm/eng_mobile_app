import 'package:eng_mobile_app/data/models/activity.dart';
import 'package:eng_mobile_app/pages/word_detail/word_detail_page.dart';
import 'package:eng_mobile_app/pages/word_list/word_list_controller.dart';
import 'package:eng_mobile_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WordListPage extends ConsumerStatefulWidget {
  const WordListPage({super.key});

  @override
  WordListPageState createState() => WordListPageState();
}

class WordListPageState extends ConsumerState<WordListPage> {
  @override
  void initState() {
    ref.read(wordListProvider.notifier).retrieveWords();
    super.initState();
  }

  Size size = Size.zero;
  late WordListState wordListState;
  @override
  Widget build(BuildContext context) {
    wordListState = ref.watch(wordListProvider);
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
                _fox(),
                SizedBox(
                  height: 30,
                ),
                _wordList(),
              ],
            ),
            Positioned(
                left: 0,
                bottom: 30,
                child: Container(
                  color: Color(0xffF9F9F9),
                  padding: EdgeInsets.only(top: 20),
                  width: size.width,
                  child: Center(
                    child: _newWordBox(),
                  ),
                ))
          ],
        )));
  }

  _appbar() {
    return Container(
      height: 60,
      child: Row(children: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            size: 30,
          ),
        ),
        Text(
          'My words',
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xff222222)),
        )
      ]),
    );
  }

  _fox() {
    return Container(
      child: Column(children: [Image.asset('assets/fox.png'), _tipsBtn()]),
    );
  }

  _tipsBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black.withOpacity(0.7)),
          borderRadius: BorderRadius.circular(8)),
      child: Text(
        'Tap here for tips!',
        style: TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.7)),
      ),
    );
  }

  _wordList() {
    return SizedBox(
      height: size.height * 0.6,
      child: SingleChildScrollView(
        child: Column(
            children: List.generate(wordListState.words.length,
                (index) => _wordItem(wordListState.words[index]))),
      ),
    );
  }

  _wordItem(Word word) {
    return InkWell(
      onTap: () {
        print('Entrooooo');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WordDetailPage(
            isNewWord: false,
            word: word
          )),
        );
        // Navigator.pushNamed(context, Routes.WORD_DETAIL,
        //     arguments: {"word": word, "new_word": false});
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        width: size.width*0.8,
        child: Text(
          word.word,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22, color: Colors.black),
        ),
      ),
    );
  }

  _wordItem2(word) {
    return ListTile(
      title: Text(
        word,
        style: TextStyle(fontSize: 20, color: Colors.black),
      ),
    );
  }

  _newWordBox() {
    return InkWell(
      onTap: () {
        // Navigator.pushNamed(context, Routes.WORD_DETAIL);
        // Navigator.pushNamed(context, Routes.WORD_DETAIL,
        //     arguments: {"word": null, "new_word": false});

        print('_newWordBox');

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WordDetailPage(
            isNewWord: true,
            word: null
          )),
        );

        // MaterialPageRoute(builder: (context) => WordDetailPage(
        //     isNewWord: false,
        //     word: null
        //   ));
      },
      child: Container(
          width: size.width * 0.8,
          height: 65,
          // padding: EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
              color: Color(0xff6E5AA0),
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add, size: 30, color: Colors.white),
              Text(
                'Add word',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )
            ],
          )),
    );
  }
}
