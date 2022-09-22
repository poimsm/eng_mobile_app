
import 'package:eng_mobile_app/pages/home/home_controller.dart';
import 'package:eng_mobile_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewWordPage extends ConsumerStatefulWidget {
  const NewWordPage({super.key});

  @override
  NewWordPageState createState() => NewWordPageState();
}

class NewWordPageState extends ConsumerState<NewWordPage> {
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
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      child: SafeArea(
        child: Column(          
          children: [
        _appbar(),
        SizedBox(height: size.height*0.12),
        _textInput('Enter word', _newWordCtrl),
        SizedBox(height: 25),
        _textInput('Meaning or translation', _meaningCtrl),
        SizedBox(height: 45),
        _btn(),
        // SizedBox(height: 45),
        // _info()
          ],          
        )
      )
    );
  }

 _appbar() {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        color: Color(0xff22C49D),
        // borderRadius: BorderRadius.circular(40),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40)),
      ),
      child: Row(children: [
        IconButton(onPressed: () => Navigator.pop(context),
        icon: Icon(Icons.arrow_back, size: 30, color: Colors.white),),
        Text('New word', style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),)
      ]),
    );
  }

  _textInput(String txt, ctrl) {
    return Column(
      children: [
        Container(
          width: size.width*0.8,
          child: TextField(
            maxLines: 4,
            style: TextStyle(fontSize: 18),
            decoration: InputDecoration(          
                hintText: txt,
                // enabledBorder: UnderlineInputBorder(      
                //           borderSide: BorderSide(color: Colors.black),   
                //           ),
                  focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                       ),  
            ),
              controller: ctrl,
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

 _btn() {
  final counter = ref.watch(counterProvider);
    final notifier = ref.read(counterProvider.notifier);
    return InkWell(
      onTap: () {
        // Navigator.pushNamed(context, Routes.WORDS);
        notifier.setName('Valdivia');
      },
      child: Container(
        width: 150,
        height: 60,
        // padding: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: Color(0xffFFCC29),
          borderRadius: BorderRadius.circular(15)
        ),
        child: Center(
          child: Text('${counter.name}', style: TextStyle(
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