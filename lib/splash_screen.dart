import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_minimizer/flutter_app_minimizer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stream_hub/widgets/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      // String route = SharedPrefController().loggedIn ? '/OnBoarding': '/Sign_in';
      Navigator.pushReplacementNamed(context, '/interests_screen');
      showAlertDialog(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color2,
      body: Stack(children: [
        Image.asset(
          'assets/stack.png',
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Center(
          child: Image.asset('assets/logo.PNG'),
        ),
      ]),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),),
      onPressed: () {
        if (Platform.isAndroid) {
          SystemNavigator.pop();
        } else if (Platform.isIOS) {
          FlutterAppMinimizer.minimize();
        }
      },
    );
    Widget continueButton = TextButton(
      child: Text(
        "Continue",
        style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
      ),
        onPressed: () => Navigator.of(context).pop()

    );


    // set up the AlertDialog
    AlertDialog alert = AlertDialog(

      backgroundColor: Color(0xffF2F2F2),
      content: Text(
        'By tapping " Agree and continue " , '
        'you agree to our Terms of Service and acknowledge that you have read our Privacy Policy to learn how we collect , use , and share your data . ',
        style: TextStyle(
          fontSize: 14.sp,
          fontFamily: 'poppins',
          fontWeight: FontWeight.w400,
        ),
      ),
      actions: [
        cancelButton,
        continueButton,

      ],
    );

    // show the dialog
    showDialog(

      // barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
