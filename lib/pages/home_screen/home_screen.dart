import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mus_greet/core/config/navigation.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/utils/routes.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';
import 'package:mus_greet/core/widgets/drawer_widget.dart';
import 'package:mus_greet/core/widgets/post_card_widget.dart';
import 'package:mus_greet/core/widgets/send_request_dialog_widget.dart';
import 'package:mus_greet/core/widgets/upload_image_bottom_sheet_widget.dart';
import 'package:mus_greet/pages/home_screen/comment_screen/comment_screen.dart';

///This call is the home screen, where all post will displayed
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _navigateToComment = false;
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(),
      child: Scaffold(
        key: _drawerKey,
        backgroundColor: AppColors.GREY_KIND,
        endDrawerEnableOpenDragGesture: false,
        appBar: _getAppBar(),
        drawer: DrawerWidget(),
        body: _getBody(),
      ),
    );
  }

  _onWillPop() {
    if (_navigateToComment == true) {
      setState(() {
        _navigateToComment = false;
      });
    } else {
      return Future.value(true);
    }
  }

  /// This will return Appbar in widget tree
  _getAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.white,
      leading: GestureDetector(
        onTap: (){
          _drawerKey.currentState.openDrawer();
        },
        child: Padding(
          padding: EdgeInsets.only(top: 18, bottom: 18, left: 20),
          child: AssetImageWidget(
            image: ImageConstants.IC_DRAWER,
            height: 18,
            width: 18,
          ),
        ),
      ),
      title: AssetImageWidget(
        image: ImageConstants.IC_LOGO_TITLE,
        height: 130,
        width: 130,
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 15),
          child: GestureDetector(
            onTap: () => _handleSearch(),
            child: AssetImageWidget(
              image: ImageConstants.IC_SEARCH,
              height: 24,
              width: 25,
            ),
          ),
        ),
        CustomSpacerWidget(width: 20,),
        Padding(
          padding: EdgeInsets.only(right: 20),
          child: GestureDetector(
            onTap: () => _handleSearch(),
            child: AssetImageWidget(
              image: ImageConstants.IC_NOTIFICATION,
              height: 25,
              width: 25,
            ),
          ),
        ),
      ],
    );
  }

  /// Body of the home screen
  _getBody() {
    return Stack(
      children: [
        _navigateToComment
            ? CommentScreen()
            : ListView(
                children: [
                  PostCardWidget(
                    profileImage: ImageConstants.IC_HOME_USER1,
                    name: AppTexts.TEMP_NAME1,
                    isSponsored: false,
                    timeAgo: AppTexts.TEMP_TIME_AGO_1,
                    image: ImageConstants.IMG_POST1,
                    callBack: () => _loadCommentScreen(),
                  ),
                  PostCardWidget(
                    profileImage: ImageConstants.IC_HOME_USER2,
                    name: AppTexts.TEMP_NAME2,
                    isSponsored: true,
                    timeAgo: AppTexts.TEMP_TIME_AGO_2,
                    image: ImageConstants.IMG_POST1,
                    callBack: () => _loadCommentScreen(),
                  ),
                  PostCardWidget(
                    profileImage: ImageConstants.IC_HOME_USER1,
                    name: AppTexts.TEMP_NAME1,
                    isSponsored: false,
                    timeAgo: AppTexts.TEMP_TIME_AGO_1,
                    image: ImageConstants.IMG_POST1,
                    callBack: () => _loadCommentScreen(),
                  ),
                  PostCardWidget(
                    profileImage: ImageConstants.IC_HOME_USER2,
                    name: AppTexts.TEMP_NAME2,
                    isSponsored: true,
                    timeAgo: AppTexts.TEMP_TIME_AGO_2,
                    image: ImageConstants.IMG_POST1,
                    callBack: () => _loadCommentScreen(),
                  ),
                  CustomSpacerWidget(
                    height: 50,
                  ),
                ],
              ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            child: Image.asset(
              ImageConstants.TEMP_IMG_ADD,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ],
    );
  }

///navigation to friends Search screen
  _handleSearch() {
    print("Handle friend Search!!");
    Navigation.intent(context, AppRoutes.FRIEND_SEARCH);
    //showDialog(context: context, builder: (context){
     // return SendRequestDialogWidget();
    //});

  }

  _loadCommentScreen() {
    setState(() {
      _navigateToComment = true;
    });
  }
}
