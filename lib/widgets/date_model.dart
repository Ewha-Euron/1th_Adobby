import 'date_format.dart';
import 'i18n_model.dart';
import 'datetime_util.dart';
import 'dart:math';

abstract class BasePickerModel {
  //a getter method for left column data, return null to end list
  String leftStringAtIndex(int index);
  //a getter method for middle column data, return null to end list
  String middleStringAtIndex(int index);
  //a getter method for right column data, return null to end list
  String rightStringAtIndex(int index);
  //set selected left index
  void setLeftIndex(int index);
  //set selected middle index
  void setMiddleIndex(int index);
  //set selected right index
  void setRightIndex(int index);
  //return current left index
  int currentLeftIndex();
  //return current middle index
  int currentMiddleIndex();
  //return current right index
  int currentRightIndex();
  //return final time
  DateTime finalTime();
  //return left divider string
  String leftDivider();
  //return right divider string
  String rightDivider();
  //layout proportions for 3 columns
  List<int> layoutProportions();
}

//a base class for picker data model
class CommonPickerModel extends BasePickerModel {
  List<String> leftList;
  List<String> middleList;
  List<String> rightList;
  DateTime currentTime;
  int _currentLeftIndex;
  int _currentMiddleIndex;
  int _currentRightIndex;

  LocaleType locale;

  CommonPickerModel({this.currentTime, locale})
      : this.locale = locale ?? LocaleType.en;

  @override
  String leftStringAtIndex(int index) {
    return '';
  }

  @override
  String middleStringAtIndex(int index) {
    return '';
  }

  @override
  String rightStringAtIndex(int index) {
    return '';
  }

  @override
  int currentLeftIndex() {
    return _currentLeftIndex;
  }

  @override
  int currentMiddleIndex() {
    return _currentMiddleIndex;
  }

  @override
  int currentRightIndex() {
    return _currentRightIndex;
  }

  @override
  void setLeftIndex(int index) {
    _currentLeftIndex = index;
  }

  @override
  void setMiddleIndex(int index) {
    _currentMiddleIndex = index;
  }

  @override
  void setRightIndex(int index) {
    _currentRightIndex = index;
  }

  @override
  String leftDivider() {
    return "";
  }

  @override
  String rightDivider() {
    return "";
  }

  @override
  List<int> layoutProportions() {
    return [1, 1, 1];
  }

  @override
  DateTime finalTime() {
    return null;
  }
}
