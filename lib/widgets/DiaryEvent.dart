import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:adobby/domain.dart';
import '../model/textDiary.dart';
import '../model/lineInitialize.dart';

class SendToServer {
  Future<LineInitialize> newTextDiary(
      String text, int date, String androidId) async {
    TextDiary diary =
        new TextDiary(text: text, date: date, androidId: androidId);

    String addr = domain + "v1/text"; //서버 주소

    final response = await http.post(Uri.parse(addr),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          'text': diary.text,
          'date': diary.date,
          'androidId': diary.androidId,
        }));
    if (response.statusCode == 200) {
      return LineInitialize.fromJson(json.decode(response.body));
    }
    throw Exception();
  }
}
