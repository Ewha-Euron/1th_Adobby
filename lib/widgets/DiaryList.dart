import 'package:adobby/widgets/Diary.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DiaryList extends StatelessWidget {
  //const DiaryList({Key? key}) : super(key: key);

  DiaryList(this.diaries);

  final List<Diary> diaries;

  Widget _buildItem(BuildContext context, int index) {
    final diary = diaries[index];

    return Card(
      child: ListTile(
        onTap: () {},
        leading: Text(
          DateFormat.MMMd().format(diary.date),
        ),
        title: Text(
          diary.title,
        ),
        subtitle: Text(
          diary.text,
          //diary.line,
        ),
        //trailing: Image(image: diary.image,), nullsafety 때문에 계속 에러 나는 듯
        isThreeLine: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: _buildItem,
      itemCount: diaries.length,
    );
  }
}
