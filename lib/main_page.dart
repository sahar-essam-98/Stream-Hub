import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stream_hub/screens/chat_screen.dart';
import 'package:stream_hub/screens/dicover_screen.dart';
import 'package:stream_hub/screens/home_page.dart';
import 'package:stream_hub/screens/home_screen.dart';
import 'package:stream_hub/screens/live_screen.dart';
import 'package:stream_hub/screens/profile_screen.dart';
import 'package:video_player/video_player.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List bottomItems = [
    {
      'icon': Icons.home_filled,
      // 'icon':Image.asset('assets/home.png'),
      'label': 'Home',
      'isIcon': true,
    },
    {
      'icon': Icons.home_filled,
      'label': 'Discover',
      'isIcon': true,
    },
    {
      'icon': Icons.home_filled,
      'label': '',
      'isIcon': true,
    },
    {
      'icon': Icons.home_filled,
      'label': 'Chat',
      'isIcon': true,
    },
    {
      'icon': Icons.home_filled,
      'label': 'Me',
      'isIcon': true,
    }
  ];
  VideoPlayerController _controller = VideoPlayerController.network('https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4');

  // int index = 0;
  // final _screens = [
  //   HomeScreen(),
  //   DiscoverScreen(),
  //   LiveScreen(),
  //   ChatScreen(),
  //   ProfileScreen(),
  // ];
  //
  // final _items = [
  //   Image.asset(
  //     'assets/home.png',
  //     width: 20.w,
  //     height: 20.h,
  //   ),
  //   Image.asset(
  //     'assets/search.png',
  //     width: 20.w,
  //     height: 20.h,
  //   ),
  //   Image.asset(
  //     'assets/live.png',
  //     width: 20.w,
  //     height: 20.h,
  //   ),
  //   Image.asset(
  //     'assets/chat.png',
  //     width: 20.w,
  //     height: 20.h,
  //   ),
  //   Image.asset(
  //     'assets/profile.png',
  //     width: 20.w,
  //     height: 20.h,
  //   ),
  // ];

  // @override
  // void initState() {
  //   _controller = VideoPlayerController.network('https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4');
  //   super.initState();
  // }
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: [
        HomePage(),
        Center(
          child: Text(
            'Discover',
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        Center(
          child: Text(
            'Live',
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        Center(
          child: Text(
            'Chat',
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        Center(
          child: Text(
            'Profile',
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      ],
    );
  }

  Widget getFooter() {
    var size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: 80.h,
      decoration: BoxDecoration(color: Colors.black),
      child: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(bottomItems.length, (index) {
            return bottomItems[index]['isIcon']
                ? InkWell(
                    onTap: () {
                      selectedIndex(index);
                    },
                    child: Column(
                      children: [
                        Icon(
                          bottomItems[index]['icon'],
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          bottomItems[index]['label'],
                          style: TextStyle(color: Colors.white, fontSize: 10.sp),
                        )
                      ],
                    ),
                  )
                : InkWell(
                    onTap: () {
                      selectedIndex(index);
                    },
                    child: Icon(Icons.upload_rounded),
                  );
          }),
        ),
      ),
    );
  }

  selectedIndex(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
