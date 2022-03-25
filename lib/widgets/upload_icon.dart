import 'package:flutter/material.dart';
import 'package:stream_hub/widgets/constants.dart';

class UploadIcon extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 35,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
                              child: Container(
              width: 40,
              height: 35,
              decoration: BoxDecoration(
                color: color1,
                 borderRadius: BorderRadius.circular(8)
              ),
            ),
          ),
          Positioned(
            right: 0,
                              child: Container(
              width: 40,
              height: 35,
              decoration: BoxDecoration(
                color: color1,
                 borderRadius: BorderRadius.circular(8)
              ),
            ),
          ),
          Positioned(
            right: 5,
                              child: Container(
              width: 40,
              height: 35,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8)
              ),
              child: Icon(Icons.add),
            ),
          )
        ],
      ),
    );
  }
}