import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget getIcon(icon, size, count,{color = Colors.white}) {
  return Column(
    children: [
      Icon(
        icon,
        color: color,
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