import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'diaryContent.dart';
import 'diaryEdit.dart';
import 'datePick.dart';
import 'diaryList.dart';
import 'mainPage.dart';


// import 'splash.dart';

// import 'inferenceResult.dart';
// import 'calendar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: "/", page: () => MainPage()),
        GetPage(name: '/diarycontent', page: () => DiaryContent()),
        GetPage(name: '/diaryedit', page: () => DiaryEdit()),
        GetPage(name: '/diarylist', page: () => DiaryList()),
        GetPage(name: '/datepick', page: () => DatePick()),
      ],
    );
  }
}