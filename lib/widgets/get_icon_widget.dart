import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget getIcon(icon, size, count) {
  return Column(
    children: [
      Icon(
        icon,
        color: Colors.white,
        size: size,
      ),
      SizedBox(
        height: 5.h,
      ),
      Text(
        count,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
      )
    ],
  );
}