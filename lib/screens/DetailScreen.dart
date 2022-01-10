import 'package:adobby/widgets/Diary.dart';
import 'package:adobby/widgets/TextDiaryAddPic.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

var diary = new Diary();

class DetailScreen extends StatefulWidget {
  //const DetailScreen({Key? key}) : super(key: key);

  DetailScreen({Key? key, required detailedDiary}) {
    diary = detailedDiary;
  }

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  // 다이어리 인풋 텍스트 조작을 위한 컨트롤러
  var _diaryTitleController = TextEditingController();
  var _diaryTextController = TextEditingController();

  void dispose() {
    _diaryTitleController.dispose();
    _diaryTextController.dispose();
    super.dispose();
  }

  void _updateDiary(Diary diary) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                //final diary = new Diary(
                //    title: _diaryTitleController.value.text,
                //    text: _diaryTextController.value.text);

                //Navigator.pop(context, diary);
                print('수정');
              },
              child: Text(
                '수정',
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                  elevation: 0.0,
                  primary: Colors.grey[200],
                  shadowColor: Colors.transparent),
            )
          ],
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          centerTitle: true,
          backgroundColor: Colors.grey[200],
          elevation: 0.0,
        ),
        body: Center(
          child: Column(
            children: [
              Text(
                DateFormat.yMMMd().format(DateTime.now()),
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple[400]),
              ),
              Text(
                DateFormat.E().format(DateTime.now()),
                style: TextStyle(fontSize: 15.0),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                diary.title,
                style: TextStyle(fontSize: 19.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'diary.line',
                    style: TextStyle(
                      fontSize: 19.0,
                    ),
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.edit))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: width - 80,
                child: Text(
                  diary.text,
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ],
          ),
        ));
  }
}
