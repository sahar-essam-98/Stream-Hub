// import 'dart:ui';
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';
//
// ///首页tab推荐
// class HomeTabRecommendPage extends StatefulWidget {
//   double contentHeight;
//   PageController pageController;
//   HomeTabRecommendPage({required this.contentHeight,required this.pageController}) ;
//
//   @override
//   _HomeTabRecommendPageState createState() {
//     return _HomeTabRecommendPageState();
//   }
// }
//
// class _HomeTabRecommendPageState extends State<HomeTabRecommendPage> {
//   late RecommendPageController _controller = Get.put(RecommendPageController());
//   late MainPageScrollController _mainController = Get.find();
//   PageController _pageController = PageController(keepPage: true);
//   late FeedController _feedController = Get.put(FeedController());
//   RefreshController _refreshController = RefreshController(initialRefresh: false);
//   @override
//   void initState() {
//     super.initState();
//     _feedController.refreshHotFeedList(_refreshController);
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     _pageController.dispose();
//     _refreshController.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return  SmartRefresher(
//       controller: _refreshController,
//       onRefresh: (){_feedController.refreshHotFeedList(_refreshController);},
//       onLoading: (){_feedController.getHotFeedList(_refreshController);},
//       child: _getVideoList(context),
//     );
//   }
//
//
//   _getVideoList(BuildContext context) {
//     return Obx((){
//       List<FeedListList> videoList = _feedController.hotFeedList;
//       if(null == videoList || videoList.length == 0){
//         return Container(color: Colors.grey,);
//       }else{
//         return PageView.builder(
//           controller: _pageController,
//           itemCount: videoList.length,
//           scrollDirection: Axis.vertical,
//           itemBuilder: (context, index) {
//             return VideoWidget(
//               video:videoList[index] ,
//               showFocusButton: true,
//               contentHeight: widget.contentHeight,
//               onClickHeader: (){
//                 widget.pageController.nextPage(duration: Duration(milliseconds: 200), curve: Curves.linear);
//               },
//             );
//           },
//           onPageChanged: (index){
//             _mainController.setCurrentUserOfVideo(videoList[index].user);
//           },
//         );
//       }
//
//     });
//   }
// }
