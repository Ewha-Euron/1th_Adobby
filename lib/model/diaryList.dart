class SimpleDiary {
  String title;
  int diaryId;
  String line;
  int date;

  SimpleDiary({
    required this.title,
    required this.diaryId,
    required this.line,
    required this.date,
  });
}

class DiaryList {
  List<SimpleDiary> diaryList;

  DiaryList({
    required this.diaryList,
  });

  factory DiaryList.fromJson(Map<String, dynamic> json) {
    List<SimpleDiary> diaryList = json['userResponses'];
    return DiaryList(diaryList: diaryList);
  }
}
