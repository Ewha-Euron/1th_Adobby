import 'package:adobby/model/diaryList.dart';
import 'package:adobby/model/lineInitialize.dart';
import 'package:adobby/screens/AddScreen.dart';
import 'package:adobby/screens/CalendarScreen.dart';
import 'package:adobby/screens/DetailScreen.dart';
import 'package:adobby/widgets/Diary.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:adobby/model/textDiary.dart';
import 'package:adobby/widgets/DiaryEvent.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // 다이어리 목록을 저장할 리스트
  var items = <Diary>[];
  var itemsToCalendar = <Diary>[];
  String dateText = DateFormat.yMMM().format(DateTime.now());
  int yearMonth = 202201;

  Future<DiaryList>? diarylist;
  //DiaryList? diarylist;

  // 일기 목록 불러오기
  /*
  void initState() async {
    super.initState();
    diarylist = GetFromServer().getDiaryList('androidId', yearMonth);
    items = (diarylist != null) ? (await diarylist)!.diaryList : <Diary>[];
  }*/

  Future<LineInitialize>? lineinitialize;

  // 일기 작성
  void _awaitReturnValueFromAddScreen(BuildContext context) async {
    final diaryItem = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddScreen()));
    if (diaryItem != null) {
      lineinitialize = SendToServer().newTextDiary(
          diaryItem.title, diaryItem.text, diaryItem.dateInt, 'androidId');
      items.add(diaryItem);
      setState(() {});
    }
  }

  Widget _buildItemWidget(Diary diary) {
    return Card(
      child: ListTile(
        onTap: () async {
          final detailedDiary = new Diary(title: diary.title, text: diary.text);

          final modifiedLine = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailScreen(
                        detailedDiary: detailedDiary,
                      )));

          setState(() {
            diary.line = modifiedLine;
          });
        },
        leading: Text(
          DateFormat.MMMd().format(diary.date),
        ),
        title: Text(
          diary.title,
        ),
        subtitle: Text(
          //diary.text,
          diary.line,
        ),
        isThreeLine: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    String datetext = dateText;
    int dateYearMonth = 202201;

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
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CalendarScreen(
                          returnItems: items,
                        )));
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
      body: Center(
        child: Container(
          width: width - 20,
          decoration: BoxDecoration(
              image: DecorationImage(
                  alignment: Alignment.topCenter,
                  image: AssetImage('assets/clouds.png'))),
          child: Center(
              child: Column(
            children: <Widget>[
              TextButton(
                  onPressed: () {
                    DatePicker.showDatePicker(context,
                        showTitleActions: true,
                        minTime: DateTime(2018, 1),
                        maxTime: DateTime(2022, 1),
                        theme: DatePickerTheme(
                            headerColor: Colors.grey,
                            backgroundColor: Colors.deepPurple,
                            itemStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                            doneStyle:
                                TextStyle(color: Colors.white, fontSize: 16)),
                        onChanged: (date) {
                      print('change $date in time zone ' +
                          date.timeZoneOffset.inHours.toString());
                    }, onConfirm: (date) {
                      print('confirm $date');
                      setState(() {
                        dateText = DateFormat.yMMM().format(date);
                        datetext = DateFormat.yMMM().format(date);
                        yearMonth =
                            int.parse(DateFormat('yyyyMM').format(date));
                        // 선택한 날짜의 다이어리 리스트 불러오기
                        //diarylist = GetFromServer()
                        //    .getDiaryList('androidId', yearMonth);
                      });
                    }, currentTime: DateTime.now(), locale: LocaleType.ko);
                  },
                  child: Text(
                    datetext,
                    style: TextStyle(
                        color: Colors.deepPurple[400],
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )),
              Expanded(
                  child: ListView(
                children: items.reversed
                    .map((diary) =>
                        DateFormat.yMMM().format(diary.date) == datetext
                            ? _buildItemWidget(diary)
                            : Container())
                    .toList(),
              ))
            ],
          )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.deepPurple[800],
          onPressed: () {
            _awaitReturnValueFromAddScreen(context);
          }),
    );
  }
}
