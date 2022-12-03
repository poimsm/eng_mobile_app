import 'dart:async';

import 'package:card_swiper/card_swiper.dart';
import 'package:eng_mobile_app/config.dart';
import 'package:eng_mobile_app/data/models/library.dart';
import 'package:eng_mobile_app/pages/home/home_controller.dart';
import 'package:eng_mobile_app/pages/layout/controller.dart';
import 'package:eng_mobile_app/pages/library/library_controller.dart';
import 'package:eng_mobile_app/pages/single_video.dart';
import 'package:eng_mobile_app/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class LibraryPage extends ConsumerStatefulWidget {
  const LibraryPage({Key? key, required this.totalSentences}) : super(key: key);

  final int totalSentences;

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
      ref
          .read(libraryProvider.notifier)
          .setTotalSentences(widget.totalSentences);
    });
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
            'sentences': libraryState.sentences,
          });
          return true;
        },
        child: Stack(
          children: [
            DefaultTabController(
                length: 2,
                child: Stack(
                  children: [
                    Scaffold(
                      appBar: AppBar(
                        leading: IconButton(
                          icon: Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () {
                            Navigator.of(context).pop({
                              'sentences': libraryState.sentences,
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
                                style: libraryState.animateSentences
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
                                    '${libraryState.sentenceCounter} Sentences'),
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
                                ? SizedBox(
                                    height: size.height,
                                    width: size.width,
                                    child: SpinKitThreeBounce(
                                      color: Colors.grey,
                                      size: 40,
                                    ))
                                : Container(
                                    color: Color(0xff6E5AA0),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 560,
                                          child: _slides(),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        _refreshCardBtn(),
                                      ],
                                    )),
                            _list(),
                          ]),
                    ),
                  ],
                )),
            if (libraryState.isPlayingVideo)
              Positioned(
                  top: 0,
                  left: 0,
                  child: SingleVideo(
                    enableFavoriteBtn: true,
                    video: libraryState.videos[libraryState.videoIndex],
                    onToggleFavorite: () {
                      final video =
                          libraryState.videos[libraryState.videoIndex];
                      ref
                          .read(libraryProvider.notifier)
                          .toggleFavoriteVideo(video);
                    },
                    onBack: (hasSavedSentences) async {
                      ref.read(libraryProvider.notifier).toggleVideo();
                      if (hasSavedSentences) {
                        await sleep(300);
                        ref
                            .read(libraryProvider.notifier)
                            .toggleAnimateTotalSentences();
                      }
                    },
                  ))
          ],
        ));
  }

  _refreshCardBtn() {
    return InkWell(
      onTap: () {
        ref.read(libraryProvider.notifier).fetchCards();
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9), shape: BoxShape.circle),
        child: Icon(LineIcons.syncIcon,
            size: 50, color: Colors.black.withOpacity(0.7)),
      ),
    );
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
          index: 0,
          itemBuilder: (BuildContext context, int i) {
            return Stack(
              children: [
                Container(
                  height: 500,
                  width: 360,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white.withOpacity(1),
                  ),
                ),
                Positioned(
                  top: 20,
                  child: SizedBox(
                      height: 380,
                      width: 360,
                      child: Config.MOCK
                          ? Image.asset(libraryState.cards[i].imageUrl,
                              fit: BoxFit.cover)
                          : Image.network(
                              libraryState.cards[i].imageUrl,
                              loadingBuilder: (BuildContext context,
                                  Widget child,
                                  ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) {
                                  return child;
                                }
                                return Container(
                                  color: Color(0xfff6f6f6),
                                  height: 380,
                                  width: 360,
                                  child: Icon(
                                    Icons.image,
                                    color: Color(0xffcccccc),
                                    size: 90,
                                  ),
                                );
                              },
                            )),
                ),
                Positioned(
                  bottom: 12,
                  right: 0,
                  child: SizedBox(
                    width: 360,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _collocationsBtn(libraryState.cards[i].collocations, i),
                        _speakBtn(libraryState.cards[i].voiceUrl),
                        _toggleFavCardBtn(libraryState.cards[i])
                      ],
                    ),
                  ),
                )
              ],
            );
          },
          viewportFraction: 0.5,
          itemCount: libraryState.cards.length,
          // containerHeight: 395,
          itemWidth: 360.0,
          itemHeight: 500.0,
          layout: SwiperLayout.TINDER,
        ));
  }

  _collocationsBtn(List<String> examples, int i) {
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
        if (libraryState.blocker) return;
        ref.read(libraryProvider.notifier).toggleAnimatedCardSpeakBtn();
        ref.read(libraryProvider.notifier).toggleBlocker(milliseconds: 1000);
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
                  color: Colors.black87,
                  size: libraryState.animateCardSpeakBtn ? 26 : 33)),
        ),
      ),
    );
  }

  _toggleFavCardBtn(InfoCard card) {
    return InkWell(
      onTap: () {
        if (libraryState.blocker) return;
        ref.read(libraryProvider.notifier).toggleFavoriteCard(card);
        context.read<Screen>().showToast(toastMsgBasedOnLength(
            length: card.sentences.length, willSave: !card.isFavorite!));
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
            shape: BoxShape.circle,
          ),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 30),
            curve: Curves.bounceInOut,
            child: Icon(card.isFavorite! ? Icons.bookmark : LineIcons.bookmark,
                color: Colors.black87,
                size: libraryState.animateCardFavBtn ? 26 : 33),
          ),
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
