import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stream_hub/api/controllers.dart';
import 'package:stream_hub/widgets/constants.dart';

class EmailSignUp extends StatefulWidget {
  const EmailSignUp({Key? key}) : super(key: key);

  @override
  _EmailSignUpState createState() => _EmailSignUpState();
}

class _EmailSignUpState extends State<EmailSignUp> {

  late TextEditingController _nameTextEditingController;
  late TextEditingController _emailTextEditingController;
  late TextEditingController _passwordTextEditingController;
  late TextEditingController _confirmPasswordTextEditingController;

  var data;
  var isloading = false;

  @override
  void initState() {
    super.initState();
    _nameTextEditingController = TextEditingController();
    _emailTextEditingController = TextEditingController();
    _passwordTextEditingController = TextEditingController();
    _confirmPasswordTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _nameTextEditingController.dispose();
    _emailTextEditingController.dispose();
    _passwordTextEditingController.dispose();
    _confirmPasswordTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color2,
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              'assets/stack.png',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Container(
              margin: EdgeInsets.only(top: 50.h, left: 19),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.keyboard_backspace,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 110.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(14.r),
                  topLeft: Radius.circular(14.r),
                ),
              ),
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 24.h, left: 16.w),
                    child: Text(
                      'SignUp',
                      style: TextStyle(
                        color: color2,
                        fontFamily: 'poppins',
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 24.h, left: 16.w, right: 122.w),
                    child: Text(
                      'Enter your email address and we will send you a confirm code',
                      style: TextStyle(
                        color: color1,
                        fontFamily: 'poppins',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 24.h, left: 16.w,  bottom: 10.h),
                    child: Text(
                      'Full Name',
                      style: TextStyle(
                        color: color2,
                        fontFamily: 'poppins',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16.w, right: 16.w),
                    child: TextField(
                      controller: _nameTextEditingController ,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        hintStyle: TextStyle(fontFamily: 'Poppins'),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: color1,
                          ),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: color1,
                          ),
                          borderRadius: BorderRadius.circular(10.r),
                        ),

                        // focusedBorder: border(borderColor: Colors.white)
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.h, left: 16.w,  bottom: 10.h),
                    child: Text(
                      'Email Address',
                      style: TextStyle(
                        color: color2,
                        fontFamily: 'poppins',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16.w, right: 16.w),
                    child: TextField(
                      controller: _emailTextEditingController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        hintStyle: TextStyle(fontFamily: 'Poppins'),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: color1,
                          ),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: color1,
                          ),
                          borderRadius: BorderRadius.circular(10.r),
                        ),

                        // focusedBorder: border(borderColor: Colors.white)
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.h, left: 16.w),
                    child: Text(
                      'Password',
                      style: TextStyle(
                        color: color2,
                        fontFamily: 'poppins',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16.w, right: 16.w),
                    child: TextField(
                      controller: _passwordTextEditingController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        hintStyle: TextStyle(fontFamily: 'Poppins'),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: color1,
                          ),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: color1,
                          ),
                          borderRadius: BorderRadius.circular(10.r),
                        ),

                        // focusedBorder: border(borderColor: Colors.white)
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.h, left: 16.w),
                    child: Text(
                      'Confirm Password',
                      style: TextStyle(
                        color: color2,
                        fontFamily: 'poppins',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16.w, right: 16.w, top: 10.h),
                    child: TextField(
                      controller: _confirmPasswordTextEditingController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 0),
                        hintStyle: TextStyle(fontFamily: 'Poppins'),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: color1,
                          ),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: color1,
                          ),
                          borderRadius: BorderRadius.circular(10.r),
                        ),

                        // focusedBorder: border(borderColor: Colors.white)
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                    width: 343.w,
                    height: 48.h,
                    child: ElevatedButton(
                      style: TextButton.styleFrom(
                        minimumSize: Size(0, 126.h),
                        backgroundColor:const  Color(0xff242424),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0.r),
                        ),
                      ),

                      onPressed: () {
                        setState(() {
                          isloading = true;
                        });
                        var name = _nameTextEditingController.text;
                        var email = _nameTextEditingController.text;
                        var password = _nameTextEditingController.text;
                        var confirm = _nameTextEditingController.text;
                        Controller().Register(name: name,email: email,password: password,confirmPassword: confirm,mobile: "").then((value) {
                          setState(() {
                            isloading = false;
                          });
                          Navigator.pushReplacementNamed(context, '/congrats_screen');
                        });
                      },

                      child: Text(
                        'Sign up',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'poppins',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Future<void> performRegister() async {
  //   if (checkData()) {
  //     await register();
  //   }
  // }
  //
  // bool checkData() {
  //   if (_passwordTextEditingController.text.isNotEmpty &&
  //       _nameTextEditingController.text.isNotEmpty &&
  //       _passwordTextEditingController.text.isNotEmpty
  //       ) {
  //     return true;
  //   }
  //   showSnackBar(
  //     context,
  //     message: 'Enter required data!',
  //     error: true,
  //   );
  //   return false;
  // }
  //
  // Future<void> register() async {
  //   bool status = await AuthApiController().register(context, user: user);
  //
  //   // if (status) {
  //   //   Navigator.push(
  //   //     context,
  //   //     MaterialPageRoute(
  //   //       builder: (context) =>
  //   //           VerifyCode(phone: _phoneTextEditingController.text),
  //   //     ),
  //   //   );
  //   // }
  // }
  //
  // RegisterUser get user {
  //   RegisterUser user = RegisterUser();
  //   user.name = _nameTextEditingController.text;
  //   user.password = _passwordTextEditingController.text;
  //   user.mobile = _emailTextEditingController.text;
  //
  //   return user;
  // }
}
