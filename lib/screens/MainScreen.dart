import 'package:adobby/screens/AddScreen.dart';
import 'package:adobby/screens/CalendarScreen.dart';
import 'package:adobby/widgets/DatetimePicker.dart';
import 'package:adobby/widgets/Diary.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // 다이어리 목록을 저장할 리스트
  final items = <Diary>[];

  // 테스트용
  String text = 'Text';
  String title = 'Title';

  // 다이어리 인풋 텍스트 조작을 위한 컨트롤러
  //var _diaryController = TextEditingController();

  //void dispose() {
  //  _diaryController.dispose();
  //  super.dispose();
  //}

  Widget _buildItemWidget(Diary diary) {
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

  // async 타입으로 동기화가 가능한 형태로 선언
  void _awaitReturnValueFromAddScreen(BuildContext context) async {
    // Navigator.push()의 결과값을 result에 할당
    // 동기화 가능하도록 await 타입으로 Navigator.push() 함수 선언
    final diaryItem = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddScreen()));

    items.add(diaryItem);

    // AddScreen으로부터 입력받은 전달값을 setState() 함수를 통해 text에 result값 덮어쓰기
    setState(() {
      title = diaryItem.title;
      text = diaryItem.text;
    });
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
            Text(text),
            Text(title),
            Expanded(
                child: ListView(
              children: items.reversed
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
            _awaitReturnValueFromAddScreen(context);
            /*
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddScreen(
                        //items: items -> 여기서 왜 에러가 발생하는지..?
                        )));
            */
          }),
    );
  }
}
