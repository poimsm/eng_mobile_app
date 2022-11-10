import 'package:eng_mobile_app/pages/challenge/challenge_page.dart';
import 'package:eng_mobile_app/pages/login/login_page.dart';
import 'package:eng_mobile_app/pages/library/library_page.dart';
import 'package:eng_mobile_app/pages/word_detail/word_detail_page.dart';
import 'package:eng_mobile_app/pages/word_list/word_list_page.dart';
import 'package:flutter/material.dart';
import 'package:eng_mobile_app/routes/routes.dart';
import 'package:eng_mobile_app/pages/home/home_page.dart';


// ignore_for_file: constant_identifier_names

abstract class Pages {
  // static const String INITIAL = Routes.SPLASH;

  static final Map<String, Widget Function(BuildContext)> routes = {
    Routes.HOME: (_) => const HomePage(),
    Routes.WORD_LIST: (_) => const WordListPage(),
    Routes.WORD_DETAIL: (_) => WordDetailPage(),
    Routes.LOGIN: (_) => const LoignPage(),
    Routes.CHALLENGE: (_) => ChallengePage(),
    Routes.LIBRARY: (_) => LibraryPage(totalWords: 0),
  };
}
