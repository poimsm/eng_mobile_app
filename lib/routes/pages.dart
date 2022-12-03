import 'package:eng_mobile_app/pages/challenge/challenge_page.dart';
import 'package:eng_mobile_app/pages/error/error_page.dart';
import 'package:eng_mobile_app/pages/login/login_page.dart';
import 'package:eng_mobile_app/pages/library/library_page.dart';
import 'package:eng_mobile_app/pages/new_version/new_version_page.dart';
import 'package:eng_mobile_app/pages/user_profile/user_profile_page.dart';
import 'package:eng_mobile_app/pages/sentence_detail/sentence_detail_page.dart';
import 'package:eng_mobile_app/pages/sentence_list/sentence_list_page.dart';
import 'package:flutter/material.dart';
import 'package:eng_mobile_app/routes/routes.dart';
import 'package:eng_mobile_app/pages/home/home_page.dart';

// ignore_for_file: constant_identifier_names

abstract class Pages {
  // static const String INITIAL = Routes.SPLASH;

  static final Map<String, Widget Function(BuildContext)> routes = {
    Routes.HOME: (_) => const HomePage(),
    Routes.SENTENCE_LIST: (_) => const SentenceListPage(),
    Routes.SENTENCE_DETAIL: (_) => SentenceDetailPage(),
    Routes.LOGIN: (_) => const LoignPage(),
    Routes.CHALLENGE: (_) => ChallengePage(),
    Routes.LIBRARY: (_) => LibraryPage(totalSentences: 0),
    Routes.ERROR: (_) => ErrorPage(),
    Routes.NEW_APP_VERSION: (_) => NewAppVersionPage(),
    Routes.USER_PROFILE: (_) => UserProfilePage(),
  };
}
