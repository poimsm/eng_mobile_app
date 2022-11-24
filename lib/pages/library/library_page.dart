import 'package:card_swiper/card_swiper.dart';
import 'package:eng_mobile_app/config.dart';
import 'package:eng_mobile_app/data/models/library.dart';
import 'package:eng_mobile_app/pages/home/home_controller.dart';
import 'package:eng_mobile_app/pages/library/library_controller.dart';
import 'package:eng_mobile_app/pages/single_video.dart';
import 'package:eng_mobile_app/utils/helpers.dart';
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

    Future.delayed(Duration(seconds: 0), () {
      ref.read(libraryProvider.notifier).fetchCards();
      ref.read(libraryProvider.notifier).fetchVideos();
      ref.read(libraryProvider.notifier).setTotalWords(widget.totalWords);
    });

    // ref.read(libraryProvider.notifier).fetchVideos();
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

          Navigator.of(context).pop({
            'words': libraryState.words,
          });
          return true;
        },
        child: libraryState.isPlayingVideo
            ? SingleVideo(
                enableFavoriteBtn: true,
                video: libraryState.videos[libraryState.videoIndex],
                onToggleFavorite: () {
                  final video = libraryState.videos[libraryState.videoIndex];
                  ref.read(libraryProvider.notifier).toggleFavoriteVideo(video);
                },
                onBack: (hasSavedWords) async {
                  ref.read(libraryProvider.notifier).toggleVideo();
                  if (hasSavedWords) {
                    await sleep(300);
                    ref.read(libraryProvider.notifier).toggleAnimateWord();
                  }
                },
              )
            : DefaultTabController(
                length: 2,
                child: Stack(
                  children: [
                    Scaffold(
                      appBar: AppBar(
                        leading: IconButton(
                          icon: Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () {
                            Navigator.of(context).pop({
                              'words': libraryState.words,
                            });
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
                                child:
                                    Text('${libraryState.wordCounter} Words'),
                              ),
                            ),
                          )
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
                  ],
                )));
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
                          child: Config.MOCK
                              ? Image.asset(libraryState.cards[i].imageUrl,
                                  fit: BoxFit.cover)
                              : Image.network(libraryState.cards[i].imageUrl,
                                  fit: BoxFit.cover)),
                    ),
                    Positioned(
                      bottom: 12,
                      right: 0,
                      child: SizedBox(
                        width: 360,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _collocationsBtn(
                                libraryState.cards[i].collocations),
                            _speakBtn(i),
                            _saveWordsBtn(libraryState.cards[i]),
                          ],
                        ),
                      ),
                    )
                  ],
                ));
          },
          viewportFraction: 0.5,
          itemCount: libraryState.cards.length,
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
        if (i != 0) return;
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
        ref.read(libraryProvider.notifier).toggleFavoriteCard(card);
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
          child: Icon(card.isFavorite! ? Icons.bookmark : LineIcons.bookmark,
              color: Colors.black87, size: 33),
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
      },
      child: Container(
          padding: EdgeInsets.all(10),
          child: Config.MOCK
              ? Image.asset(
                  video.cover,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )
              : Image.network(
                  video.cover,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )),
    );
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
