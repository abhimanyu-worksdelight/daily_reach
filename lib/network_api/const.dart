
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
  static String generalSettingsUrl = "general-settings";
  static String logoutUrl = "logout";
  static String archivePostUrl = "archive-posts";
  static String categoryUrl = "categories";
  static String editProfileUrl = "edit-profile";
  static String forgetPasswordUrl = "forget-password";


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
  // static String oneSignalId = "oneSignalId";
  static String videoStr = 'videoStr';
  static String privacyPolicyStr = 'privacyPolicyStr';
  static String termsconditionStr = 'termsconditionStr';
  static String deviceId = 'deviceId';



  //Global keys

   static bool isLoggedIn = false;
   static String policyStr = "";
   static String termsStr = "";
   static String tokenStr = "";
   static String nameStr = "";
   static String emailStr = "";
   static String phoneStr = "";
   static String OneSignalId = "ab6953fd-aee4-4a8f-b73a-cabbf25db26c";
   static String deviceIdStr = "";



static String parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString =
        parse(document.body?.text).documentElement?.text ?? "";
    return (parsedString == "null") ? "" : parsedString;
  }

static String convertDateFormate(String dateString){
  var format = intl.DateFormat("yyyy-MM-dd HH:mm:ss");
  var timeNowDateTime = format.parse("$dateString");
  var date = intl.DateFormat('EEE, dd MMM, yyyy').format(timeNowDateTime);
  return date;
}
static String convertDateFormateFeed(String dateString){
  var format = intl.DateFormat("yyyy-MM-dd HH:mm:ss");
  var timeNowDateTime = format.parse("$dateString");
  var date = intl.DateFormat('EEEE, dd MMM, yyyy').format(timeNowDateTime);
  return date;
}

static String convertDateToTime(String dateTime){
  var format = intl.DateFormat("yyyy-MM-dd HH:mm:ss");
  var timeNowDateTime = format.parse("$dateTime");
  var date = intl.DateFormat('HH:mm a').format(timeNowDateTime);
  return date;
}
}

  //Colors

  class AppColors {
  static Color buttonBackColor = Color(0XFFD6D4D4);
  static Color lineColor = Color(0XFFB9BFD6B2);
  static Color AlreadyMemberColor = Color(0XFF8D95B2);
  static Color phoneTextColor = Color(0XFF8D95B2);
  static Color BackgroundColor = Color(0XFFF5F5F5);
  static Color ImageBackColor = Color(0XFFDFE2EF);
  static Color CameraIconColor = Color(0XFF8D95B2);
  static Color WelcomeTextColor = Color(0XFF4C4949);
  // static Color LineColor = Color(0XFFB9BFD6);
  static Color CatBackColor = Color(0XFFD6D4D4);
  static Color editBackColor = Color(0XFFB80000);
  static Color backListcolor = Color(0XFFE5E5E5);


  }