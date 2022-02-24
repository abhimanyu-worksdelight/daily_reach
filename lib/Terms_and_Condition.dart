import 'dart:ui';

import 'package:dailyreach/network_api/const.dart';
import 'package:dailyreach/network_api/shared_preference.dart';
import 'package:flutter/material.dart';

class TermsCondition extends StatefulWidget{

  @override
  State<TermsCondition> createState() => _TermsConditionState();
}

class _TermsConditionState extends State<TermsCondition> {
  @override
  void initState(){
    gettermsText();
  }

    void gettermsText(){
      Future<String> status = SharedPreference.getStringValuesSF(Constants.termsconditionStr);
    status.then(
        (value) => {
              Constants.termsStr = value
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
                highlightColor: Colors.transparent,
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
                  child: Text('Terms and Conditions',style: TextStyle(color: Colors.black,fontFamily: "segoe" ,fontSize: 30,fontWeight: FontWeight.w400)
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
              child: Text(Constants.parseHtmlString(Constants.termsStr),style: TextStyle(color: Colors.black,fontFamily:"segoe" ,fontSize: 20,fontWeight: FontWeight.w100),),
            ),
          ),
          ),
        )

      ]),
    );


    
  }





}