import 'package:eng_mobile_app/config.dart';
import 'package:eng_mobile_app/data/models/library.dart';
import 'package:eng_mobile_app/pages/layout/controller.dart';
import 'package:eng_mobile_app/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class SingleVideo extends ConsumerStatefulWidget {
  const SingleVideo(
      {super.key,
      required this.enableFavoriteBtn,
      required this.video,
      this.onToggleFavorite,
      required this.onBack});

  final bool enableFavoriteBtn;
  final ShortVideo video;
  final VoidCallback? onToggleFavorite;
  final Function(bool) onBack;

  @override
  SingleVideoState createState() => SingleVideoState();
}

class SingleVideoState extends ConsumerState<SingleVideo> {
  Size size = Size.zero;
  bool savedWords = false;
  bool pressedToggleFav = false;

  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = Config.MOCK
        ? VideoPlayerController.asset(widget.video.url)
        : VideoPlayerController.network(widget.video.url);
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.play();

    if (widget.enableFavoriteBtn) {
      savedWords = widget.video.isFavorite!;
    }
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
          _video(),
          Positioned(
            left: 10,
            top: 0,
            child: _title(),
          ),
          Positioned(
            left: 0,
            bottom: 50,
            child: _ctrlBtns(),
          ),
        ])));
  }

  _back() {
    return IconButton(
        onPressed: () {
          widget.onBack(pressedToggleFav);
        },
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: 25,
        ));
  }

  _title() {
    return SizedBox(
      child: Row(
        children: [
          _back(),
          SizedBox(
            width: 5,
          ),
          Text(
            'Stop saying very...',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
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
    return SizedBox(
      width: size.width,
      height: size.height * 0.15,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        _collocations(),
        if (widget.enableFavoriteBtn) _saveFavoriteBtn(),
      ]),
    );
  }

  _collocations() {
    return InkWell(
      onTap: () {
        _presentActionSheet(widget.video.collocations);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white.withOpacity(0.8)),
            borderRadius: BorderRadius.circular(10),
            color: Colors.black.withOpacity(0.05)),
        child: Row(
          children: [
            Text(
              'EXAMPLES',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 17),
            )
          ],
        ),
      ),
    );
  }

  _saveFavoriteBtn() {
    return InkWell(
      onTap: () {
        pressedToggleFav = !pressedToggleFav;
        widget.onToggleFavorite!();
        context.read<Screen>().showToast(toastMsgBasedOnLength(
            length: widget.video.words.length, willSave: !savedWords));
        savedWords = !savedWords;
        setState(() {});
      },
      child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white.withOpacity(0)),
              borderRadius: BorderRadius.circular(20),
              color: Colors.white.withOpacity(0.7)),
          child: Icon(savedWords ? Icons.bookmark : Icons.bookmark_outline,
              color:
                  savedWords ? Colors.black87 : Colors.black.withOpacity(0.9),
              size: 35)),
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
