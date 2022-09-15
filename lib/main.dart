import 'package:flutter/material.dart';
import 'package:eng_mobile_app/routes/pages.dart';
import 'package:eng_mobile_app/pages/layout/layout.dart';

final navigatorKey = GlobalKey<NavigatorState>();
String startPage = '/home';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          builder: (context, widget) => Layout(widget!),
          title: 'Material App',
          navigatorKey: navigatorKey,
          initialRoute: startPage,
          routes: Pages.routes),
    );
  }
}


