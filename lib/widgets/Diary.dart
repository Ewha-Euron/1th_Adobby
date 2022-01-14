import 'dart:io';
import 'package:flutter/services.dart';
import 'package:device_info/device_info.dart';

var androidId = getId();
int num = 1;

class Diary {
  int diaryId = num++;
  DateTime date = DateTime.now();
  String title;
  String text;
  String line = '';

  Diary({this.title = '', this.text = ''});
}

Future<String> getId() async {
  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  String id = '';
  try {
    // 플랫폼 확인
    if (Platform.isAndroid) {
      final AndroidDeviceInfo androidData = await deviceInfoPlugin.androidInfo;
      id = androidData.androidId;
    } else if (Platform.isIOS) {
      final IosDeviceInfo iosData = await deviceInfoPlugin.iosInfo;
      id = iosData.identifierForVendor;
    }
  } on PlatformException {
    id = '';
  }
  print('id: $id');
  return id;
}
