import 'package:eng_mobile_app/pages/challenge/challenge_page.dart';
import 'package:eng_mobile_app/pages/login/login_page.dart';
import 'package:eng_mobile_app/pages/new_word/new_word_page.dart';
import 'package:eng_mobile_app/pages/words/words_page.dart';
import 'package:flutter/material.dart';
import 'package:eng_mobile_app/routes/routes.dart';

import 'package:eng_mobile_app/pages/home/home_page.dart';

// ignore_for_file: constant_identifier_names

abstract class Pages {
  // static const String INITIAL = Routes.SPLASH;

  static final Map<String, Widget Function(BuildContext)> routes = {
    Routes.HOME: (_) => const HomePage(),
    Routes.WORDS: (_) => const WordsPage(),
    Routes.NEW_WORD: (_) => const NewWordPage(),
    Routes.LOGIN: (_) => const LoignPage(),
    Routes.CHALLENGE: (_) => ChallengePage(),
  };
}
