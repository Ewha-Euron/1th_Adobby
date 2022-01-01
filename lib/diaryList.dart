import 'package:flutter/material.dart';

class DiaryList extends StatefulWidget {
  const DiaryList({
    Key? key,
  }) : super(key: key);

  @override
  _DiaryListState createState() => _DiaryListState();
}

class _DiaryListState extends State<DiaryList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff6667ab),
        title: Text('DiaryListview'),
      ),
      body: ListView.separated(
          scrollDirection:
              Axis.vertical, 
          separatorBuilder: (BuildContext context, int index) => const Divider(
                color: Colors.black,
              ), 
          itemCount: 7, 
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 70,
              color: Colors.white,
              alignment: Alignment.center,
              child: Text('item : $index'),
            );
          }),
    );
  }
}