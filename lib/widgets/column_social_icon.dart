import 'package:flutter/material.dart';
import 'package:stream_hub/widgets/constants.dart';

Widget getAlbum(albumImg) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          // shape: BoxShape.circle,
          // color: black
          ),
      child: Stack(
        children: <Widget>[
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black),
          ),
          Center(
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(
                          albumImg),
                      fit: BoxFit.cover)),
            ),
          )
        ],
      ),
    );
  }

  Widget getIcons(icon, count, size) {
    return Container(
      child: Column(
        children: <Widget>[
          Icon(icon, color: Colors.white, size: size),
          SizedBox(
            height: 5,
          ),
          Text(
            count,
            style: TextStyle(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }

  Widget getProfile(img) {
    return Container(
      width: 50,
      height: 60,
      child: Stack(
        children: <Widget>[
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(
                        img),
                    fit: BoxFit.cover)),
          ),
          Positioned(
              bottom: 3,
              left: 18,
              child: Container(
                width: 20,
                height: 20,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: color1),
                child: Center(
                    child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 15,
                )),
              ))
        ],
      ),
    );
  }