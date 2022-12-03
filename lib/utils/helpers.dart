// ignore_for_file: avoid_print

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

printInfo(String text) {
  print('\x1B[37m 👻 $text\x1B[0m');
}

printDebug(String text) {
  print('\x1B[32m 🐛 $text\x1B[0m');
}

printWarning(String text) {
  print('\x1B[33m ⚠️ $text\x1B[0m');
}

printError(String text) {
  print('\x1B[31m ⛔ $text\x1B[0m');
}

// String getGroupHead(List<String> list) {
//   return list[0];
// }

// List<String> getGroupTailList(List<String> list) {
//   List<String> result = [];
//   for (var i = 1; i < list.length; i++) {
//     result.add(list[i]);
//     if(i == 4) break;
//   }
//   return result;
// }

// String getGroupShortTail(List<String> list) {
//   String result = '';
//   for (var i = 1; i < list.length; i++) {
//     result += list[i];
//     if(i < list.length && i < 4) {
//       result += ', ';
//     }
//     if(i == 4) break;
//   }
//   return result;
// }

// String getGroupFullTail(List<String> list) {
//   String result = '';
//   for (var i = 1; i < list.length; i++) {
//     result += list[i];
//     if(i < list.length - 1) {
//       result += ', ';
//     }
//   }
//   return result;
// }

// String getGroupRandomTail(List<String> list) {
//   final random = Random();
//   int next(int min, int max) => min + random.nextInt(max - min);

//   int index = next(1, list.length);
//   return list[index];
// }

String getGroupHead(String extras) {
  List<String> split = extras.split(';');
  return split[0];
}

List<String> getGroupTailList(String extras) {
  List<String> split = extras.split(';');
  List<String> result = [];
  for (var i = 1; i < split.length; i++) {
    result.add(split[i]);
    if (i == 4) break;
  }
  return result;
}

String getGroupShortTail(String extras) {
  List<String> split = extras.split(';');
  String result = '';
  for (var i = 1; i < split.length; i++) {
    result += split[i];
    if (i < split.length && i < 4) {
      result += ', ';
    }
    if (i == 4) break;
  }
  return result;
}

String getGroupFullTail(String extras) {
  List<String> split = extras.split(';');
  String result = '';
  for (var i = 1; i < split.length; i++) {
    result += split[i];
    if (i < split.length - 1) {
      result += ', ';
    }
  }
  return result;
}

String getGroupRandomTail(String extras) {
  List<String> split = extras.split(';');
  final random = Random();
  int next(int min, int max) => min + random.nextInt(max - min);

  int index = next(1, split.length);
  return split[index];
}

String toastMsgBasedOnLength({required bool willSave, required int length}) {
  String msg = '';
  if (willSave && length <= 1) {
    msg = '$length sentence saved';
  }

  if (willSave && length > 1) {
    msg = '$length sentences saved';
  }

  if (!willSave && length <= 1) {
    msg = '$length sentence removed';
  }

  if (!willSave && length > 1) {
    msg = '$length sentences removed';
  }
  return msg;
}
