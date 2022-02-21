import 'dart:convert';
import 'package:dailyreach/utils/UrlConstants.dart';
import 'package:flutter/material.dart';
import '../utils/GlobalConstants.dart';
import 'api_interface.dart';
import 'package:http/http.dart' as http;

class ApiClass{
  static Future<http.Response?> registerApi(String email, String phone,String name,String password,
      ApiInterface callBack, BuildContext context) async
  {
    try {
      final response =
      await http.post(Uri.parse(GlobalConstants.register), headers: {
        "Accept": "application/json"
      }, body: {
        //change this
        URlConstants.phone: phone,
        URlConstants.name: name,
        URlConstants.password: password,
        URlConstants.email: email,


      });

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        print(data);
        if(data['status']==1){
          callBack.onSuccess(data);
        }else{
          callBack.onFailure(
              data['message']);
        }


      } else {
        callBack.onFailure(
            "server error");
      }
    } catch (e) {
      callBack
          .onFailure(e.toString());
    }
  }




  static Future<http.Response?> loginApi(String email,String password,
      ApiInterface callBack, BuildContext context) async {
    try {
      final response =
      await http.post(Uri.parse(GlobalConstants.login), headers: {
        "Accept": "application/json"
      }, body: {

        URlConstants.password: password,
        URlConstants.email: email,


      });

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        if(data['status']==1){
          print(data);

          callBack.onSuccess(data);
        }else{
          callBack.onFailure(
              data['message']);
        }


        // If server returns an OK response, parse the JSON
      } else {
        // If that response was not OK, throw an error.
        callBack.onFailure(
            "server error");
      }
    } catch (e) {
      callBack
          .onFailure(e.toString());
    }
  }


}



