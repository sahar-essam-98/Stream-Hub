import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget getAlbum(albumImage) {
  return Container(
    width: 55.w,
    height: 55.h,
    child: Stack(
      children: [
        Container(
          width: 55.w,
          height: 55.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black,
          ),
          child: Center(
            child: Container(
                width: 30.w,
                height: 30.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                      albumImage,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
          ),
          ),

      ],
    ),
  );
}
