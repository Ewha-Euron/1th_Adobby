/* import 'package:adobby/screens/TextDiary.dart';
import 'package:flutter/material.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          '추가 화면',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[200],
        elevation: 0.0,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                alignment: Alignment.topCenter,
                image: AssetImage('assets/clouds.png'))),
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Text('날짜'),
              SizedBox(
                height: 40,
              ),
              Text('오늘을 기록할 방법을 골라주세요'),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: IconButton(
                            onPressed: () {},
                            icon: Image(
                                image: AssetImage('assets/dotted_box.png'))),
                      ),
                      Text('사진으로 오늘을 기록')
                    ],
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                              context, 
                              MaterialPageRoute(builder: (context) => TextDiary()));
                          },
                          icon: Image(
                              image: AssetImage('assets/dotted_box.png'))),
                      Text('글로 오늘을 기록')
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
