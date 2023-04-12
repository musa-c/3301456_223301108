import 'dart:math';

import 'package:abc/models/userdata.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

Random random = Random();
get _countRandom => random.nextInt(101);

get _randomTime {
  int hour = random.nextInt(24);
  int minute = random.nextInt(60);

  return '$hour:${minute.toString().padLeft(2, '0')}';
// padLeft yöntemi, dakikanın tek haneli olması durumunda sol tarafına '0' karakteri ekleyerek iki haneli bir sayı oluşturur.
}

const String _alihanUsername = "alisafi";
const String _musaUsername = "musac.dev";
const String _emreUsername = "_emre_";
const String _selcukUsername = "sekcuk_0";
const String _hasanUsername = "hasanaslan";
final UserData _userdata = UserData();

class User {
  List<Map<String, dynamic>> jsonList = [
    {
      "name": _userdata.getUserName(_musaUsername),
      "username": _musaUsername,
      "avatar": _userdata.getAvatar(_musaUsername),
      "text": _userdata.getUserText(_musaUsername),
      "timestamp": _userdata.getUserTimeStamp(_musaUsername),
      "commentCount": _userdata.getUserCommentCount(_musaUsername),
      "upCount": _userdata.getUserUpCount(_musaUsername),
      "dowCount": _userdata.getUserDowCount(_musaUsername),
      "bookmarkerCount": _userdata.getUserBookmarkerCount(_musaUsername)
    },
    {
      "name": _userdata.getUserName(_hasanUsername),
      "username": _hasanUsername,
      "avatar": _userdata.getAvatar(_hasanUsername),
      "text": _userdata.getUserText(_hasanUsername),
      "timestamp": _userdata.getUserTimeStamp(_hasanUsername),
      "commentCount": _userdata.getUserCommentCount(_hasanUsername),
      "upCount": _userdata.getUserUpCount(_hasanUsername),
      "dowCount": _userdata.getUserDowCount(_hasanUsername),
      "bookmarkerCount": _userdata.getUserBookmarkerCount(_hasanUsername)
    },
    {
      "name": _userdata.getUserName(_alihanUsername),
      "username": _alihanUsername,
      "text": _userdata.getUserText(_alihanUsername),
      "avatar": _userdata.getAvatar(_alihanUsername),
      "timestamp": _userdata.getUserTimeStamp(_alihanUsername),
      "commentCount": _userdata.getUserCommentCount(_alihanUsername),
      "upCount": _userdata.getUserUpCount(_alihanUsername),
      "dowCount": _userdata.getUserDowCount(_alihanUsername),
      "bookmarkerCount": _userdata.getUserBookmarkerCount(_alihanUsername)
    },
    {
      "name": _userdata.getUserName(_emreUsername),
      "username": _emreUsername,
      "text": _userdata.getUserText(_emreUsername),
      "avatar": _userdata.getAvatar(_emreUsername),
      "timestamp": _userdata.getUserTimeStamp(_emreUsername),
      "commentCount": _userdata.getUserCommentCount(_emreUsername),
      "upCount": _userdata.getUserUpCount(_emreUsername),
      "dowCount": _userdata.getUserDowCount(_emreUsername),
      "bookmarkerCount": _userdata.getUserBookmarkerCount(_emreUsername)
    },
    {
      "name": _userdata.getUserName(_selcukUsername),
      "username": _selcukUsername,
      "text": _userdata.getUserText(_selcukUsername),
      "avatar": _userdata.getAvatar(_selcukUsername),
      "timestamp": _userdata.getUserTimeStamp(_selcukUsername),
      "commentCount": _userdata.getUserCommentCount(_selcukUsername),
      "upCount": _userdata.getUserUpCount(_selcukUsername),
      "dowCount": _userdata.getUserDowCount(_selcukUsername),
      "bookmarkerCount": _userdata.getUserBookmarkerCount(_selcukUsername)
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
