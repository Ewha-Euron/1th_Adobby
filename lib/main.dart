import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:get/get.dart';
import 'datePick.dart';
import 'diaryList.dart';
import 'mainPage.dart';

// import 'diaryContent.dart';;
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
        GetPage(name: '/diarylist', page: () => DiaryList()),
        GetPage(name: '/datepick', page: () => DatePick()),
      ],
    );
  }
}
=======
import 'package:adobby/screens/MainScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
>>>>>>> afdfb24fdf58ccbe0d04f9a906c961d2b852c050
