import 'dart:convert';
import 'dart:async';
import 'package:adobby/model/fullTextDiary.dart';
import 'package:adobby/widgets/Diary.dart';
import 'package:http/http.dart' as http;
import 'package:adobby/domain.dart';
import '../model/textDiary.dart';
import '../model/lineInitialize.dart';
import '../model/diaryList.dart';
import '../model/modifiedDiary.dart';
import '../model/modifiedLine.dart';

class SendToServer {
  //일기 작성
  Future<LineInitialize> newTextDiary(
      String text, String date, String androidId) async {
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

  //일기 수정
  Future<LineInitialize> modifyDiary(
      int diaryId, String text, String androidId) async {
    ModifiedDiary diary =
        new ModifiedDiary(diaryId: diaryId, text: text, androidId: androidId);

    String addr = domain + "v1/textcorrection"; //서버 주소

    final response = await http.post(Uri.parse(addr),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          'diaryId': diary.diaryId,
          'text': diary.text,
          'androidId': diary.androidId,
        }));
    if (response.statusCode == 200) {
      return LineInitialize.fromJson(json.decode(response.body));
    }
    throw Exception();
  }

  //한줄 일기 수정
  Future<int> modifyLine(String androidId, int diaryId, String line) async {
    ModifiedLine modifiedLine =
        new ModifiedLine(androidId: androidId, diaryId: diaryId, line: line);

    String addr = domain + "v1/line";

    final response = await http.post(Uri.parse(addr),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          'androidId': modifiedLine.androidId,
          'diaryId': modifiedLine.diaryId,
          'line': modifiedLine.line,
        }));
    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      return result['duplicate'];
    }
    throw Exception();
  }
}

// 데이터 불러오기
class GetFromServer {
  //일기 목록 불러오기
  Future<DiaryList> getDiaryList(String androidId, int yearMonth) async {
    String addr = domain + "v1/scroll/${androidId}/${yearMonth}";

    final response = await http.get(
      Uri.parse(addr),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return DiaryList.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load diary');
    }
  }

  //일기 내용 불러오기
  Future<FullTextDiary> getDiary(String androidId, int diaryId) async {
    String addr = domain + "v1/diary/${androidId}/${diaryId}";

    final response = await http.get(
      Uri.parse(addr),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return FullTextDiary.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load diary');
    }
  }
}
