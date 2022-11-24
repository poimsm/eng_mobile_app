import 'package:eng_mobile_app/config.dart';
import 'package:eng_mobile_app/data/models/library.dart';
import 'package:eng_mobile_app/pages/layout/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class MultipleVideos extends ConsumerStatefulWidget {
  const MultipleVideos(
      {super.key,
      required this.videos,
      required this.activeIndex,
      this.totalWords = 3,
      required this.onNext,
      required this.onSaveWords});

  // final VoidCallback onExit;
  final List<ShortVideo> videos;
  final int activeIndex;
  final VoidCallback onNext;
  final VoidCallback onSaveWords;
  final int totalWords;

  @override
  MultipleVideosState createState() => MultipleVideosState();
}

class MultipleVideosState extends ConsumerState<MultipleVideos> {
  Size size = Size.zero;
  bool savedWord = false;

  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = Config.MOCK
        ? VideoPlayerController.asset(widget.videos[widget.activeIndex].url)
        : VideoPlayerController.network(widget.videos[widget.activeIndex].url);
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
        height: size.height,
        width: size.width,
        color: Colors.black,
        child: SafeArea(
            child: Stack(children: [
          SizedBox(
            height: size.height,
            width: size.width,
          ),
          // IconButton(
          //   onPressed: () {},
          //   icon: Icon(Icons.arrow_back, color: Colors.white, size: 30)),
          _video(),
          Positioned(
            left: 0,
            bottom: 50,
            child: _ctrlBtns(),
          ),
        ])));
  }

  _video() {
    return SizedBox(
      height: size.height * 0.95,
      child: Center(
        child: FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  _ctrlBtns() {
    return Container(
      width: size.width,
      height: size.height * 0.15,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        _collect(),
        _next()
        // _collectWordsBtn(),
      ]),
    );
  }

  _collect() {
    return InkWell(
      onTap: () {
        widget.onSaveWords();
        context.read<Screen>().showToast('${widget.totalWords} word saved');
        savedWord = true;
        setState(() {});
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 11, horizontal: 25),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white.withOpacity(0.8)),
            borderRadius: BorderRadius.circular(10),
            color: Colors.black.withOpacity(0.05)),
        child: Row(
          children: [
            Icon(
              savedWord ? Icons.bookmark : LineIcons.bookmark,
              color: Colors.white,
              size: 30,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              savedWord ? 'Saved' : 'Save Words',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 18),
            )
          ],
        ),
      ),
    );
  }

  _next2() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white.withOpacity(0.8)),
          borderRadius: BorderRadius.circular(10),
          color: Colors.black.withOpacity(0.05)),
      child: Row(
        children: [
          Text(
            'Questions',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
          )
        ],
      ),
    );
  }

  _next() {
    return InkWell(
      onTap: () => widget.onNext(),
      child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white.withOpacity(0.8)),
              // shape: BoxShape.circle,
              borderRadius: BorderRadius.circular(20),
              color: Colors.black.withOpacity(0.1)),
          child: Icon(Icons.chevron_right,
              color: Colors.white.withOpacity(0.9), size: 35)),
    );
  }

  _collectWordsBtn() {
    return InkWell(
      onTap: () {
        // ref.read(homeProvider.notifier).stopVideo();
        // ref.read(homeProvider.notifier).collectWords();
      },
      child: Container(
        width: 350,
        padding: EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(0xff8D57FF).withOpacity(1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.download, color: Colors.white, size: 30),
                SizedBox(
                  width: 15,
                ),
                Text(
                  'Collect Words',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            _onNextBtn4()
          ],
        ),
      ),
    );
  }

  _onNextBtn4() {
    return InkWell(
      onTap: () {
        // ref.read(homeProvider.notifier).collectWords();
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          // border: Border.all(color: Colors.white.withOpacity(0.1)),
          shape: BoxShape.circle,
          color: Colors.white.withOpacity(0.2),
        ),
        child: Icon(Icons.chevron_right, color: Colors.white, size: 40),
      ),
    );
  }
}
