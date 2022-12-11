import 'package:eng_mobile_app/config.dart';
import 'package:eng_mobile_app/data/models/activity.dart';
import 'package:eng_mobile_app/data/models/library.dart';
import 'package:eng_mobile_app/pages/home/home_controller.dart';
import 'package:eng_mobile_app/pages/single_video.dart';
import 'package:eng_mobile_app/pages/sentence_detail/sentence_detail_controller.dart';
import 'package:eng_mobile_app/pages/sentence_list/enums.dart';
import 'package:eng_mobile_app/pages/sentence_list/sentence_list_controller.dart';
import 'package:eng_mobile_app/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:line_icons/line_icons.dart';

class SentenceDetailPage extends ConsumerStatefulWidget {
  const SentenceDetailPage(
      {super.key, this.isNewSentence = false, this.sentence});

  final Sentence? sentence;
  final bool isNewSentence;

  @override
  SentenceDetailPageState createState() => SentenceDetailPageState();
}

class SentenceDetailPageState extends ConsumerState<SentenceDetailPage> {
  bool meaningSwitch = true;

  late TextEditingController sentenceCtrl;
  late TextEditingController meaningCtrl;
  final _focusWord = FocusNode();
  final _focusMeaning = FocusNode();

  @override
  void initState() {
    super.initState();

    sentenceCtrl = TextEditingController();
    meaningCtrl = TextEditingController();

    _focusWord.addListener(_onFocusWordChange);
    _focusMeaning.addListener(_onFocusMeaningChange);

    if (!widget.isNewSentence) {
      if (widget.sentence!.type == SentenceType.group) {
        sentenceCtrl.text = getGroupHead(widget.sentence!.extras!);
        meaningCtrl.text = getGroupFullTail(widget.sentence!.extras!);
      } else {
        sentenceCtrl.text = widget.sentence!.sentence;
        meaningCtrl.text = widget.sentence!.meaning ?? '';
      }
    }
  }

  @override
  void dispose() {
    sentenceCtrl.dispose();
    meaningCtrl.dispose();
    _focusWord.dispose();
    _focusMeaning.dispose();
    super.dispose();
  }

  void _onFocusWordChange() {
    ref
        .read(sentenceDetailProvider.notifier)
        .setWordTextFieldActive(_focusWord.hasFocus);
  }

  void _onFocusMeaningChange() {
    ref
        .read(sentenceDetailProvider.notifier)
        .setMeaningTextFieldActive(_focusMeaning.hasFocus);
  }

  Size size = Size.zero;
  bool showBanner = true;
  Map args = {};

  late SentenceDetailState sentenceDetailState;

