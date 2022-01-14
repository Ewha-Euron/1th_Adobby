import 'package:adobby/widgets/Diary.dart';

class SimpleDiary {
  int diaryId;
  String line;
  int date;

  SimpleDiary({
    required this.diaryId,
    required this.line,
    required this.date,
  });
}

class DiaryList {
  //List<SimpleDiary> diaryList;

  List<Diary> diaryList;

  DiaryList({
    required this.diaryList,
  });

  factory DiaryList.fromJson(Map<String, dynamic> json) {
    //List<SimpleDiary> diaryList = json['userResponses'];
    List<Diary> diaryList = json['userResponses'];
    return DiaryList(diaryList: diaryList);
  }
}
