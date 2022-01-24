import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginScreen();
  }
}

class _LoginScreen extends State<StatefulWidget> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Container(
                margin: const EdgeInsets.only(right: 16.0),
                child: SizedBox(
                  height: 100,
                  child: Image.asset(
                    "assets/images/Ellipse.png",
                  ),
                ),
              ),

              // Row(mainAxisAlignment: MainAxisAlignment.end,
              //    children:[ Expanded(
              //       child: Image.asset(
              //           "assets/images/Vector.png", width: 90, height: 54
              //       ),
              //     ),
              //     ]
              // ),
              Image.asset("assets/images/Vector.png", width: 90, height: 54),
            ]),
            Column(//mainAxisAlignment:MainAxisAlignment.center,
                crossAxisAlignment:CrossAxisAlignment.start,children: [

      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(
              'assets/images/daily.png',
              height: 42,
              width: 190,
            ),
      ]),
      const Padding(padding: EdgeInsets.only(left: 20),
            child: (Text("Login Your Account",textAlign:TextAlign.start,
                style: TextStyle(color: Colors.black87, fontSize: 22))),
      ),
      Text("Login to daily reach to access more posts and access many more",
              textAlign: TextAlign.start,
              style: TextStyle(color: Colors.black87, fontSize: 13)),
      Padding(
              padding: EdgeInsets.all(20),
              child: TextFormField(
                  style: TextStyle(fontSize: 13),
                  // controller: emailController,
                  decoration: const InputDecoration(
                    // border: OutlineInputBorder(),
                    labelText: "Email Adress",
                    // fillColor: Color.fromARGB(255, 243, 243, 245),
                    //filled: true,
                  ))),
      Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: TextFormField(
                style: TextStyle(fontSize: 13),
                //controller: passwordController,
                obscureText: _isObscure,
                decoration: InputDecoration(
                    //border: const OutlineInputBorder(),
                    labelText: "Password",
                    // fillColor: const Color.fromARGB(255, 243, 243, 245),
                    //filled: true,
                    suffixIcon: IconButton(
                      icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    )),
              ),
            ),
      ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20,30, 20, 20),
                child:
                /* GestureDetector(onTap: () {
                SharedPref.setEmail(emailController.text);
                SharedPref.setPassword(passwordController.text);
              // },*/
              //   GestureDetector(
              //     // When the child is tapped, show a snackbar.
              //     onTap: () {
              //       if(CommonMethod.validateEmail(emailController.text)==false) {
              //
              //         ScaffoldMessenger.of(context).showSnackBar(
              //             const SnackBar(content: Text('Email Required')));
              //       } else if(CommonMethod.validatePassword(passwordController.text)==false) {
              //         ScaffoldMessenger.of(context).showSnackBar(
              //             const SnackBar(content: Text('Password Required')));
              //       }else {
              //         if(_isChecked){
              //           SharedPref.setEmail(emailController.text);
              //           SharedPref.setPassword(passwordController.text);
              //           SharedPref.saveBoxValue(_isChecked);
              //         }
              //         else{
              //           SharedPref.setEmail("");
              //           SharedPref.setPassword("");
              //           SharedPref.setBoxValue(_isChecked);
              //         }
              //         Navigator.push(
              //           context,
              //           MaterialPageRoute(builder: (context) =>  FirstPage()),
              //         );
              //       }
              //     },
                //  child:
                Container(
                  alignment: Alignment.center,
                    height: 52,
                    width: MediaQuery.of(context).size.width,
                    child: const Text(
                      "Login",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize:16, color: Colors.white),
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                     color: Color.fromARGB(233, 182, 3, 3),
                    borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 2.0,
                          blurRadius: 2.0,
                          offset: Offset.fromDirection(1.0, ),
                        ),
                      ],
                    ),
                  ),

                ),

              Center(
                child: RichText(
                  text: const TextSpan(
                    text: 'Forgot your  ',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                    ),
                  ), ),
              ),

            //  ),
    ]),
          ],
        ));
  }
}
