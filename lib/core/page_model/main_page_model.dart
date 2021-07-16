import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MainPageModel extends GetxController {
  RxInt _navigatorValue = 0.obs;

  get navigatorValue => _navigatorValue.value;

  void setSelectedValue(int selectedValue) {
    _navigatorValue.value = selectedValue;
    //update();
  }

}