class FullTextDiary {
  String text;

  FullTextDiary({required this.text});

  factory FullTextDiary.fromJson(Map<String, dynamic> json) {
    return FullTextDiary(text: json['text']);
  }
}
