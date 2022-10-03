import 'package:carousel_slider/carousel_slider.dart';
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
                  height: 10,
                ),
                SizedBox(
                  height: size.height*0.8,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        _fox(),
                        SizedBox(
                          height: 30,
                        ),
                        ..._wordList(),
                        SizedBox(height: 100)

                      ],
                    ),
                  ),
                )
                // _fox(),
                // SizedBox(
                //   height: 30,
                // ),
                // _wordList(),
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
              'My words',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff222222)),
            )
          ]),
          // Container(),
          Container(
            padding: EdgeInsets.all(5),
            child: Image.asset('assets/store11.png', width: 55,)),
          if(false)Container(
            padding: EdgeInsets.only(right: 10, top: 7),
            // child: Icon(Icons.store_outlined, size: 50),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
              decoration: BoxDecoration(
                color: Color(0xffF1F1F1),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                children: [
                  Text('Get more', style: TextStyle(
                    fontSize: 15,
                    color: Colors.black87
                  ),),
                  SizedBox(width: 5,),
                  Image.asset('assets/store.png', width: 40,),
                ],
              )),
          )
        ],        
      ),
    );
  }

    _fox4() {
    return CarouselSlider(
          options: CarouselOptions(
            height: 200.0,
            viewportFraction: 1,
            ),
          items: [1,2,3,4,5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                        return Container(
                            width: size.width,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.yellow),
                            color: Colors.red,
                            ),                         
                        );
              });
          }).toList(),
        );
  }

   _fox() {
    return Column(
      children: [
        CarouselSlider(
              options: CarouselOptions(
                height: 180.0,
                viewportFraction: 1,
                ),
              items: [1,2,3].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                            return Column(children: [
                                      Container(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 35),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(35)
                ),
                child: Column(children: [
                  SizedBox(
                    width: size.width*0.6,
                    child: Text('Hello world nice done?', style: TextStyle(
                      fontSize: 20,
                      color: Colors.black54
                    ),),
                  ),
                  SizedBox(height: 20,),
                  Image.asset('assets/audio_bar_02.png', width: 200,)]),
              ),
                            ]);
                  });
              }).toList(),
            ),
             SizedBox(height: 0,),
          _bullets()
      ],
    );
  }

  // _fox() {
  //   return CarouselSlider(
  //     options: CarouselOptions(height: 400.0),
  //     items: [1,2,3,4,5].map((i) {
  //       return Builder(
  //         builder: (BuildContext context) {
  //           return Column(
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         Container(
  //           padding: EdgeInsets.symmetric(horizontal: 50, vertical: 35),
  //           decoration: BoxDecoration(
  //             border: Border.all(color: Colors.black12),
  //             borderRadius: BorderRadius.circular(40)
  //           ),
  //           child: Column(children: [
  //             SizedBox(
  //               width: size.width*0.6,
  //               child: Text('Hello world nice done?', style: TextStyle(
  //                 fontSize: 20,
  //                 color: Colors.black54
  //               ),),
  //             ),
  //             SizedBox(height: 20,),
  //             Image.asset('assets/audio_bar_02.png', width: 200,)]),
  //         ),
  //         SizedBox(height: 10,),
  //         _bullets()
  //       ],
  //     );
  //   );
  //         },
  //       );
  //     }
  // }

  _bullets() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _bullet(true),
        SizedBox(width: 10,),
        _bullet(false),
        SizedBox(width: 10,),
        _bullet(false)
        
      ],
    );
  }

  _bullet(asd) {
    return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: asd? Color(0xff6E5AA0): Colors.transparent,
        border: Border.all(color: asd? Colors.transparent :Colors.black26)
      ),
    );
  }

  _fox2() {
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
    return List.generate(wordListState.words.length,
              (index) => _wordItem(wordListState.words[index]));
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
