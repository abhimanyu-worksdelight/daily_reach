import 'package:flutter/material.dart';
class PostDetail extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return _PostDetail();
  }

}
class _PostDetail extends   State<StatefulWidget>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:(Image.asset("assets/images/daily2.png",width:375 ,height:319 ,)
        
        )
      ),

    );
  }
  
}