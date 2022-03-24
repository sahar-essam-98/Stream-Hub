import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stream_hub/api/controllers.dart';
import 'package:stream_hub/widgets/constants.dart';
import 'package:stream_hub/widgets/get_album_widget.dart';
import 'package:stream_hub/widgets/get_icon_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late var data;

  bool isloading = false;

  late ScrollController _controller;

  getPost() async {
    setState(() {
      isloading = true;
    });
    try {
      Controller().getPost().then((value) => {
            setState(() {
              isloading = false;
            }),
            if (value != null)
              {
                setState(() {
                  data = value['data'];

                  // value.forEach((v) {
                  //   _tags.add(Cat.fromJson(v));
                  // });
                }),
                print("the data is ${value['data']}"),
                // print("the data here is ${_tags[0].name}")
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
    _controller = ScrollController();
    _tabController = TabController(length: 2, vsync: this);
    getPost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return isloading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Stack(
              children: [
                Container(
                  width: size.width,
                  height: size.height,
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                ),
                Container(
                  width: size.width,
                  height: size.height,
                  child: SafeArea(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 25.h, right: 15.w, left: 15.w, bottom: 10.h),
                      child: Column(
                          children: [
                            HeaderHomePage(),
                            Expanded(
                              flex: 1,
                              child: ListView.builder(
                                itemCount: data.length,
                                  itemBuilder: (context, index) {

                                return Row(
                                  children: [
                                    LeftPanel(
                                      size: size,
                                      name: data[index]['title'],
                                      caption: data[index]['description'],
                                      songName: '',
                                    ),
                                    // Right panel
                                    Container(
                                      height: size.height,
                                      // decoration: BoxDecoration(
                                      //   color: Colors.blue,
                                      // ),
                                      child: Column(
                                        // crossAxisAlignment: CrossAxisAlignment.stretch,
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: size.height * 0.3,
                                          ),
                                          Expanded(
                                            child: Container(
                                              child: Column(
                                                // crossAxisAlignment: CrossAxisAlignment.stretch,
                                                // mainAxisSize: MainAxisSize.max,
                                                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  getProfile(
                                                      'https://imagej.net/images/baboon.jpg'),
                                                  InkWell(
                                                    onTap:(){
                                                      setState(() {
                                                        isloading=true;
                                                      });
                                                      Controller().addLike(post_id: data[index]['id'],description: data[index]['description']).then((value) {
                                                        setState(() {
                                                          isloading = false;
                                                        });
                                                      });
                                                    },
                                                    child: getIcon(Icons.favorite, 35.0,
                                                        '${data[index]['favorites_count']}',color: data[index]['is_favorite']?Colors.red:Colors.white),
                                                  ),
                                                  getIcon(
                                                      Icons.chat, 35.0, '${data[index]['comments_count']}'),
                                                  getIcon(Icons.ios_share, 35.0,
                                                      '78K'),
                                                  getAlbum(
                                                      'https://imagej.net/images/baboon.jpg'),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              }),
                            )
                          ],
                        )
                      )
                    ),
                  ),
              ],
            ));
  }

  Widget getProfile(profileImg) {
    return Container(
      width: 55.w,
      height: 55.h,
      child: Stack(
        children: [
          Container(
            height: 50.h,
            width: 50.w,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(profileImg), fit: BoxFit.cover),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 18.w,
            child: Container(
              width: 20.w,
              height: 20.h,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
              child: Center(
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LeftPanel extends StatelessWidget {
  final String name;
  final String caption;
  final String songName;

  const LeftPanel(
      {Key? key,
      required this.size,
      required this.name,
      required this.caption,
      required this.songName})
      : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.w),
      height: size.height,
      width: size.width * 0.78,
      decoration: BoxDecoration(
        color: color1,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            name,
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            caption,
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Icon(
                Icons.music_note,
                color: Colors.white,
                size: 15,
              ),
              Text(songName)
            ],
          )
        ],
      ),
    );
  }
}

class HeaderHomePage extends StatelessWidget {
  const HeaderHomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'For You',
          style: TextStyle(
              color: Colors.white.withOpacity(0.5),
              fontWeight: FontWeight.bold,
              fontSize: 16.sp),
        ),
        SizedBox(
          width: 5.w,
        ),
        Text(
          '|',
          style:
              TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 16.sp),
        ),
        SizedBox(
          width: 5.w,
        ),
        Text(
          'Trending',
          style:
              TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 16.sp),
        ),
      ],
    );
  }
}
