import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stream_hub/congrats_screen.dart';
import 'package:stream_hub/get/general_controller.dart';
import 'package:stream_hub/helper/shared_prefrences_helper.dart';
import 'package:stream_hub/out_bording_screen/birth_date.dart';
import 'package:stream_hub/out_bording_screen/gender_screen.dart';
import 'package:stream_hub/out_bording_screen/go_watching.dart';
import 'package:stream_hub/out_bording_screen/interests_screen.dart';
import 'package:stream_hub/signup_method/email_login.dart';
import 'package:stream_hub/signup_method/email_signup.dart';
import 'package:stream_hub/signup_method/phone_signup.dart';
import 'package:stream_hub/signup_method/sign_up_method.dart';
import 'package:stream_hub/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPrefrencesHelper.sharedPrefrencesHelper.initSharedPrefrences();
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
   // MyApp({Key? key}) : super(key: key);

  final GeneralDataController _controller = Get.put<GeneralDataController>(GeneralDataController());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height),
      builder: () => MediaQuery(
        data: const MediaQueryData(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/splash_screen',
          routes: {
            '/splash_screen': (context) => SplashScreen(),
            '/interests_screen': (context) => const InterestsScreen(),
            '/gender_screen': (context) => const GenderScreen(),
            '/go_watching': (context) => const GoWatching(),
            '/signUp_method': (context) => const SignUpMethods(),
            '/email_signUp': (context) => const EmailSignUp(),
            '/phone_signUp': (context) => const PhoneSignUp(),
            '/congrats_screen': (context) => const CongratsScreen(),
            '/birth_date':(context)=> const birthDate(),
            '/Sign_in':(context)=> const EmailSignIn(),
          },
        ),
      ),
    );
  }
}
