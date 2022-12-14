// ignore_for_file: use_build_context_synchronously

import 'package:eng_mobile_app/pages/info_card_widget.dart';
import 'package:eng_mobile_app/pages/layout/controller.dart';
import 'package:eng_mobile_app/pages/single_video.dart';
import 'package:eng_mobile_app/pages/user_profile/user_profile_controller.dart';
import 'package:eng_mobile_app/services/auth/auth_service.dart';
import 'package:eng_mobile_app/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

import 'login_popup.dart';

class UserProfilePage extends ConsumerStatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  UserProfilePageState createState() => UserProfilePageState();
}

class UserProfilePageState extends ConsumerState<UserProfilePage> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 0), () async {
      await fetchInitData();

      final authService = GetIt.I.get<AuthService>();
      if (!authService.isAuthenticated) {
        await sleep(500);
        final refresh = await showModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            isScrollControlled: true,
            builder: (_) => LoginPopup());

        if (refresh != null && refresh) {
          await fetchInitData();
        }
      }
    });
    super.initState();
  }

  Future fetchInitData() async {
    context.read<Screen>().startLoading();
    await ref.read(userProfileProvider.notifier).getPageData();
    context.read<Screen>().stopLoading();
  }

  late UserProfileState userProfileState;
  late UserProfileNotifier userProfileNotifier;
  Size size = Size.zero;
  @override
  Widget build(BuildContext context) {
    userProfileState = ref.watch(userProfileProvider);
    userProfileNotifier = ref.read(userProfileProvider.notifier);
    size = MediaQuery.of(context).size;

    late Widget widget;

    if (userProfileState.screen == Screens.userProfile) {
      widget = _userProfileScreen();
    }

    if (userProfileState.screen == Screens.infoCard) {
      widget = _infoCardScreen();
    }

    if (userProfileState.screen == Screens.shortVideo) {
      widget = SingleVideo(
          enableFavoriteBtn: false,
          video: userProfileState.shortVideo!,
          onBack: (_) {
            userProfileNotifier.setScreen(Screens.userProfile);
          });
    }

    return SafeArea(child: widget);
  }

  Widget _userProfileScreen() {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            actions: [
              IconButton(
                  onPressed: () async {
                    final refresh = await _presentActionSheet();
                    if (refresh != null && refresh) {
                      await fetchInitData();
                    }
                  },
                  icon: Icon(Icons.more_horiz, color: Colors.white, size: 30))
            ],
            backgroundColor: Color(0xff6E5AA0),
            floating: true,
            pinned: false,
            snap: true,
            // expandedHeight: 30,
            collapsedHeight: 245,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: userProfileState.isAuthenticated ? 70 : 60,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: (() {
                              userProfileNotifier.getPageData();
                            }),
                            child: Image.asset(
                              'assets/user_17.png',
                              width: 60,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                userProfileState.user.email,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: userProfileState.user.id < 0 ? 35 : 15,
                              ),
                              if (userProfileState.user.id > 0) _checkIcon(),
                              if (userProfileState.user.id < 0) _signUpBtn()
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
                        _itemTotal(
                            userProfileState.stats.totalSentences, 'WORDS'),
                        _itemTotal(userProfileState.stats.totalCards, 'CARDS'),
                        _itemTotal(
                            userProfileState.stats.totalVideos, 'VIDEOS'),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          userProfileState.favorites.isEmpty
              ? SliverToBoxAdapter(
                  child: Container(
                    height: size.height - 240,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/folder.png',
                          width: 120,
                        ),
                        Text(
                          'You have no card or video yet',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.2,
                        )
                      ],
                    ),
                  ),
                )
              : SliverPadding(
                  padding:
                      EdgeInsets.only(top: 20, left: 12, right: 12, bottom: 10),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      childAspectRatio: 0.9,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return InkWell(
                          onTap: () async {
                            context.read<Screen>().startLoading();
                            final fav = userProfileState.favorites[index];
                            await userProfileNotifier.openContent(fav);
                            context.read<Screen>().stopLoading();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black12)),
                            child: Image.network(
                                userProfileState.favorites[index].imageUrl,
                                fit: BoxFit.cover),
                          ),
                        );
                      },
                      childCount: userProfileState.favorites.length,
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
      ),
    );
  }

  _infoCardScreen() {
    return Container(
      height: size.height,
      width: size.width,
      // color: Color(0xff444444),
      // color: Colors.redAccent,
      // color: Colors.black,
      child: Column(
        children: [
          Container(
              width: size.width,
              padding: EdgeInsets.only(left: 5, top: 10),
              alignment: Alignment.centerLeft,
              child: IconButton(
                  onPressed: () {
                    userProfileNotifier.setScreen(Screens.userProfile);
                  },
                  icon: Icon(Icons.close, color: Colors.black87, size: 30))),
          SizedBox(height: size.height * 0.1),
          InfoCardWidget(
            card: userProfileState.infoCard!,
            enableFavoriteBtn: false,
          )
        ],
      ),
    );
  }

  _checkIcon() {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.3), shape: BoxShape.circle),
      child: Icon(
        Icons.check,
        color: Colors.white,
        size: 20,
      ),
    );
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
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }

  _signUpBtn() {
    return InkWell(
      onTap: () async {
        final refresh = await showModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            isScrollControlled: true,
            builder: (_) => LoginPopup());

        if (refresh != null && refresh) {
          await fetchInitData();
        }
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

  Future _presentActionSheet() async {
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (context) {
          Widget logout = InkWell(
            onTap: () {
              userProfileNotifier.logout();
              Navigator.pop(context, true);
            },
            child: SizedBox(
              width: 150,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    LineIcons.powerOff,
                    size: 25,
                    color: Colors.black87,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Log out',
                    style: TextStyle(color: Colors.black87, fontSize: 19),
                  ),
                ],
              ),
            ),
          );

          Widget signUp = InkWell(
            onTap: () async {
              Navigator.pop(context);
              final refresh = await showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.transparent,
                  isScrollControlled: true,
                  builder: (_) => LoginPopup());

              if (refresh != null && refresh) {
                await fetchInitData();
              }
            },
            child: SizedBox(
              width: 150,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    LineIcons.user,
                    size: 25,
                    color: Colors.black87,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Sign up',
                    style: TextStyle(color: Colors.black87, fontSize: 19),
                  ),
                ],
              ),
            ),
          );
          return Container(
              width: size.width,
              height: 130,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(13),
                      topRight: Radius.circular(13))),
              alignment: Alignment.centerLeft,
              child: userProfileState.isAuthenticated ? logout : signUp);
        });
  }
}
