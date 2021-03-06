import 'package:country_code_picker/country_code_picker.dart';
import 'package:dailyreach/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';

class Become_member extends StatefulWidget {
  @override
  State<Become_member> createState() {
    return _Become_member();
  }
}

class _Become_member extends State<Become_member> {
  bool _ischecked = false;
  bool _isObscure = true;
  var passwordcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isClick = false;

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
                'Become a Member',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: "segoe",
                  fontSize: 22,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 7),
                child: Text(
                  'We need some personal information to register with us.',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontFamily: "segoe",
                    fontSize: 14,
                    color: const Color(0xff4C4949).withOpacity(0.8),
                  ),
                ),
              ),
              Form(
                  key: _formKey,
                  child: Column(children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Full Name',
                        contentPadding: EdgeInsets.all(12),
                        labelStyle: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          fontFamily: "segoe",
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter name';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Email Address',
                        contentPadding: EdgeInsets.all(12),
                        labelStyle: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          fontFamily: "segoe",
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
                          margin: const EdgeInsets.only(top: 11),
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
                                margin: const EdgeInsets.only(top: 0),
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
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(12),
                              labelText: 'Phone Number',
                              labelStyle: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                fontFamily: "segoe",
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter a valid Phone Number!';
                              } else if (value.length < 6) {
                                return 'Enter valid Phone Number!';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    TextFormField(
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(12),
                        labelText: 'Create Password',
                        labelStyle: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          fontFamily: "segoe",
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(_isObscure
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined),
                          onPressed: () {
                            setState(
                              () {
                                _isObscure = !_isObscure;
                              },
                            );
                          },
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
                      obscureText: _isObscure,
                      controller: passwordcontroller,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(12),
                        labelText: 'Confirm Password',
                        labelStyle: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          fontFamily: "segoe",
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(_isObscure
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined),
                          onPressed: () {
                            setState(
                              () {
                                _isObscure = !_isObscure;
                              },
                            );
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value != passwordcontroller.text) {
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
                            onTap: () {
                              setState(() {
                                isClick = !isClick;
                              });
                            },
                            child: Container(
                              height: 19,
                                width:19,

                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color.fromARGB(100, 214, 212, 212),
                                      width: 1.5),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                child:isClick? Icon(
                                  Icons.check,size:18,color:Color.fromARGB(228, 189, 20, 20)
                                ):Container()),
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
                            padding: const EdgeInsets.only(left: 10),
                            child: RichText(
                              text: const TextSpan(
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
                                            color: Colors.black)),
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
                                    )
                                  ]),
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
                        padding: const EdgeInsets.only(top: 46),
                        child: Container(
                            width: 325,
                            height: 50,
                            child: const Padding(
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
                    Padding(
                      padding: const EdgeInsets.only(top: 23),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              'Already have an account ?  ',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                fontFamily: "segoe",
                                color: Color.fromARGB(144, 140, 184, 201),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login_screen()));
                            },
                            child: const Text(
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
      return;
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Profile_screen()));
    }
    _formKey.currentState?.save();
  }
}
