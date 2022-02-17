import 'dart:async';

import 'package:flash/flash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class FlashHelper {
  static Completer<BuildContext> _buildCompleter = Completer<BuildContext>();

  static void init(BuildContext context) {
    if (_buildCompleter.isCompleted == false) {
      _buildCompleter.complete(context);
    }
  }

  static void dispose() {
    if (_buildCompleter.isCompleted == false) {
      _buildCompleter.completeError(FlutterError('disposed'));
    }
    _buildCompleter = Completer<BuildContext>();
  }

 Future<void> toast({String? message,FlashBehavior style = FlashBehavior.floating}) async {
    var context = await _buildCompleter.future;
    showFlash(
      context: context,
      duration: const Duration(seconds: 2),
      persistent: false,
      builder: (_, controller) {
        return Flash.dialog(
          controller: controller,
        
          brightness: Brightness.light,
          boxShadows: [BoxShadow(blurRadius: 4)],
          barrierBlur: 3.0,
          barrierColor: Colors.black38,
          barrierDismissible: true,
        
          alignment: const Alignment(0, 0.5),
          margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
         
          backgroundColor: Colors.black87,
         child: DefaultTextStyle(
            style: const TextStyle(fontSize: 16.0, color: Colors.white),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(message!),
            ),
          ),
        );
      },
    );
  }


 Future<void> successBar(  BuildContext context, {
    String? title,
    @required String? message,
    Duration duration = const Duration(seconds: 3)}) async {
    var context = await _buildCompleter.future;
    showFlash(
      context: context,
      duration: duration,
      persistent: false,
      builder: (_, controller) {
        return Flash(
          controller: controller,
        
          brightness: Brightness.light,
          boxShadows: [BoxShadow(blurRadius: 4)],
          barrierBlur: 3.0,
          barrierColor: Colors.black38,
          barrierDismissible: true,
          horizontalDismissDirection: HorizontalDismissDirection.horizontal,
          alignment: const Alignment(0, 0.5),
          margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
         
          backgroundColor: Colors.black87,
         child:  FlashBar(
            content:  Text(title!, style: _titleStyle(context, Colors.white)),
         
            icon: Icon(Icons.check_circle, color: Colors.green[300]),
           
          ),
        );
      },
    );
  }
  static Color _backgroundColor(BuildContext context) {
    var theme = Theme.of(context);
    return theme.dialogTheme.backgroundColor ?? theme.dialogBackgroundColor;
  }

  static TextStyle _titleStyle(BuildContext context, [Color? color]) {
    var theme = Theme.of(context);
    return (theme.dialogTheme.titleTextStyle ?? theme.textTheme.headline1)!
        .copyWith(color: color);
  }

  static TextStyle _contentStyle(BuildContext context, [Color? color]) {
    var theme = Theme.of(context);
    return (theme.dialogTheme.contentTextStyle ?? theme.textTheme.bodyText1)!
        .copyWith(color: color);
  }


 Future<void> informationBar( 
   BuildContext context, {
    String? title,
    @required String? message,
    Duration duration = const Duration(seconds: 3)}) async {
    var context = await _buildCompleter.future;
    showFlash(
      context: context,
      duration: duration,
      persistent: false,
      builder: (_, controller) {
        return Flash(
          controller: controller,
        
          brightness: Brightness.light,
          boxShadows: [BoxShadow(blurRadius: 4)],
          barrierBlur: 3.0,
          barrierColor: Colors.black38,
          barrierDismissible: true,
          horizontalDismissDirection: HorizontalDismissDirection.horizontal,
          alignment: const Alignment(0, 0.5),
          margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
         
          backgroundColor: Colors.black87,
         child:  FlashBar(
            content:  Text(title!, style: _titleStyle(context, Colors.white)),
         
            icon: Icon(Icons.check_circle, color: Colors.green[300]),
           
          ),
        );
      },
    );
  }



 Future<void> errorBar( 
   BuildContext context, {
    String? title,
    @required String? message,
    Duration duration = const Duration(seconds: 3)}) async {
    var context = await _buildCompleter.future;
    showFlash(
      context: context,
      duration: duration,
      persistent: false,
      builder: (_, controller) {
        return Flash(
          controller: controller,
        
          brightness: Brightness.light,
          boxShadows: [BoxShadow(blurRadius: 4)],
          barrierBlur: 3.0,
          barrierColor: Colors.black38,
          barrierDismissible: true,
          horizontalDismissDirection: HorizontalDismissDirection.horizontal,
          alignment: const Alignment(0, 0.5),
          margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
         
          backgroundColor: Colors.black87,
         child:  FlashBar(
            content:  Text(title!, style: _titleStyle(context, Colors.white)),
         
            icon: Icon(Icons.check_circle, color: Colors.red[300]),
           
          ),
        );
      },
    );
  }




  static Future<void> singleFlash(BuildContext context, String message) async {
     showFlash(
      context: context,
      duration: Duration(seconds: 2),
      builder: (context, controller) {
        return Flash(
          controller: controller,
        
          brightness: Brightness.light,
          barrierBlur: 3.0,
          margin: const EdgeInsets.all(8.0),
          barrierDismissible: true,
          boxShadows: [
            BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 6.0)
          ],
          borderRadius: BorderRadius.circular(8.0),
          borderColor: Colors.blue,
          horizontalDismissDirection: HorizontalDismissDirection.horizontal,
          backgroundColor: Colors.white,
          forwardAnimationCurve: Curves.elasticIn,
          reverseAnimationCurve: Curves.elasticOut,
          child: FlashBar(
            content: Text(
              message,
              style: TextStyle(color: Colors.black),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            padding: const EdgeInsets.all(12.0), 
          ),
        );
      },
    );
  }
}

typedef ActionCallback = void Function(FlashController controller);
