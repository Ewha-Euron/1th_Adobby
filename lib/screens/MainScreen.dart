import 'package:adobby/screens/AddScreen.dart';
import 'package:adobby/screens/CalendarScreen.dart';
import 'package:adobby/widgets/DatetimePicker.dart';
//import 'package:adobby/widgets/DiaryList.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class Diary {
  int _id = 0;
  DateTime date = DateTime.now();
  Image? image;
  String text = '';
  String line = '';

  Diary(this.text);
}

class _MainScreenState extends State<MainScreen> {
  // 다이어리 목록을 저장할 리스트
  final _items = <Diary>[];

  // 다이어리 인풋 텍스트 조작을 위한 컨트롤러
  var _diaryController = TextEditingController();

  void dispose() {
    _diaryController.dispose();
    super.dispose();
  }

  Widget _buildItemWidget(Diary diary) {
    return Card(
      child: ListTile(
        onTap: () {},
        leading: Text(
          DateFormat.MMMd().format(diary.date),
        ),
        title: Text(
          diary.line,
        ),
        subtitle: Text(
          diary.text,
        ),
        //trailing: Image(image: diary.image,), nullsafety 때문에 계속 에러 나는 듯
        isThreeLine: true,
      ),
    );
  }

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
            Expanded(
                child: ListView(
              children: _items.reversed
                  .map((diary) => _buildItemWidget(diary))
                  .toList(),
            ))
          ],
        )),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.deepPurple[800],
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddScreen()));
          }),
    );
  }
}
