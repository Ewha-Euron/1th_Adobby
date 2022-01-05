import 'package:flutter/material.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({Key? key}) : super(key: key);

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            child: Text(
              "$_selectedDate",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            child: ScrollDatePicker(
              minimumYear: 2010,
              maximumYear: 2050,
              selectedDate: _selectedDate,
              locale: DatePickerLocale.ko_kr,
              options: const DatePickerOptions(),
              onDateTimeChanged: (DateTime value) {
                setState(() {
                  _selectedDate = value;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
