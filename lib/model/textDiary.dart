class TextDiary {
  String title;
  String text;
  int date;
  String androidId;

  TextDiary(
      {required this.title,
      required this.text,
      required this.date,
      required this.androidId});

  factory TextDiary.fromJson(Map<String, dynamic> json) {
    return TextDiary(
        title: json['title'],
        text: json['text'],
        date: json['date'],
        androidId: json['androidId']);
  }
}
