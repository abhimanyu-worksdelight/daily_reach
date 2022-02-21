
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:intl/intl.dart' as intl;


class Constants{
 


  
  static String baseUrl = "http://daily-reach-2022.us-east-2.elasticbeanstalk.com/api/";
  static String feedUrl = "posts";
  static String loginUrl = "login";
  static String registerUrl = "register";
  static String archiveUrl = "archive-posts";







  // sharedPref values
  static String loginStatus = "loginStatus";
  static String userId = "id";
  static String firstName = "firstName";
  static String lastName = "lastName";
  static String email = "email";
  static String image = "image";
  static String status = "status";
  static String phoneNumber = "phone";
  static String addressData = "addressData";
  static String city = "city";
  static String isLogin = "isLogin";
  static String token = "token";
  static String registerType = "registerType";
  static String businessName = "businessName";
  static String device = "device";
  static String oneSignalId = "oneSignalId";



  //Global keys

   static bool isLoggedIn = false;
    



static String parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString =
        parse(document.body?.text).documentElement?.text ?? "";
    return (parsedString == "null") ? "" : parsedString;
  }

static String convertDateFormate(String dateString){
  var format = intl.DateFormat("yyyy-MM-dd'T'HH:mm:ssZ");
  var timeNowDateTime = format.parse("$dateString");
  var date = intl.DateFormat('EEE, dd MMM, yyyy').format(timeNowDateTime);
  return date;
}
}

  //Colors

  class AppColors {
  static Color buttonBackColor = Color(0XFFD6D4D4);
  static Color lineColor = Color(0XFFB9BFD6B2);
  static Color AlreadyMemberColor = Color(0XFF8D95B2);
  }