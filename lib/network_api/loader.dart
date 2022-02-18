import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/material.dart';

class EasyLoader {
  
  static void customizeLoader() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = Colors.white
      ..backgroundColor = Colors.purple
      ..indicatorColor = Colors.white
      ..textColor = Colors.white
      ..maskColor = Colors.black.withOpacity(0.5)
      ..userInteractions = false
      ..dismissOnTap = false;
  }

  static void showLoader() {
    EasyLoading.show(status: '');
  }

  static void hideLoader() {
    EasyLoading.dismiss();
  }
}
