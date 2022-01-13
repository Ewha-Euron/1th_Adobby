import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff6667ab),
      appBar: AppBar(
        backgroundColor: Color(0xff6667ab),
        title: Text("하루, 한 줄"),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Start your diary with AI"),
          onPressed: () {
            // Navigator.pushNamed(context, '/datepick');
            // Navigator.pushNamed(context, '/diarylist');
            Navigator.pushNamed(context, '/diarycontent');
        }
      ),
      ),
    );
  }
}