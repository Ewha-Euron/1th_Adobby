import 'package:flutter/material.dart';

class Diary {
  int _id = 0;
  DateTime date = DateTime.now();
  String title;
  String text;
  String line = '';

  Diary({this.title = '', this.text = ''});
}
