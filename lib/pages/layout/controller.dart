import 'package:flutter/material.dart';
import 'package:eng_mobile_app/main.dart';
import 'package:eng_mobile_app/utils/helpers.dart';

class Screen with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  startLoading() {
    _loading = true;
    notifyListeners();
  }

  stopLoading() {
    _loading = false;
    notifyListeners();
  }

  bool _renderToast = false;
  bool get renderToast => _renderToast;
  String toastMessage = '';

  showToast(String msg, {int seconds = 4}) async {
    _renderToast = true;
    toastMessage = msg;
    notifyListeners();
    await sleep(seconds * 1000);
    _renderToast = false;
    notifyListeners();
  }

  Size screenSize = Size.zero;

  double dragWidth = 0;

  enableDraggingMenu() {
    dragWidth = screenSize.width * 0.3;
    notifyListeners();
  }

  disableDraggingMenu() {
    dragWidth = 0;
    notifyListeners();
  }

  void onNavigate(String route, {Map? args}) {
    navigatorKey.currentState?.popUntil((route) => route.isFirst);
    navigatorKey.currentState?.pushReplacementNamed(route, arguments: args);
    notifyListeners();
  }
}
