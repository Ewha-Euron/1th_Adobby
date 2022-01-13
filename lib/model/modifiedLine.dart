class ModifiedLine {
  String androidId;
  int diaryId;
  String line;

  ModifiedLine(
      {required this.androidId, required this.diaryId, required this.line});

  factory ModifiedLine.fromJson(Map<String, dynamic> json) {
    return ModifiedLine(
      androidId: json['androidId'],
      diaryId: json['diaryId'],
      line: json['line'],
    );
  }
}
