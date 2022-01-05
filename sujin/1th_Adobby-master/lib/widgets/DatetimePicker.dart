import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class DatetimePicker extends StatelessWidget {
  const DatetimePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          DatePicker.showDatePicker(context,
              showTitleActions: true,
              minTime: DateTime(2018, 1),
              maxTime: DateTime(2022, 12),
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
          }, currentTime: DateTime.now(), locale: LocaleType.ko);
        },
        child: Text(
          '날짜를 골라주세요!',
          style: TextStyle(
              color: Colors.deepPurple[400],
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ));
  }
}
// picker에서 일은 없도록 수정해야 함
// onConfirm에 Text가 currentTime으로 나타나도록 수정해야 함