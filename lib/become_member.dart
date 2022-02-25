import 'package:connectivity/connectivity.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:dailyreach/Privacy_Policy.dart';
import 'package:dailyreach/Terms_and_Condition.dart';
import 'package:dailyreach/network_api/Toast.dart';
import 'package:dailyreach/network_api/api_interface.dart';
import 'package:dailyreach/network_api/const.dart';
import 'package:dailyreach/network_api/loader.dart';
import 'package:dailyreach/network_api/network_util.dart';
import 'package:dailyreach/Profile_Screen.dart';
import 'package:dailyreach/utils/commonmethod.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'login_screen.dart';

class Become_member extends StatefulWidget {
  @override
  State<Become_member> createState() {
    return _Become_member();
  }
}

class _Become_member extends State<Become_member> implements ApiInterface {
  bool _ischecked = false;
  bool _isObscure = true;
  bool _isObscureConfirm = true;
  var passwordcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isClick = false;
  NetworkUtil _networkUtil = new NetworkUtil();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final createPasswordctrl = TextEditingController();
  final confirmpsdctrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(children: [
          Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/subtract.png',
                    height: 100,
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: 30, left: 182),
                    child: Image.asset(
                      'assets/images/vector.png',
                      height: 54,
                      width: 90,
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(top: 60, left: 30),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset(
                            'assets/images/arrow.png',
                            height: 32,
                            width: 32,
                          ),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top: 60, left: 30),
                        child: Image.asset(
                          'assets/images/daily_reach_logo.png',
                          height: 42,
                          width: 190,
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
          Padding(
            padding:  EdgeInsets.only(left: 30, right: 25, top: 27),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
               Text(
                'Become a Member',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: "segoe",
                  fontSize: 22,
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(top: 7),
                child: Text(
                  'We need some personal information to register with us.',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontFamily: "segoe",
                    fontSize: 14,
                    color:  Color(0xff4C4949).withOpacity(0.8),
                  ),
                ),
              ),
              Form(
                  key: _formKey,
                  child: Column(children: [
                    TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      decoration:  InputDecoration(
                        labelText: 'Full Name',
                        contentPadding: EdgeInsets.only(left:0,top: 12,bottom: 12),
                        labelStyle: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          fontFamily: "segoe",
                          color: Colors.grey
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                               BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                               BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        border: UnderlineInputBorder(
                          borderSide:
                               BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide:
                               BorderSide(color: Colors.red, width: 0.0),
                        ),
                        disabledBorder: UnderlineInputBorder(
                          borderSide:
                               BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter name';
                        }
                        
                        return null;
                      },
                      inputFormatters: [ FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")), ]


                    ),
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration:  InputDecoration(
                        labelText: 'Email Address',
                        contentPadding: EdgeInsets.only(left:0,top:12,bottom: 12),
                        labelStyle: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          fontFamily: "segoe",
                          color: Colors.grey
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                               BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                               BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        border: UnderlineInputBorder(
                          borderSide:
                               BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide:
                               BorderSide(color: Colors.red, width: 0.0),
                        ),
                        disabledBorder: UnderlineInputBorder(
                          borderSide:
                               BorderSide(color: Colors.grey, width: 0.0),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                          return 'Enter a valid email!';
                        }
                        return null;
                      },
                    ),
                    Row(
                      children: [
                        Container(
                          margin:  EdgeInsets.only(top: 12,bottom: 12,left: 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  CountryCodePicker(
                                    onChanged: print,
                                    initialSelection: 'US',
                                    favorite:  ['+1', 'US'],
                                    flagWidth: 25,
                                    textStyle:  TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey
                                    ),
                                    showCountryOnly: false,
                                    showOnlyCountryWhenClosed: false,
                                    alignLeft: false,
                                  ),
                                ],
                              ),
                              Container(
                                margin:  EdgeInsets.only(top: 0,left: 0),
                                height: 1.1,
                                width: 80,
                                color: Color.fromARGB(174, 146, 142, 142),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: TextFormField(
                            controller: phoneController,
                            
                            decoration:  InputDecoration(
                              contentPadding: EdgeInsets.only(left:0,top:0,bottom: 12),
                              labelText: 'Phone Number',
                              labelStyle: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                fontFamily: "segoe",
                                color: Colors.grey
                              ),
                              enabledBorder: UnderlineInputBorder(
                          borderSide:
                               BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                               BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        border: UnderlineInputBorder(
                          borderSide:
                               BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide:
                               BorderSide(color: Colors.red, width: 0.0),
                        ),
                        disabledBorder: UnderlineInputBorder(
                          borderSide:
                               BorderSide(color: Colors.grey, width: 0.0),
                        ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter a valid Phone Number!';
                              } else if (value.length < 7 ) {
                                return 'Enter valid Phone Number!';
                              }
                              return null;
                            },
                            inputFormatters: [LengthLimitingTextInputFormatter(10)],
                          ),
                        ),
                      ],
                    ),
                    TextFormField(
                      controller: createPasswordctrl,
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 12,bottom: 12,left: 0),
                        labelText: 'Create Password',
                        labelStyle:  TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          fontFamily: "segoe",
                          color: Colors.grey
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(_isObscure
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,color: Colors.grey,),
                          onPressed: () {
                            setState(
                              () {
                                _isObscure = !_isObscure;
                              },
                            );
                          },
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                             BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                               BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        border: UnderlineInputBorder(
                          borderSide:
                               BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide:
                               BorderSide(color: Colors.red, width: 0.0),
                        ),
                        disabledBorder: UnderlineInputBorder(
                          borderSide:
                               BorderSide(color: Colors.grey, width: 0.0),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter a valid password!';
                        } else if (value.length < 6) {
                          return 'Enter at least 6 digit';
                        } else {
                          return null;
                        }
                      },
                    ),
                    TextFormField(
                      obscureText: _isObscureConfirm,
                      controller: confirmpsdctrl,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 12,bottom: 12,left: 0),
                        labelText: 'Confirm Password',
                        labelStyle:  TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          fontFamily: "segoe",
                          color: Colors.grey
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(_isObscureConfirm
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,color: Colors.grey,),
                          onPressed: () {
                            setState(
                              () {
                                _isObscureConfirm = !_isObscureConfirm;
                              },
                            );
                          },
                        ),
                        // enabledBorder: InputBorder.none,
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                               BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                               BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        border: UnderlineInputBorder(
                          borderSide:
                               BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide:
                               BorderSide(color: Colors.red, width: 0.0),
                        ),
                        disabledBorder: UnderlineInputBorder(
                          borderSide:
                               BorderSide(color: Colors.grey, width: 0.0),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter a valid password!';
                        } else if (value.length < 6) {
                          return 'Enter at least 6 digit';
                        } else if (value != createPasswordctrl.text) {
                          return 'Enter a valid password!';
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 29),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            highlightColor: Colors.transparent,
                            onTap: () {
                              setState(() {
                              
                                isClick = !isClick;
                              });
                            },

                            
                            child: Container(
                                height: 19,
                                width: 19,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color.fromARGB(100, 214, 212, 212),
                                      width: 1.5),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                child: (isClick == true)
                                    ? Icon(Icons.check,
                                        size: 18,
                                        color: Color.fromARGB(228, 189, 20, 20))
                                    : Container()),
                          ),
                          // Checkbox(
                          //   checkColor: Color.fromARGB(100, 214, 212, 212),
                          //   value: _ischecked,
                          //   onChanged: (v) {
                          //     setState(() {
                          //       _ischecked = v!;
                          //     });
                          //   },
                          // ),
                          Padding(
                            padding:  EdgeInsets.only(left: 10),
                            child: RichText(
                              text:  TextSpan(
                                  text: 'I agree with',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: -1,
                                    fontFamily: "segoe",
                                    color: Color.fromARGB(153, 57, 55, 55),
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: ' Terms of use ',
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            fontFamily: "segoe",
                                            letterSpacing: -1,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black),recognizer: TapGestureRecognizer()..onTap = () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=> TermsCondition()));
                                          },),
                                    TextSpan(
                                      text: ' and  ',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: -1,
                                        fontFamily: "segoe",
                                        color: Color.fromARGB(153, 57, 55, 55),
                                      ),
                                      
                                    ),
                                    TextSpan(
                                      text: 'Privacy Policy',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontFamily: "segoe",
                                        letterSpacing: -1,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                      recognizer: TapGestureRecognizer()..onTap = () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=> PrivacyPolicy()));
                                          }
                                    )
                                  ]
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        
                           _submit();
                        
                      },
                      child: Padding(
                        padding:  EdgeInsets.only(top: 46),
                        child: Container(
                            width: 325,
                            height: 50,
                            child:  Padding(
                              padding: EdgeInsets.only(top: 14, bottom: 15),
                              child: Text(
                                'Become a Member',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontFamily: "segoe",
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            decoration: BoxDecoration(
                                color:  Color.fromARGB(228, 189, 20, 20),
                                borderRadius: BorderRadius.circular(50),
                                boxShadow:  [
                                  BoxShadow(
                                      color: Colors.white,
                                      blurRadius: 3.0,
                                      spreadRadius: 1.0)
                                ])),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(top: 23),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(top: 4),
                            child: InkWell(
                              highlightColor: Colors.transparent,
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login_screen(isfromSignup: false,)));
                              },
                              child: Text(
                                'Already have an account? ',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "segoe",
                                  color: Color(0XFF8D95B2),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login_screen(isfromSignup: false,)));
                            },
                            child:  Text(
                              'Login',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "segoe",
                                  color: Color.fromARGB(228, 189, 20, 20),
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]))
            ]),
          ),
        ])));
  }

  void _submit() {
    final isValid = _formKey.currentState?.validate();
    if (isValid == false) {
      ToastManager.errorToast('Please check your data');
      return;
    } 
    else if(isClick == false){
      ToastManager.errorToast('Please select terms and conditions');
      return;
    }
    else {
      registerApi();
    }
    _formKey.currentState?.save();
  }

  @override
  void onFailure(message, code) {
    ToastManager.errorToast('error');
    EasyLoader.hideLoader();
  }

  @override
  void onSuccess(data, code) {
    EasyLoader.hideLoader();
    var dataVal = data['data'];
    var message = data['message'];
    if (data['status'] == 1) {
      print('successfully registered');

      Constants.token = data['token'];
      
      Navigator.pushAndRemoveUntil<void>(
        context,
        MaterialPageRoute<void>(builder: (BuildContext context) => Login_screen(isfromSignup: true,)),
        ModalRoute.withName('/'),
      );
    } else {
      print('error while login');
      ToastManager.errorToast('$message');
    }
  }

  @override
  void onTokenExpire(message, code) {
     ToastManager.errorToast('Token expired');
    EasyLoader.hideLoader();
  }

  void registerApi() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      // FlashHelper.singleFlash(context, 'Check your internet');
      ToastManager.errorToast('Check internet connection');
    } else {
      EasyLoader.showLoader();
      _networkUtil.post(Constants.registerUrl, this, body: {
        'email': emailController.text,
        'password': confirmpsdctrl.text,
        'name': nameController.text,
        'phone': phoneController.text,
      });
    }
  }
}
