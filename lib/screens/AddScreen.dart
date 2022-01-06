import 'package:adobby/widgets/Diary.dart';
import 'package:adobby/widgets/TextDiaryAddPic.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  // 다이어리 인풋 텍스트 조작을 위한 컨트롤러
  var _diaryTitleController = TextEditingController();
  var _diaryTextController = TextEditingController();

  void dispose() {
    _diaryTitleController.dispose();
    _diaryTextController.dispose();
    super.dispose();
  }

  void _addDiary(Diary diary) {
    setState(() {
      _diaryTitleController.text = '';
      _diaryTextController.text = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          actions: <Widget>[TextDiaryAddPic()],
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
                '따분한 일상에 감성 한 스푼',
                style: TextStyle(fontSize: 19.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 40,
              ),
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(8.0),
                      width: width - 80,
                      child: TextField(
                        maxLines: 1,
                        controller: _diaryTitleController,
                        decoration: InputDecoration(
                          labelText: '제목을 작성해주세요',
                          fillColor: Colors.grey[300],
                          filled: true,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      margin: EdgeInsets.all(8.0),
                      width: width - 80,
                      child: TextField(
                        maxLines: 7,
                        controller: _diaryTextController,
                        decoration: InputDecoration(
                          labelText: '내용을 작성해주세요',
                          fillColor: Colors.grey[300],
                          filled: true,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    // 테스트를 위한 추가하기 버튼
                    ElevatedButton(
                        onPressed: () {
                          final diary = new Diary(
                              title: _diaryTitleController.value.text,
                              text: _diaryTextController.value.text);

                          Navigator.pop(context, diary);
                        },
                        child: Text('저장'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.deepPurple,
                        ))
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
