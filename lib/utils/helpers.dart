import 'dart:async';

import 'dart:math';

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}

Future sleep(int miliseconds) {
  return Future.delayed(Duration(milliseconds: miliseconds));
}

String createRandomImageName() {
  return Random().nextInt(100000).toString() + '.jpg';
}

class DjangoError {
  final String title;
  final String message;
  DjangoError({required this.title, required this.message});
}

DjangoError extractErrorFromDjangoHTML(String? html) {
  final defaultResp =
      DjangoError(title: 'No title found', message: 'No error details found');

  if (html == null) return defaultResp;

  if (!html.contains('<title>')) {
    return DjangoError(title: 'Django', message: html);
  }

  const find = '\n';
  const replaceWith = "";
  html = html.replaceAll(find, replaceWith);

  final regTitle = RegExp(r"<title>(.*?)</title>");
  final matchTitle = regTitle.firstMatch(html);
  String title = matchTitle?.group(1) ?? 'No title found';
  title = title.replaceAll(RegExp(r"\s+\b"), " ");

  final regExp =
      RegExp(r"Exception Value:\s*<\/th>\s*<td>\s*<pre>(.*?)<\/pre>\s*<\/td>");
  final match = regExp.firstMatch(html);
  final matchedText = match?.group(1);
  String errorMsg = 'No error details found';

  if (matchedText != null) {
    const find = '&#x27;';
    const replaceWith = "'";
    errorMsg = matchedText.replaceAll(find, replaceWith);
  }

  return DjangoError(title: title, message: errorMsg);
}
