/*import 'package:adobby/screens/AddScreen.dart';*/
import 'package:adobby/screens/CalendarScreen.dart';
import 'package:adobby/screens/TextDiary.dart';
import 'package:adobby/widgets/DatetimePicker.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          '하루 한 줄',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[200],
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.calendar_today),
          color: Colors.deepPurple[400],
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CalendarScreen()));
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications),
            color: Colors.deepPurple[400],
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                alignment: Alignment.topCenter,
                image: AssetImage('assets/clouds.png'))),
        child: Center(
            child: Column(
          children: <Widget>[
            DatetimePicker(),
          ],
        )),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.deepPurple[800],
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => TextDiary()));
          }),
    );
  }
}