  @override
  Widget build(BuildContext context) {
    sentenceDetailState = ref.watch(sentenceDetailProvider);

    size = MediaQuery.of(context).size;
    showBanner = widget.sentence == null ||
        widget.sentence!.origin != SentenceOrigin.resource;

    Widget solution = _meaningInput();

    if (widget.sentence != null &&
        widget.sentence!.origin == SentenceOrigin.resource) {
      if (widget.sentence!.sourceType == SourceType.infoCard) {
        solution = _solutionCard(widget.sentence!.infoCard!);
      }

      if (widget.sentence!.sourceType == SourceType.shortVideo) {
        solution = _solutionVideo(widget.sentence!.shortVideo!);
      }
    }

    return WillPopScope(
      onWillPop: () async {
        if (sentenceDetailState.showVideo) {
          ref.read(sentenceDetailProvider.notifier).setShowVideo(false);
          return false;
        }
        return true;
      },
      child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              SafeArea(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    _appbar(),
                    SizedBox(height: 10),
                    if (showBanner) _banner(),
                    SizedBox(height: 20),
                    _sentenceInput(),
                    SizedBox(height: 45),
                    solution,
                  ],
                ),
              )),
              if (sentenceDetailState.showVideo)
                SingleVideo(
                    enableFavoriteBtn: false,
                    video: widget.sentence!.shortVideo!,
                    onBack: (_) {
                      ref
                          .read(sentenceDetailProvider.notifier)
                          .setShowVideo(false);
                    }),
              if (sentenceDetailState.isLoading)
                Positioned(
                  top: 0,
                  left: 0,
                  child: _loading(),
                )
            ],
          )),
    );
  }

  _loading() {
    return Container(
      height: size.height,
      width: size.width,
      color: Colors.white.withOpacity(0.7),
      child: SpinKitRing(
        size: 40,
        lineWidth: 4,
        color: Colors.black87,
      ),
    );
  }

  _banner() {
    return Container(
        width: size.width,
        height: 70,
        // color: Color(0xffFFC000),
        color: Colors.greenAccent,
        // color: Colors.green,
        child: Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Image.asset(
              'assets/questions01.png',
              width: 35,
              color: Colors.white,
            ),
            SizedBox(
              width: 15,
            ),
            SizedBox(
              width: size.width * 0.75,
              child: RichText(
                textAlign: TextAlign.left,
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: "We'll ask you questions based on",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 19,
                        )),
                    TextSpan(
                        text: ' your',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        )),
                    TextSpan(
                        text: ' words',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 19,
                        )),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  _appbar() {
    return SizedBox(
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            IconButton(
              onPressed: () async {
                FocusScope.of(context).unfocus();
                await sleep(50);
                Navigator.pop(context);
              },
              icon: Icon(Icons.close, size: 30, color: Colors.black87),
            )
          ]),
          Row(
            children: [
              // if (!widget.isNewSentence)
              //   Padding(
              //     padding: EdgeInsets.only(right: 15),
              //     child: IconButton(
              //       onPressed: () {
              //         ref
              //             .read(sentenceListProvider.notifier)
              //             .deleteSentence(widget.sentence!.id);
              //         Navigator.pop(context, {'toast': 'Sentence deleted'});
              //       },
              //       icon:
              //           Icon(LineIcons.trash, size: 35, color: Colors.black54),
              //       // icon: Icon(Icons.delete_outline, size: 35, color: Colors.black54),
              //     ),
              //   ),
              if (!widget.isNewSentence)
                Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: _deleteBtn(),
                ),
              if (widget.isNewSentence)
                Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: _saveBtn(),
                ),
              if (!widget.isNewSentence &&
                  widget.sentence!.origin != SentenceOrigin.resource)
                Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: _editBtn(),
                )
            ],
          ),
        ],
      ),
    );
  }

  _sentenceInput() {
    return Column(
      children: [
        SizedBox(
          width: size.width * 0.81,
          child: Row(
            children: [
              Text(
                'Word or phrase',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 21, color: Colors.black54),
              ),
              IconButton(
                onPressed: () {
                  ref.read(homeProvider.notifier).speak(sentenceCtrl.text);
                },
                icon: Icon(Icons.volume_down_outlined,
                    size: 30, color: Colors.black54),
              ),
            ],
          ),
        ),
        Container(
          width: size.width * 0.85,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          decoration: BoxDecoration(
              color: Color(0xffF0F0F0F0),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                  color: Colors.greenAccent.withOpacity(
                      sentenceDetailState.wordTextFieldActive ? 1 : 0),
                  width: 2)),
          child: TextField(
            focusNode: _focusWord,
            enabled: widget.sentence == null ||
                (widget.sentence != null &&
                    widget.sentence!.origin != SentenceOrigin.resource),
            maxLines: 1,
            maxLength: 20,
            textCapitalization: TextCapitalization.sentences,
            style: TextStyle(fontSize: widget.isNewSentence ? 20 : 20),
            decoration: InputDecoration(
              counter: Offstage(),
              hintText: 'Example: Give it a shot',
              counterStyle: TextStyle(fontSize: 15, color: Colors.black38),
              hintStyle: TextStyle(color: Colors.black26),
              border: InputBorder.none,
              // focusedBorder: UnderlineInputBorder(
              //         borderSide: BorderSide(color: Colors.black),
              //      ),
            ),
            controller: sentenceCtrl,
            onChanged: (_) {
              ref.read(sentenceDetailProvider.notifier).checkEnableToSaveOrEdit(
                  sentenceCtrl.text,
                  meaningCtrl.text,
                  widget.isNewSentence,
                  widget.sentence);
            },
          ),
        ),
      ],
    );
  }

  _solutionVideo(ShortVideo video) {
    return Column(
      children: [
        SizedBox(
          width: size.width * 0.8,
          child: Text(
            'Solution:',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 21, color: Colors.black54),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: Stack(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Config.MOCK
                      ? Image.asset(
                          video.cover,
                          width: size.width * 0.65,
                          height: size.width * 1,
                          fit: BoxFit.cover,
                        )
                      : Image.network(
                          video.cover,
                          width: size.width * 0.65,
                          height: size.width * 1,
                          fit: BoxFit.cover,
                        )),
              Positioned(
                child: Container(
                  width: size.width * 0.65,
                  height: size.width * 1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black.withOpacity(0.2),
                  ),
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        ref
                            .read(sentenceDetailProvider.notifier)
                            .setShowVideo(true);
                      },
                      child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.9),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.play_arrow, size: 50)),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  _solutionCard(InfoCard card) {
    return Column(
      children: [
        SizedBox(
          width: size.width * 0.8,
          child: Text(
            'Solution:',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 21, color: Colors.black54),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.black12)),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Config.MOCK
                    ? Image.asset(
                        card.imageUrl,
                        width: size.width * 0.8,
                      )
                    : Image.network(
                        card.imageUrl,
                        width: size.width * 0.8,
                      ))),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _examplesCardBtn(card.collocations),
            _speakCardBtn(),
          ],
        ),
        SizedBox(height: 50),
      ],
    );
  }

  _speakCardBtn() {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(100),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        elevation: 7,
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
          ),
          child: Icon(LineIcons.volumeUp, color: Colors.black87, size: 32),
        ),
      ),
    );
  }

  _examplesCardBtn(List<String> examples) {
    return InkWell(
      onTap: () {
        _presentActionSheet(examples);
      },
      borderRadius: BorderRadius.circular(5),
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
              fontSize: 18.5,
            ),
          ),
        ),
      ),
    );
  }

  _meaningInput() {
    String exampleMeaning = '''
 Add a definition, an example sentence or any text that help you to remember! ✌️

Example: Yeah, I'll give it a shot, it means to try to do
                ''';
    return Column(
      children: [
        SizedBox(
          width: size.width * 0.81,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Solution',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 21, color: Colors.black54),
              ),
              // SizedBox(width: size.width*0.3,),
              // CupertinoSwitch(
              //   activeColor: Color(0xff6E5AA0).withOpacity(0.8),
              //   value: meaningSwitch,
              //   onChanged: (value) {
              //     setState(() {
              //       meaningSwitch = value;
              //     });
              //   },
              // ),
            ],
          ),
        ),
        if (meaningSwitch)
          Container(
            width: size.width * 0.85,
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: BoxDecoration(
                color: Color(0xffF0F0F0F0),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                    color: Colors.greenAccent.withOpacity(
                        sentenceDetailState.meaningTextFieldActive ? 1 : 0),
                    width: 2)),
            child: TextField(
              focusNode: _focusMeaning,
              maxLines: 10,
              // maxLength: 200,
              textCapitalization: TextCapitalization.sentences,
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(
                counterStyle: TextStyle(fontSize: 15, color: Colors.black38),
                hintText: exampleMeaning.trim(),
                hintStyle: TextStyle(color: Colors.black26),
                border: InputBorder.none,
              ),
              controller: meaningCtrl,
              onChanged: (_) {
                ref
                    .read(sentenceDetailProvider.notifier)
                    .checkEnableToSaveOrEdit(
                        sentenceCtrl.text,
                        meaningCtrl.text,
                        widget.isNewSentence,
                        widget.sentence);
              },
            ),
          ),
      ],
    );
  }

  _saveBtn() {
    return InkWell(
      onTap: () async {
        if (!sentenceDetailState.enableToSaveOrEdit) return;
        final sentence = await ref
            .read(sentenceDetailProvider.notifier)
            .createSentence(
                {'sentence': sentenceCtrl.text, 'meaning': meaningCtrl.text});

        if (sentence == null) return;

        ref.read(sentenceListProvider.notifier).addSentenceUI(sentence);
        ref
            .read(sentenceListProvider.notifier)
            .addUserSentence(sentence.sentence);

        if (!mounted) return;
        FocusScope.of(context).unfocus();
        await sleep(50);
        Navigator.pop(context, {'toast': 'Word added'});
      },
      child: Container(
          height: 40,
          padding: EdgeInsets.symmetric(horizontal: 17),
          decoration: BoxDecoration(
              color: Color(0xff444444).withOpacity(
                  sentenceDetailState.enableToSaveOrEdit ? 1 : 0.2),
              borderRadius: BorderRadius.circular(8)),
          child: Center(
            child: Text(
              widget.isNewSentence ? 'Save' : 'Save',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          )),
    );
  }

  _editBtn() {
    return InkWell(
      onTap: () async {
        if (!sentenceDetailState.enableToSaveOrEdit) return;

        final sentence =
            await ref.read(sentenceDetailProvider.notifier).updateSentence({
          'id': widget.sentence!.id,
          'sentence': sentenceCtrl.text,
          'meaning': meaningCtrl.text
        });

        if (sentence == null) return;

        ref.read(sentenceListProvider.notifier).editSentenceUI(sentence);

        if (!mounted) return;
        FocusScope.of(context).unfocus();
        await sleep(50);
        Navigator.pop(context, {'toast': 'Saved'});
      },
      child: Container(
          height: 40,
          padding: EdgeInsets.symmetric(horizontal: 17),
          decoration: BoxDecoration(
              color: Color(0xff444444).withOpacity(
                  sentenceDetailState.enableToSaveOrEdit ? 1 : 0.2),
              borderRadius: BorderRadius.circular(8)),
          child: Center(
            child: Text(
              'Save',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          )),
    );
  }

  _deleteBtn() {
    return InkWell(
      onTap: () async {
        final resOk = await ref
            .read(sentenceDetailProvider.notifier)
            .deleteSentence(widget.sentence!.id);
        if (!resOk) return;
        ref
            .read(sentenceListProvider.notifier)
            .deleteSentenceUI(widget.sentence!.id);

        if (!mounted) return;
        FocusScope.of(context).unfocus();
        await sleep(50);
        Navigator.pop(context, {'toast': 'Deleted'});
      },
      child: Container(
          height: 40,
          padding: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
              color: Colors.redAccent, borderRadius: BorderRadius.circular(8)),
          child: Center(
            child: Text(
              'Delete',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
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
