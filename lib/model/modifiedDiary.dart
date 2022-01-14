class ModifiedDiary {
  int diaryId;
  String text;
  String androidId;

  ModifiedDiary(
      {required this.diaryId, required this.text, required this.androidId});

  factory ModifiedDiary.fromJson(Map<String, dynamic> json) {
    return ModifiedDiary(
        diaryId: json['diaryId'],
        text: json['text'],
        androidId: json['androidId']);
  }
}
