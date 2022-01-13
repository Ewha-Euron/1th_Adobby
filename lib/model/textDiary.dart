class TextDiary {
  String text;
  String date;
  String androidId;

  TextDiary({required this.text, required this.date, required this.androidId});

  factory TextDiary.fromJson(Map<String, dynamic> json) {
    return TextDiary(
        text: json['text'], date: json['date'], androidId: json['androidId']);
  }
}
