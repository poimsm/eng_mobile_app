import 'package:card_swiper/card_swiper.dart';
import 'package:eng_mobile_app/data/models/library.dart';
import 'package:eng_mobile_app/pages/home/home_controller.dart';
import 'package:eng_mobile_app/pages/library/library_controller.dart';
import 'package:eng_mobile_app/pages/multiple_videos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:line_icons/line_icons.dart';

class LibraryPage extends ConsumerStatefulWidget {
  const LibraryPage({Key? key, required this.totalWords}) : super(key: key);

  final int totalWords;

  @override
  LibraryPageState createState() => LibraryPageState();
}

class LibraryPageState extends ConsumerState<LibraryPage> {
  @override
  void initState() {
    super.initState();

    ref.read(libraryProvider.notifier).fetchVideos();
    ref.read(libraryProvider.notifier).fetchCards();
  }

  late LibraryState libraryState;

  Size size = Size.zero;

  @override
  Widget build(BuildContext context) {
    libraryState = ref.watch(libraryProvider);
    size = MediaQuery.of(context).size;
    return WillPopScope(
        onWillPop: () async {
          if (libraryState.isPlayingVideo) {
            ref.read(libraryProvider.notifier).toggleVideo();
            return false;
          }

          if (!libraryState.haveSavedWords) {
            Navigator.of(context).pop();
          }

          Navigator.of(context).pop({'words': libraryState.words, 'shouldBlink': libraryState.haveSavedWords});
          return true;
        },
        child: libraryState.isPlayingVideo
            ? MutipleVideos(
                totalWords:
                    libraryState.videos[libraryState.videoIndex].words.length,
                videos: libraryState.videos,
                activeIndex: libraryState.videoIndex,
                onNext: () {},
                onSaveWords: () {
                  ref.read(libraryProvider.notifier).saveVideoWords(
                      libraryState.videos[libraryState.videoIndex]);
                })
            : DefaultTabController(
                length: 2,
                child: Stack(
                  children: [
                    Scaffold(
                      appBar: AppBar(
                        leading: IconButton(
                          icon: Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () {
                            if (!libraryState.haveSavedWords) {
                              return Navigator.of(context).pop();
                            }
                            Navigator.of(context)
                                .pop({'words': libraryState.words, 'shouldBlink': libraryState.haveSavedWords});
                          },
                        ),
                        title: Text(
                          'Explore',
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                        actions: [
                          Center(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black.withOpacity(0.1),
                              ),
                              child: AnimatedDefaultTextStyle(
                                style: libraryState.animateWords
                                    ? TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      )
                                    : TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                duration: Duration(milliseconds: 200),
                                child: Text(
                                    '${widget.totalWords + libraryState.words.length} Words'),
                              ),
                            ),
                          )
                          // IconButton(onPressed: () {}, icon: Icon(Icons.search, color: Colors.white, size: 28))
                        ],
                        backgroundColor: Color(0xff6E5AA0),
                        elevation: 0,
                        bottom: TabBar(
                            indicatorWeight: 4.0,
                            indicatorColor: Colors.white,
                            indicatorSize: TabBarIndicatorSize.label,
                            tabs: [
                              Tab(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "CARDS",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                              Tab(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text("VIDEOS",
                                      style: TextStyle(fontSize: 16)),
                                ),
                              ),
                            ]),
                      ),
                      body: TabBarView(
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            libraryState.isLoading
                                ? Container(
                                    height: size.height,
                                    width: size.width,
                                    // color: Colors.black,
                                    child: SpinKitThreeBounce(
                                      color: Colors.grey,
                                      size: 40,
                                    ))
                                : SizedBox(
                                    height: 420,
                                    // color: Colors.green,
                                    child: _slides(),
                                  ),
                            _list(),
                          ]),
                    ),
                    // if(libraryState.haveSavedWords)Positioned(
                    //   bottom: 30,
                    //   left:15,
                    //   child: FadeInLeft(child: _notification()),
                    // )
                  ],
                )));
  }

  _notification() {
    return SizedBox(
        height: 60,
        width: 300,
        child: Card(
          child: Container(
            padding: EdgeInsets.only(left: 10),
            height: 60,
            child: Row(
              children: [
                Image.asset(
                  'assets/bookmark.png',
                  width: 30,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'You have collected ',
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
                Text(
                  '${libraryState.words.length} ',
                  style: TextStyle(fontSize: 20, color: Colors.black87),
                ),
                Text(
                  'words',
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ],
            ),
          ),
        ));
  }

  _slides() {
    return Container(
        // color: Color(0xffFBE5D6),
        color: Color(0xff6E5AA0),
        // color: Colors.deepPurple,
        // color: Colors.black87,
        height: 400,
        width: size.width,
        child: Swiper(
          index: 2,
          itemBuilder: (BuildContext context, int i) {
            return Container(
                decoration: BoxDecoration(
                    // border: Border.all(color: Colors.black12)
                    ),
                child: Stack(
                  children: [
                    Container(
                      height: 500,
                      width: 360,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white.withOpacity(1),
                      ),
                      // color: Color.fromARGB(255, 59, 34, 98).withOpacity(1),
                    ),
                    Positioned(
                      top: 20,
                      child: Container(
                          height: 380,
                          width: 360,
                          child: Image.asset(libraryState.cards[i].imageUrl,
                              fit: BoxFit.cover)),
                    ),
                    Positioned(
                      bottom: 12,
                      right: 0,
                      child: Container(
                        // color: Colors.red,
                        width: 360,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _collocationsBtn(libraryState.cards[i].examples),
                            // SizedBox(width: 30,),
                            _speakBtn(i),
                            // SizedBox(width: 30,),
                            _saveWordsBtn(libraryState.cards[i]),
                            // SizedBox(width: 10,),
                          ],
                        ),
                      ),
                    )
                  ],
                ));
            // return Image.network(
            //   "https://via.placeholder.com/288x188",
            //   fit: BoxFit.fill,
            // );
          },
          viewportFraction: 0.5,
          itemCount: 9,
          // containerHeight: 395,
          itemWidth: 360.0,
          itemHeight: 500.0,
          layout: SwiperLayout.TINDER,
        ));
  }

  _collocationsBtn(List<String> examples) {
    return InkWell(
      onTap: () {
        _presentActionSheet(examples);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        elevation: 5,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
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

  _speakBtn(int i) {
    return InkWell(
      onTap: () {
        if( i != 0) return;
        ref.read(homeProvider.notifier).playVoice('assets/ee04.mp3');
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        elevation: 10,
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
          ),
          child: Icon(LineIcons.volumeUp, color: Colors.black87, size: 33),
        ),
      ),
    );
  }

  _saveWordsBtn(InfoCard card) {
    return InkWell(
      onTap: () {
        ref.read(libraryProvider.notifier).saveCard(card);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        elevation: 10,
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
          ),
          child: Icon(card.saved ? Icons.bookmark : LineIcons.bookmark,
              color: Colors.black87, size: 33),
        ),
      ),
    );
  }

  _letrero() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: RichText(
        textAlign: TextAlign.left,
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
                text: 'The idea is that you add your',
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.normal,
                  fontSize: 19,
                )),
            TextSpan(
                text: ' own',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 25,
                  fontWeight: FontWeight.normal,
                )),
            TextSpan(
                text:
                    ' words that you find on TikTok or Instagram videos or even when you read a book, an article or listen to a podcast... All those words, phrasal verbs, native expressions, etc... can be added to your',
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.normal,
                  fontSize: 19,
                )),
            TextSpan(
                text: ' word list',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                )),
            TextSpan(
                text:
                    ' and then, based on an AI engine, the app will match a question so you can use your words while answering aloud, therefore you can expand your vocabulary to new',
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.normal,
                  fontSize: 19,
                )),
            TextSpan(
                text: ' heights!',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 28,
                  fontWeight: FontWeight.normal,
                )),
          ],
        ),
      ),
    );
  }

  _list() {
    return SizedBox(
      height: 650,
      child: GridView.count(
        childAspectRatio: 0.7,
        crossAxisCount: 2,
        children: List.generate(libraryState.videos.length, (index) {
          return Center(
            child: _videoItem(libraryState.videos[index], index),
          );
        }),
      ),
    );
  }

  _videoItem(ShortVideo video, int idx) {
    return InkWell(
      onTap: () {
        ref.read(libraryProvider.notifier).playVideo(video, idx);
        // ref.read(libraryProvider.notifier).toggleAnimateWord();
      },
      child: Container(
        padding: EdgeInsets.all(10),
        child: Image.asset(
          video.cover,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  void _presentActionSheet2(List<String> examples) async {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Container(
                width: size.width,
                height: size.height * 0.7,
                padding: EdgeInsets.only(top: 50, bottom: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: Stack(children: [
                  Container(
                    height: size.height * 0.5,
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
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: SizedBox(
                      width: size.width,
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 60,
                            width: size.width * 0.7,
                            decoration: BoxDecoration(
                              // color: Color(0xff735CAC),
                              color: Color(0xff262626),
                              // color: Color.fromARGB(219, 13, 191, 158),

                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                'Close',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ]));
          });
        });
  }

  void _presentActionSheet(List<String> examples) async {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Container(
                width: size.width,
                height: size.height * 0.4,
                padding: EdgeInsets.only(top: 50, bottom: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
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
