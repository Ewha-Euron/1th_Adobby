import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class DatetimePicker extends StatefulWidget {
  const DatetimePicker({Key? key}) : super(key: key);

  @override
  _DatetimePickerState createState() => _DatetimePickerState();
}

class _DatetimePickerState extends State<DatetimePicker> {
  String dateText = DateFormat.yMMM().format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return TextButton(
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
                  doneStyle: TextStyle(color: Colors.white, fontSize: 16)),
              onChanged: (date) {
            print('change $date in time zone ' +
                date.timeZoneOffset.inHours.toString());
          }, onConfirm: (date) {
            print('confirm $date');
            setState(() {
              dateText = DateFormat.yMMM().format(date);
            });
          }, currentTime: DateTime.now(), locale: LocaleType.ko);
        },
        child: Text(
          dateText,
          style: TextStyle(
              color: Colors.deepPurple[400],
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ));
  }
}
// picker에서 일은 없도록 수정해야 함
// onConfirm에 Text가 currentTime으로 나타나도록 수정해야 함