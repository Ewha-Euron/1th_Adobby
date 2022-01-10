import 'package:adobby/screens/DetailScreen.dart';
import 'package:adobby/screens/MainScreen.dart';
import 'package:adobby/widgets/Diary.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../widgets/utils.dart';
import 'package:intl/intl.dart';

var items = <Diary>[];

class CalendarScreen extends StatefulWidget {
  var returnItems = <Diary>[];

  CalendarScreen({Key? key, required this.returnItems}) {
    items = this.returnItems;
  }

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  Widget _buildItemWidget(Diary diary) {
    return Card(
      child: ListTile(
        onTap: () {
          final detailedDiary = new Diary(title: diary.title, text: diary.text);

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailScreen(
                        detailedDiary: detailedDiary,
                      )));
        },
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
        isThreeLine: true,
      ),
    );
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
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Text(
                  DateFormat.yMMMd().format(_selectedDay),
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView(
                  children: items
                      .map((diary) => (DateFormat.yMMMd().format(diary.date) ==
                              DateFormat.yMMMd().format(_selectedDay))
                          ? (_buildItemWidget(diary))
                          : (Container()))
                      .toList()),
            ),
          ],
        ),
      ),
    );
  }
}
