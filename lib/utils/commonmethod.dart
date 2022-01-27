import 'package:flutter/material.dart';
class CommonMethod {
  static bool validateEmail(String value) {
    if (value.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  static bool validatePassword(String value) {
    if (value.isEmpty) {
      return false;
    } else if (value.length < 6) {
      return true;
    } else {
      return true;
    }
  }
}