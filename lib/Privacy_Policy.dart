import 'dart:ui';

import 'package:dailyreach/network_api/const.dart';
import 'package:dailyreach/network_api/shared_preference.dart';
import 'package:flutter/material.dart';

class PrivacyPolicy extends StatefulWidget{

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  void initState(){
    getpolicyText();
  }

    void getpolicyText(){
      Future<String> status = SharedPreference.getStringValuesSF(Constants.privacyPolicyStr);
    status.then(
        (value) => {
              Constants.policyStr = value
            }, onError: (err) {
      print("Error occured :: $err");
    });

    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [

        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Row(
            children: [
              InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Image.asset("assets/images/arrowvector.png",
                      color: Colors.black,
                      width: 24,
                      height: 24,),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Text('Privacy Policy',style: TextStyle(color: Colors.black,fontFamily: "segoe" ,fontSize: 40,fontWeight: FontWeight.w400)
                  ),
                ),
              ),
            ],
          ),

        ),
        Expanded(
          child: Padding(padding: EdgeInsets.only(top: 30),
          child: Container(
            child: SingleChildScrollView(
              child: Text(Constants.parseHtmlString(Constants.policyStr),style: TextStyle(color: Colors.black,fontFamily:"segoe" ,fontSize: 20,fontWeight: FontWeight.w100),),
            ),
          ),
          ),
        )

      ]),
    );


    
  }





}