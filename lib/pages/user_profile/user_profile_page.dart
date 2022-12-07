// ignore_for_file: use_build_context_synchronously

import 'package:eng_mobile_app/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import 'login_popup.dart';

class UserProfilePage extends ConsumerStatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  UserProfilePageState createState() => UserProfilePageState();
}

class UserProfilePageState extends ConsumerState<UserProfilePage> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 1), () {
      showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
          builder: (_) => LoginPopup());
    });
    super.initState();
  }

  final user = GetIt.I.get<AuthService>().user;
  Size size = Size.zero;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_horiz, color: Colors.white, size: 30))
          ],
          backgroundColor: Color(0xff6E5AA0),
          floating: true,
          pinned: false,
          snap: true,
          expandedHeight: 30,
          collapsedHeight: 240,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 70,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/user_17.png',
                          width: 60,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Guess',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            _signUpBtn()
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _itemTotal(53, 'WORDS'),
                      _itemTotal(5, 'CARDS'),
                      _itemTotal(3, 'VIDEOS'),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.only(top: 10),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  height: 150,
                  color: Colors.amber[100],
                  alignment: Alignment.center,
                  child: Text(index.toString()),
                );
              },
              childCount: 15,
            ),
          ),
        ),
        // SliverList(
        //   delegate: SliverChildBuilderDelegate(
        //     (BuildContext context, int index) {
        //       return Card(
        //         margin: const EdgeInsets.all(15),
        //         child: Container(
        //           color: Colors.blue[100 * (index % 9 + 1)],
        //           height: 80,
        //           alignment: Alignment.center,
        //           child: Text(
        //             "Item $index",
        //             style: const TextStyle(fontSize: 30),
        //           ),
        //         ),
        //       );
        //     },
        //     childCount: 1000, // 1000 list items
        //   ),
        // ),
      ],
    ));
  }

  _itemTotal(int total, String type) {
    return SizedBox(
      width: 100,
      child: Column(
        children: [
          Text(
            total.toString(),
            style: TextStyle(
                fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            type,
            style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }

  _signUpBtn() {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            isScrollControlled: true,
            builder: (_) => LoginPopup());
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        decoration: BoxDecoration(
            color: Color(0xffBA94D1), borderRadius: BorderRadius.circular(12)),
        child: Text(
          'Sign up',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
