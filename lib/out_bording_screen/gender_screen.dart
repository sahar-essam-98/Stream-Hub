import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stream_hub/widgets/constants.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({Key? key}) : super(key: key);

  @override
  _GenderScreenState createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  bool _flag = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 16.w, top: 46.3.h, bottom: 2.h),
              child: Row(
                children: [
                  Text(
                    'Your ',
                    style: TextStyle(
                      color: color1,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 32.sp,
                    ),
                  ),
                  Text(
                    'gender',
                    style: TextStyle(
                      color: color2,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 32.sp,
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 64.h),
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                'Choose your gender identity to help us show you content thats right for you',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'poppins',
                  color: color1,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(10.w),
                  width: 135.w,
                  height: 135.h,
                  child: ElevatedButton(
                    style: TextButton.styleFrom(
                      minimumSize: Size(0, 135.h),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0.r),
                      ),
                    ),
                    onPressed: () {
                      // child: Icon(Icons.female,size: 55,color: Colors.red,);
                    },
                    child: Icon(
                      Icons.female,
                      size: 55,
                      color: color1,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10.w),
                  width: 135.w,
                  height: 135.h,
                  child: ElevatedButton(
                    style: TextButton.styleFrom(
                      minimumSize: Size(0, 135.h),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0.r),
                      ),
                    ),
                    onPressed: () {},
                    child: Icon(
                      Icons.male,
                      size: 55,
                      color: color1,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 177.h, bottom: 12.h),
              width: 343.w,
              height: 48.h,
              child: ElevatedButton(
                style: TextButton.styleFrom(
                  minimumSize: Size(0, 126.h),
                  backgroundColor: Color(0xff242424),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0.r),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/go_watching');
                  // Navigator.pushReplacementNamed(context, '/go_watching');
                },
                child: Text('Next'),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10.w),
              width: 343.w,
              height: 48.h,
              child: ElevatedButton(
                style: TextButton.styleFrom(
                  minimumSize: Size(0, 126.h),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0.r),
                  ),
                ),
                onPressed: () {
                  // Navigator.pushReplacementNamed(context, 'routeName');
                },
                child: Text(
                  'Skip',
                  style: TextStyle(color: color2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
