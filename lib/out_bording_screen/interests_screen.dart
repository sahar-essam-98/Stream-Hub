import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stream_hub/Modules/cat.dart';
import 'package:stream_hub/api/controllers.dart';
import 'package:stream_hub/widgets/constants.dart';

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({Key? key}) : super(key: key);

  @override
  _InterestsScreenState createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  late final List<Cat> _tags = [];
  // = <String>[
  //   'Comedy',
  //   'Dance',
  //   'Learning',
  //   'Life style',
  //   'Food',
  //   'Sports',
  //   'Entertainment',
  //   'Fitness & Health',
  //   'Makeup'
  // ];

  var data;

  bool isloading = false;

  // final GeneralDataController _controller = Get.put<GeneralDataController>(GeneralDataController());

  getCat() async {
    setState(() {
      isloading = true;
    });
    try {
      Controller().getCategories().then((value) => {
            setState(() {
              isloading = false;
            }),
            if (value != null)
              {
                setState(() {
                  // data = value['data'];

                  value.forEach((v) {
                    _tags.add(Cat.fromJson(v));
                  });
                }),
                // print("the data is ${data}"),
                print("the data here is ${_tags[0].name}")
              }
            else
              {}
          });
    } catch (e) {
      print(e);
      setState(() {
        isloading = false;
      });
    }
  }

  @override
  void initState() {
    getCat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: isloading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: Column(
                children: [
                  Container(
                    margin:
                        EdgeInsets.only(left: 16.w, top: 46.3.h, bottom: 2.h),
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
                          'interests',
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
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text(
                      'Choose the type of videos you want to watch',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'poppins',
                        color: color1,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 36.h, left: 16.w, right: 16.w),
                    // padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Wrap(
                      spacing: 10,
                      runSpacing: 0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      runAlignment: WrapAlignment.center,
                      children: _tags
                          .map(
                            (tag) => Chip(
                              backgroundColor: Colors.white,
                              elevation: 4,
                              label: Text(tag.name!),
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: color1,
                                  fontSize: 12.sp,
                                  fontFamily: 'poppins'),

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              // onDeleted: () => deleteTag(targetTag: tag),
                            ),
                          )
                          .toList(),
                    ),
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
                        Navigator.pushReplacementNamed(
                            context, '/gender_screen');
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
