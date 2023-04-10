import 'dart:math';

import 'package:flutter_lorem/flutter_lorem.dart';

Random random = Random();
get _countRandom => random.nextInt(101);

get _randomTime {
  int hour = random.nextInt(24);
  int minute = random.nextInt(60);

  return '$hour:${minute.toString().padLeft(2, '0')}';
// padLeft yöntemi, dakikanın tek haneli olması durumunda sol tarafına '0' karakteri ekleyerek iki haneli bir sayı oluşturur.
}

class User {
  List<Map<String, dynamic>> jsonList = [
    {
      "name": "Musa Civelek",
      "username": "musac.dev",
      "text": lorem(paragraphs: 1, words: 50),
      "timestamp": _randomTime,
      "commentCount": _countRandom,
      "upCount": _countRandom,
      "dowCount": _countRandom,
      "bookmarkerCount": _countRandom
    },
    {
      "name": "Hasan Aslan",
      "username": "hasanaslan",
      "text": lorem(paragraphs: 1, words: 30),
      "timestamp": _randomTime,
      "commentCount": _countRandom,
      "upCount": _countRandom,
      "dowCount": _countRandom,
      "bookmarkerCount": _countRandom
    },
    {
      "name": "Alihan Sönal",
      "username": "alisafi",
      "text": lorem(paragraphs: 1, words: 18),
      "timestamp": _randomTime,
      "commentCount": _countRandom,
      "upCount": _countRandom,
      "dowCount": _countRandom,
      "bookmarkerCount": _countRandom
    },
    {
      "name": "Emre Çapar",
      "username": "_emre_",
      "text": lorem(paragraphs: 1, words: 30),
      "timestamp": _randomTime,
      "commentCount": _countRandom,
      "upCount": _countRandom,
      "dowCount": _countRandom,
      "bookmarkerCount": _countRandom
    },
    {
      "name": "Selçuk Yaman",
      "username": "selcuk_0",
      "text": lorem(paragraphs: 1, words: 30),
      "timestamp": _randomTime,
      "commentCount": _countRandom,
      "upCount": _countRandom,
      "dowCount": _countRandom,
      "bookmarkerCount": _countRandom
    },
  ];

  Map<String, dynamic> getData(String username) {
    Map<String, dynamic> user = {};
    jsonList.forEach((element) {
      print(element);
      if (element["username"] == username) {
        user = element;
      }
    });
    return user;
  }
}
