import 'dart:ui';

import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';
import 'package:mus_greet/core/widgets/bottom_navigation_widget.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';
import 'package:mus_greet/core/widgets/rounded_button_widget.dart';
import 'package:mus_greet/core/widgets/s3_bucket_image_widget.dart';
import 'package:mus_greet/core/widgets/tab_style_widget.dart';
import 'package:mus_greet/core/widgets/upload_image_bottom_sheet_widget.dart';
import 'package:mus_greet/models/ModelProvider.dart';
import 'package:mus_greet/models/UserProfile.dart';
import 'package:mus_greet/pages/profile/view_profile_screen/about_tab/about_tab.dart';
import 'package:mus_greet/pages/profile/view_profile_screen/friend_tab/friend_tab.dart';
import 'package:mus_greet/pages/profile/view_profile_screen/interest_tab/interest_tab.dart';
import 'package:mus_greet/pages/profile/view_profile_screen/post_tab/post_tab.dart';

import '../../../core/utils/constants.dart';

///This will render the current user profile on screen
class ViewProfileScreen extends StatefulWidget {
  final Users sessionUser;
  ViewProfileScreen({this.sessionUser});
  @override
  _ViewProfileScreenState createState() => _ViewProfileScreenState();
}

class _ViewProfileScreenState extends State<ViewProfileScreen>
    with TickerProviderStateMixin {
  TabController _tabController;

  TextEditingController _controller = TextEditingController();
  bool _isInEditMode = true;
  //String UserID = "61b35418-9426-4652-9e59-a65ad173117c";
  String UserID ;
  List<UserProfile> userProfile = [];

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(_handleTabSelection);

    super.initState();
  }

  /// For changing the tab properly
  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    UserID = widget.sessionUser.id;
    return Scaffold(
      backgroundColor: AppColors.GREY_KIND,
      body: _getBody(UserID),
      bottomNavigationBar: _getBottomNavigation(),
    );
  }

  _getBody(String userID) {
    print("inside get body");
    print(userID);
    getDetails(userID);
    return SingleChildScrollView(
      child: Column(
        children: [
          _getUpperSection(),
          _getTabBar(),
          Center(
            child: [
              PostTab(sessionUser: widget.sessionUser,),
              AboutTab(sessionUser: widget.sessionUser),
              InterestTab(sessionUser: widget.sessionUser),
              FriendTab(sessionUser: widget.sessionUser),
            ][_tabController.index],
          ),
        ],
      ),
    );
  }

  /// This will render all the upper section of profile till before tab bars
  _getUpperSection() {
    return Container(
      color: AppColors.white,
      child: Column(
        children: [
          _getCoverAndProfileImage(),
          CustomSpacerWidget(
            height: 80,
          ),
          _getUserName(),
          CustomSpacerWidget(
            height: 10,
          ),
          _getLocation(),
          CustomSpacerWidget(
            height: 20,
          ),
          _getEditButton(),
          CustomSpacerWidget(
            height: 20,
          ),
        ],
      ),
    );
  }

  ///User profile Image and Cover image
  _getCoverAndProfileImage() {
    return Stack(
      overflow: Overflow.visible,
      children: [
        Container(
          height: 185,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            ImageConstants.IMG_COVER,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 100,
          child: _isInEditMode
              ? GestureDetector(
                  onTap: () => _uploadImage(),
                  child: _getUserProfile(),
                )
              // : AssetImageWidget(
              //     image: ImageConstants.IMG_PROFILE,
                :S3BucketImageWidget(
                  image: "https://musgreetphase1images184452-staging.s3.eu-west-2.amazonaws.com/public/public.png",
                  height: 180,
                  width: 180,
                ),
        ),
        Positioned(
          left: 20,
          top: 20,
          child: AssetImageWidget(
            image: ImageConstants.IC_BACK,
            height: 20,
            width: 20,
          ),
        ),
        _isInEditMode
            ? Positioned(
                right: 20,
                bottom: 20,
                child: _getCameraImageOnProfile(),
              )
            : Container(),
      ],
    );
  }

  _getUserProfile() {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
      ),
      height: 180,
      width: 180,
      child: Stack(
        children: [
          S3BucketImageWidget(
            image: "https://musgreetphase1images184452-staging.s3.eu-west-2.amazonaws.com/public/public.png",
            //image: ImageConstants.IMG_PROFILE,
            height: 180,
            width: 180,
          ),
          _isInEditMode
              ? Positioned(
                  right: 40,
                  bottom: 55,
                  child: _getCameraImageOnProfile(),
                )
              : Container(),
        ],
      ),
    );
  }

  _getCameraImageOnProfile() {
    return GestureDetector(
      onTap: () => _uploadImage(),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.green_light,
            width: 1.5,
          ),
        ),
        child: CircleAvatar(
          backgroundColor: AppColors.white,
          radius: 12,
          child: AssetImageWidget(
            image: ImageConstants.IC_CAM,
            height: 15,
            width: 15,
          ),
        ),
      ),
    );
  }

  _uploadImage() {
    showModalBottomSheet(
      elevation: 15,
      enableDrag: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: UploadImageBottomSheetWidget(),
        );
      },
    );
  }

  ///This will return name of the user
  _getUserName() {
    return Text(
      // AppTexts.TEMP_USER_NAME,
      widget.sessionUser.first_name + " " + widget.sessionUser.last_name,
      style: TextStyle(
          fontFamily: FontConstants.FONT,
          fontSize: 17,
          fontWeight: FontWeight.bold,
          color: AppColors.header_black),
    );
  }

  ///This will return location of the user
  _getLocation() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AssetImageWidget(
          image: ImageConstants.TEMP_LOCATION,
          height: 15,
          width: 15,
        ),
        CustomSpacerWidget(
          width: 4,
        ),
        Text(
          // AppTexts.TEMP_LOCATION,
          widget.sessionUser.city,
          style: TextStyle(
            fontFamily: FontConstants.FONT,
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: AppColors.black.withOpacity(0.6),
          ),
        )
      ],
    );
  }

  ///This will render edit button on screen
  _getEditButton() {
    return RoundedButtonWidget(
      text: _isInEditMode
          ? AppTexts.VIEW_PROFILE_TEXT
          : AppTexts.EDIT_PROFILE_TEXT,
      callBack: () {
        setState(() {
          _isInEditMode = !_isInEditMode;
        });
      },
    );
  }

  /// for Rendering the tab bar on screen
  _getTabBar() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.white.withOpacity(0.7),
            AppColors.white,
            AppColors.white,
            AppColors.white,
          ],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 15),
        child: TabBar(
          controller: _tabController,
          labelColor: AppColors.black,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(width: 2, color: AppColors.green),
            insets: EdgeInsets.symmetric(horizontal: 12),
          ),
          tabs: [
            TabStyleWidget(
              text: AppTexts.POST_TEXT,
            ),
            TabStyleWidget(
              text: AppTexts.ABOUT_TEXT,
            ),
            TabStyleWidget(
              text: AppTexts.INTEREST_TEXT,
            ),
            TabStyleWidget(
              text: AppTexts.FRIENDS_TEXT,
            ),
          ],
        ),
      ),
    );
  }

  getDetails(String userIDs) async {
    try {
      print("inside get details");
      print(userIDs);
      // userProfile = await Amplify.DataStore.query(UserProfile.classType,
      //     where: UserProfile.ID.eq(widget.sessionUser.id));
      userProfile = await Amplify.DataStore.query(UserProfile.classType,
          where: UserProfile.USERSID.eq(UserID));

      //userProfile = await Amplify.DataStore.query(UserProfile.classType);
      // for(var uP in userProfile){
      //   if(uP.usersID == userID){
      //     print(uP.usersID);
      //     print(true);
      //   }
      // }

      print(userProfile);
      print("In the main page");
    }catch(e)
    {

    }
  }

  _getBottomNavigation() {
    return BottomNavigationWidget(
      //MosqueFollowersList: UserMosqueFollowingList,
      //CallingFunction: _navigateback(),
      sessionUser: widget.sessionUser,
      CallingScreen: "ViewProfile",
      index: 4,
    );
  }
}
