import 'package:adobby/screens/MainScreen.dart';
import 'package:adobby/widgets/Diary.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../widgets/utils.dart';
import 'package:intl/intl.dart';

var items = <Diary>[];

class CalendarScreen extends StatefulWidget {
  //var items = <Diary>[];

  CalendarScreen({Key? key, required items}) : super(key: key);

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

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

  // 메인 화면에서 items를 받아와야 됨
  void _awaitReturnValueFromMainScreen(BuildContext context) async {
    final returnItems = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => MainScreen()));

    setState(() {
      //items = returnItems;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          '캘린더',
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
        child: Column(
          children: <Widget>[
            TableCalendar(
              firstDay: kFirstDay,
              lastDay: kLastDay,
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              selectedDayPredicate: (day) {
                // Use `selectedDayPredicate` to determine which day is currently selected.
                // If this returns true, then `day` will be marked as selected.

                // Using `isSameDay` is recommended to disregard
                // the time-part of compared DateTime objects.
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                if (!isSameDay(_selectedDay, selectedDay)) {
                  // Call `setState()` when updating the selected day
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                }
              },
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  // Call `setState()` when updating calendar format
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
              onPageChanged: (focusedDay) {
                // No need to call `setState()` here
                _focusedDay = focusedDay;
              },
            ),
            Center(
                child: Container(
              width: width - 20,
              color: Colors.deepPurple[400],
              // items가 null이 아니라면 -> 이 조건이 필요
              //child: Expanded(
              //    child: ListView(
              //  children: items.reversed
              //      .map((diary) => _buildItemWidget(diary))
              //      .toList(), // 일단 테스트용

              //items.reversed
              //    .map((diary) =>
              //        if (diary.date == _selectedDay) {
              //           _buildItemWidget(diary);
              //        }
              //       )
              //    .toList(),
              // diary.date와 _selectedDay가 같을 때만 다이어리가 조건부 렌더링 되도록
              //items.reversed
              //    .map((diary) =>
              //    (diary.date == _selectedDay) ? (
              //      _buildItemWidget(diary)) : ())
              //    .toList(),
              //items.reversed.map((diary) => (
              //  (diary.date == _selectedDay) ? (
              //    _buildItemWidget(diary)
              //  ) : (null)
              //)).toList(),
            )),
          ],
        ),
      ),
    );
  }
}
