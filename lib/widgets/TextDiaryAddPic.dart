import 'package:flutter/material.dart';

class TextDiaryAddPic extends StatelessWidget {
  const TextDiaryAddPic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(  
      style: TextButton.styleFrom(primary: Colors.black),
      onPressed: () {
        showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return AlertDialog(              
              alignment: Alignment.bottomCenter,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
              title: Text('오늘을 대표하는 사진을 추가할래?'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '더 기록하고 싶은 사진이 있다면',
                    style: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                  Text(
                    '이곳에 올려주세요!',
                    style: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    width: 150,
                    child: IconButton(
                      onPressed: () {},
                      icon: Image(image: AssetImage('assets/dotted_box.png')),
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  style: TextButton.styleFrom(primary: Colors.white,
                  backgroundColor: Colors.deepPurple[400]), 
                  child: Text('취소'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  style: TextButton.styleFrom(primary: Colors.white,
                  backgroundColor: Colors.deepPurple[400]),
                  child: Text('저장'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        ); // show diaglog
      },
      child: Text('저장'),
    );
  }
}
