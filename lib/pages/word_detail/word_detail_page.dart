
import 'package:eng_mobile_app/data/models/activity.dart';
import 'package:eng_mobile_app/pages/word_list/word_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WordDetailPage extends ConsumerStatefulWidget {
  const WordDetailPage({super.key, this.isNewWord = false, this.word});

  final Word? word;
  final bool isNewWord;

  @override
  WordDetailPageState createState() => WordDetailPageState();
}

class WordDetailPageState extends ConsumerState<WordDetailPage> {
  late TextEditingController _wordCtrl;
  late TextEditingController _meaningCtrl;

   @override
  void initState() {
    super.initState();
    _wordCtrl = TextEditingController();
    
    _meaningCtrl = TextEditingController();

    if(!widget.isNewWord) {
      _wordCtrl.text = widget.word!.word;
      _meaningCtrl.text = widget.word!.meaning?? '';
    }
  }

  String info = 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.';

  Size size = Size.zero;
  Map args = {};
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    // args = (ModalRoute.of(context)!.settings.arguments ?? {}) as Map;
    // args['new_word'];
    

    return Container(
      height: size.height,
      width: size.width,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(          
            children: [
          _appbar(),
          // SizedBox(height: size.height*0.1),
          SizedBox(height: 70),
          _wordInput(),
           SizedBox(height: 5),
          Divider(color: Colors.black26),
          SizedBox(height: 25),
          _meaningInput(),
          
          SizedBox(height: 45),
          _saveBtn(),
          // SizedBox(height: 45),
          // _info()
            ],          
          ),
        )
      )
    );
  }



 _appbar() {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Color(0xff333333),
        // borderRadius: BorderRadius.circular(40),
        // borderRadius: BorderRadius.only(
        //   bottomLeft: Radius.circular(40),
        //   bottomRight: Radius.circular(40)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            IconButton(onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back, size: 30, color: Colors.white),),
            Text(widget.isNewWord? 'New word' : 'Word', style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),)
          ]),
          if(!widget.isNewWord) IconButton(onPressed: () {            
            ref.read(wordListProvider.notifier).deleteWord(widget.word!.id);
            Navigator.pop(context);
            },
            icon: Icon(Icons.delete, size: 30, color: Colors.white),),
        ],
      ),
    );
  }

  _wordInput() {
    return Column(
      children: [
        SizedBox(
          width: size.width*0.8,
          child: Text('Word', textAlign: TextAlign.left, style: TextStyle(
            fontSize: 19,
            color: Colors.black54
          ),),
        ),
        Container(
          width: size.width*0.8,
          child: TextField(
             maxLines: 2,
             maxLength: 20,
            textCapitalization: TextCapitalization.sentences,
            style: TextStyle(fontSize: widget.isNewWord? 19 : 24),
            decoration: InputDecoration(          
                hintText: 'Example: Riding',
                counterStyle: TextStyle(fontSize: 15, color: Colors.black38),
                hintStyle: TextStyle(color: Colors.black26),
                border: InputBorder.none,
                  // focusedBorder: UnderlineInputBorder(
                  //         borderSide: BorderSide(color: Colors.black),
                  //      ),  
            ),
              controller: _wordCtrl,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Padding(
            //   padding: const EdgeInsets.only(right: 50, top: 5),
            //   child: Text('0/' + _wordCtrl.text.length.toString(), style: TextStyle(
            //     fontSize: 15,
            //     color: Colors.grey
            //   ),),
            // )
          ],
        )
      ],
    );
  }

  _meaningInput() {
    return Column(
      children: [
        SizedBox(
          width: size.width*0.8,
          child: Text('Meaning', textAlign: TextAlign.left, style: TextStyle(
            fontSize: 19,
            color: Colors.black54
          ),),
        ),
        Container(
          width: size.width*0.8,
          child: TextField(
            maxLines: 3,
            maxLength: 100,
            textCapitalization: TextCapitalization.sentences,
            style: TextStyle(fontSize: 19),
            decoration: InputDecoration(
              counterStyle: TextStyle(fontSize: 15, color: Colors.black38),
                hintText: 'Translation, example phrases, etc.. Example: "Riding a horse"',
                hintStyle: TextStyle(color: Colors.black26),
                  border: InputBorder.none,
            ),
              controller: _meaningCtrl,
          ),
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   children: [
        //     Padding(
        //       padding: const EdgeInsets.only(right: 50, top: 5),
        //       child: Text('0/50', style: TextStyle(
        //         fontSize: 15,
        //         color: Colors.grey
        //       ),),
        //     )
        //   ],
        // )
      ],
    );
  }

 _saveBtn() {
  // final counter = ref.watch(counterProvider);
  //   final notifier = ref.read(counterProvider.notifier);
    return InkWell(
      onTap: () {        
        if(_wordCtrl.text == '') return;

        if(widget.isNewWord){
          ref.read(wordListProvider.notifier).addNewWord(Word(
          id: ref.read(wordListProvider).words.length + 1, 
          word: _wordCtrl.text,
          meaning: _meaningCtrl.text == '' ? null : _meaningCtrl.text
        ));
        } else {
          ref.read(wordListProvider.notifier).editWord(Word(
            id: widget.word!.id, 
            word: _wordCtrl.text,
            meaning: _meaningCtrl.text == '' ? null : _meaningCtrl.text
          ));
        }
        
        // wordListProvider
        Navigator.pop(context);
        // Navigator.pushNamed(context, Routes.WORDS);
        // notifier.setName('Valdivia');
      },
      child: Container(
        width: 150,
        height: 60,
        // padding: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: Color(0xff6E5AA0),
          borderRadius: BorderRadius.circular(15)
        ),
        child: Center(
          child: Text(widget.isNewWord ? 'Save':'Edit', style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),),
        )
      ),
    );
  }

  _info() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Text(info, style: TextStyle(
        fontSize: 16,
        color: Colors.black54
      ),),
    );
  }

  }