import 'package:flutter/material.dart';
import 'package:eng_mobile_app/routes/routes.dart';

import 'package:eng_mobile_app/pages/home/home_page.dart';

// ignore_for_file: constant_identifier_names

abstract class Pages {
  // static const String INITIAL = Routes.SPLASH;

  static final Map<String, Widget Function(BuildContext)> routes = {
    Routes.HOME: (_) => HomePage(),
  };
}
