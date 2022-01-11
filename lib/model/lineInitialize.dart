class LineInitialize {
  int diaryId;
  String line;

  LineInitialize({
    required this.diaryId,
    required this.line,
  });

  factory LineInitialize.fromJson(Map<String, dynamic> json) {
    int diaryId = json['diaryId'];
    String line = json['line'];
    return LineInitialize(diaryId: diaryId, line: line);
  }
}
