
import 'package:eng_mobile_app/data/models/activity.dart';
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
  late TextEditingController _newWordCtrl;
  late TextEditingController _meaningCtrl;

   @override
  void initState() {
    super.initState();
    _newWordCtrl = TextEditingController();
    _meaningCtrl = TextEditingController();
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
          SizedBox(height: size.height*0.1),
          _wordInput(),
          SizedBox(height: 45),
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
          if(!widget.isNewWord) IconButton(onPressed: () => Navigator.pop(context),
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
          child: Text('Enter word', textAlign: TextAlign.left, style: TextStyle(
            fontSize: 19,
            color: Colors.black54
          ),),
        ),
        Container(
          width: size.width*0.8,
          child: TextField(
            // maxLines: 4,
            textCapitalization: TextCapitalization.sentences,
            style: TextStyle(fontSize: 19),
            decoration: InputDecoration(          
                hintText: 'Example: Riding',
                hintStyle: TextStyle(color: Colors.black26),
                // enabledBorder: UnderlineInputBorder(      
                //           borderSide: BorderSide(color: Colors.black),   
                //           ),
                  focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                       ),  
            ),
              controller: _newWordCtrl,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 50, top: 5),
              child: Text('0/20', style: TextStyle(
                fontSize: 15,
                color: Colors.grey
              ),),
            )
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
            textCapitalization: TextCapitalization.sentences,
            style: TextStyle(fontSize: 19),
            decoration: InputDecoration(          
                hintText: 'Translation, example phrases, etc.. Example: "Riding a horse"',
                hintStyle: TextStyle(color: Colors.black26),
                // enabledBorder: UnderlineInputBorder(      
                //           borderSide: BorderSide(color: Colors.black),   
                //           ),
                  focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                       ),  
            ),
              controller: _meaningCtrl,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 50, top: 5),
              child: Text('0/50', style: TextStyle(
                fontSize: 15,
                color: Colors.grey
              ),),
            )
          ],
        )
      ],
    );
  }

 _saveBtn() {
  // final counter = ref.watch(counterProvider);
  //   final notifier = ref.read(counterProvider.notifier);
    return InkWell(
      onTap: () {
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
          child: Text('Save', style: TextStyle(
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