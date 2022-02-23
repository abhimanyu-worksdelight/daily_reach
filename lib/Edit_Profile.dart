import 'package:connectivity/connectivity.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:dailyreach/Privacy_Policy.dart';
import 'package:dailyreach/Terms_and_Condition.dart';
import 'package:dailyreach/network_api/Toast.dart';
import 'package:dailyreach/network_api/api_interface.dart';
import 'package:dailyreach/network_api/const.dart';
import 'package:dailyreach/network_api/loader.dart';
import 'package:dailyreach/network_api/network_util.dart';
import 'package:dailyreach/profile_screen.dart';
import 'package:dailyreach/utils/commonmethod.dart';
import 'package:dailyreach/utils/flash_Helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'login_screen.dart';

class EditProfile extends StatefulWidget {
  String name;
  String email;
  String phone;

  EditProfile({
    required this.name,
    required this.email,
    required this.phone
  });
  
  @override
  State<EditProfile> createState() => _EditProfile();
}

class _EditProfile extends State<EditProfile>  {
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
                    padding: const EdgeInsets.only(top: 30, left: 182),
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
                        padding: const EdgeInsets.only(top: 60, left: 30),
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
                        padding: const EdgeInsets.only(top: 60, left: 30),
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
            padding: const EdgeInsets.only(left: 30, right: 25, top: 27),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                'Update your profile',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: "segoe",
                  fontSize: 22,
                ),
              ),

              Stack(
          children: [
            
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20, ),
                child: Image.asset(
                  'assets/images/ellispe5.png',
                  height: 120,
                  width: 120,
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Image.asset(
                  'assets/images/camera.png',
                  height: 40,
                  width: 40,
                ),
              ),
            ),
             Center(
               child: Padding(
                padding: EdgeInsets.only(top: 100),
                child: Text(
                  'Upload photo',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    fontFamily: "segoe",
                  ),
                ),
            ),
             ),
            
          

          ],
        ),
              
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Form(
                    key: _formKey,
                    child: Column(children: [
                      TextFormField(
                        controller: nameController,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                          labelText: 'Full Name',
                          contentPadding: EdgeInsets.only(left:0,top: 12,bottom: 12),
                          labelStyle: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            fontFamily: "segoe",
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.grey, width: 0.0),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.grey, width: 0.0),
                          ),
                          border: UnderlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.grey, width: 0.0),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.red, width: 0.0),
                          ),
                          disabledBorder: UnderlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.grey, width: 0.0),
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
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            labelText: 'Email Address',
                            contentPadding: EdgeInsets.only(left:0,top:12,bottom: 12),
                            labelStyle: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              fontFamily: "segoe",
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.grey, width: 0.0),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.grey, width: 0.0),
                            ),
                            border: UnderlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.grey, width: 0.0),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.red, width: 0.0),
                            ),
                            disabledBorder: UnderlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.grey, width: 0.0),
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
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Container(
                              margin: const EdgeInsets.only(top: 12,bottom: 12,left: 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    children: [
                                      CountryCodePicker(
                                        onChanged: print,
                                        initialSelection: 'US',
                                        favorite: const ['+1', 'US'],
                                        flagWidth: 25,
                                        textStyle: const TextStyle(
                                          fontSize: 13,
                                        ),
                                        showCountryOnly: false,
                                        showOnlyCountryWhenClosed: false,
                                        alignLeft: false,
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 0,left: 0),
                                    height: 1.1,
                                    width: 80,
                                    color: Color.fromARGB(174, 146, 142, 142),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: TextFormField(
                                controller: phoneController,
                                
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.only(left:0,top:0,bottom: 12),
                                  labelText: 'Phone Number',
                                  labelStyle: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "segoe",
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.grey, width: 0.0),
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.grey, width: 0.0),
                          ),
                          border: UnderlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.grey, width: 0.0),
                          ),
                          errorBorder: UnderlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.red, width: 0.0),
                          ),
                          disabledBorder: UnderlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.grey, width: 0.0),
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
                                inputFormatters: [LengthLimitingTextInputFormatter(15)],
                              ),
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          _submit();
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 190),
                          child: Container(
                              width: 325,
                              height: 50,
                              child: const Padding(
                                padding: EdgeInsets.only(top: 14, bottom: 15),
                                child: Text(
                                  'Update',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontFamily: "segoe",
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(228, 189, 20, 20),
                                  borderRadius: BorderRadius.circular(50),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.white,
                                        blurRadius: 3.0,
                                        spreadRadius: 1.0)
                                  ])),
                        ),
                      ),
                     
                    ])),
              )
            ]),
          ),
        ])));
  }

  void _submit() {
    final isValid = _formKey.currentState?.validate();
    if (isValid == false) {
      ToastManager.errorToast('Please check your data');
      return;
    } else {
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => Profile_screen()));

      
    }
    _formKey.currentState?.save();
  }

  
}
