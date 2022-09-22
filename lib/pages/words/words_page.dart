import 'package:eng_mobile_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class WordsPage extends StatefulWidget {
  const WordsPage({super.key});

  @override
  State<WordsPage> createState() => _WordsPageState();
}

class _WordsPageState extends State<WordsPage> {
  Size size = Size.zero;
  @override
  Widget build(BuildContext context) {
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
            SizedBox(height: 30,),
            _fox(),
            SizedBox(height: 30,),
            _wordList(),            
          ],          
        ),
        Positioned(
            left: 0,
            bottom: 30,
            child: SizedBox(
              width: size.width,
              child: Center(
                child: _newWordBox(),
              ),
            )
          )
          ],
        )
      )
    );
  }

  _appbar() {
    return Container(
      height: 60,
      child: Row(children: [
        IconButton(onPressed: () => Navigator.pop(context),
        icon: Icon(Icons.arrow_back, size: 30,),),
        Text('My words', style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black
        ),)
      ]),
    );
  }

  _fox() {
    return Container(
      child: Column(children: [
        Image.asset('assets/fox.png'),
        _tipsBtn()
      ]),
    );
  }

  _tipsBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black.withOpacity(0.7)),
        borderRadius: BorderRadius.circular(8)
      ),
      child: Text('Tap here for tips!', style: TextStyle(
        fontSize: 16,
        color: Colors.black.withOpacity(0.7)
      ),),
    );
  }

  _wordList() {
    return Column(children: [
      _wordItem('Workout'),
      _wordItem('Science'),
      _wordItem('I learned!'),
      _wordItem('Speedlight'),
      _wordItem('awkward'),
      _wordItem('Run'),
    ],);
  }

   _wordItem(word) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Text(word, style: TextStyle(
        fontSize: 22,
        color: Colors.black
      ),),
    );
  }

  _wordItem2(word) {
    return ListTile(
      title: Text(word, style: TextStyle(
        fontSize: 20,
        color: Colors.black
      ),),
    );
  }

  _newWordBox() {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.NEW_WORD);
      },
      child: Container(
        width: size.width*0.8,
        height: 60,
        // padding: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: Color(0xffFFCC29),
          borderRadius: BorderRadius.circular(15)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Icon(Icons.add, size: 30, color: Colors.white),
          Text('Add new word', style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),)
        ],)
      ),
    );
  }
}