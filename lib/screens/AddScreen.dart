import 'package:adobby/widgets/TextDiaryAddPic.dart';
import 'package:flutter/material.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                '날짜',
                style: TextStyle(fontSize: 19.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '제목을 작성해주세요',
                style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                '내용을 작성해주세요.',
                style: TextStyle(
                  color: Colors.grey[350],
                ),
              )
            ],
          ),
        ));
  }
}
