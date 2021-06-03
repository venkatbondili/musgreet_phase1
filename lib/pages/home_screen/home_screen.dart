//import 'dart:html';
import 'dart:ui';

import 'package:amplify_flutter/amplify.dart';
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
import 'package:mus_greet/models/ModelProvider.dart';
import 'package:mus_greet/pages/home_screen/comment_screen/comment_screen.dart';

import '../../models/ModelProvider.dart';

///This call is the home screen, where all post will displayed
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _navigateToComment = false;
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  List<Users> Userss;
  List<Posts> Postss;
  List<Users> UserObjectList = [];
  Users UserObject;
  @override
  Widget build(BuildContext context) {
    print("Hello");
    queryPosts();
    //listUsers();
    //print(Postss.length);
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
        //_navigateToComment
            //? CommentScreen(PostID: Postss[0].id, UserName: User[0].first_name, Post:Postss[0].post,)
            //? CommentScreen(PostID: Postss[0].id, UserName: "Sindhu", Post:"Hello",Post_image_path: "hii",)
            //:
      ListView.separated(
              //physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index){
              print(index);
                //UserObject = _getUserName(Postss[index].usersID) as Users;
                print(Postss[index].usersID);
                _getUserName(Postss[index].usersID);
              return PostCardWidget(
                profileImage: ImageConstants.IC_HOME_USER1,
                //name: AppTexts.TEMP_NAME1,
                //name: Postss[index].usersID,
                //name: UserObject.first_name,
                name: UserObjectList[0].first_name,
                isSponsored: false,
                //timeAgo: AppTexts.TEMP_TIME_AGO_1,
                timeAgo: Postss[index].id,
                //image: ImageConstants.IMG_POST1,
                post:Postss[index].post,
                image: Postss[index].post_image_path,
                //callBack: () => _loadCommentScreen(),
                //callBack: () => _loadCommentScreen(Postss[index].id, User[0], Postss[index].post, Postss[index].post_image_path),
                callBack: () => _loadCommentScreen(Postss[index], UserObjectList[0]),

              );
            },
            separatorBuilder: (context, index) {
            return Divider(
                height: 1,
                color: Colors.transparent,
            );
            },
            itemCount: Postss.length,

            ),

        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Column(
            children:[
              Container(
                child: Image.asset(
                ImageConstants.TEMP_IMG_ADD,
                fit: BoxFit.fitWidth,
              ),
              ),
          ],

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

  _loadCommentScreen(Posts PostObject, Users UserObject) {
    //Navigation.intent(context, CommentScreen(PostID: PostID,UserName: UserName, Post: Post, Post_image_path: Post_Image_path));
    Navigator.push(context,
        MaterialPageRoute(
            builder: (context) => CommentScreen(PostObject: PostObject, UserObject: UserObject),
        )
    );
    //CommentScreen(PostID: PostID,UserName: UserName, Post: Post, Post_image_path: Post_Image_path,);
    //print("Hello inside load comment screen");
   // print(PostID+ UserName+ Post+ Post_Image_path );
    setState(() {
      _navigateToComment = true;
    });
  }

  Future<void> listUsers() async {
    try {
      //List<Users>
      Userss = await Amplify.DataStore.query(Users.classType);
      //print(Userss);
      //print(Userss[0]);
      //print(Userss[0].first_name);
      //print(Userss.first);
      //print(Userss.length);
      //print(Userss[0].first_name);
      await Future.delayed(Duration(seconds: 1));
    } catch (e) {
      print("Could not query DataStore: " + e);
    }
  }

  Future<void> queryPosts() async {
    try {
      //List<Posts>
      Postss = await Amplify.DataStore.query(Posts.classType);
      //print(Postss.length);
      await Future.delayed(Duration(seconds: 2));
    } catch (e) {
      print("Could not query DataStore: " + e);
    }
  }

  Future<void> _getUserName(String usersID) async {
    print("User");
    print(usersID);
    UserObjectList = await Amplify.DataStore.query(Users.classType ,where :Users.ID.eq(usersID));
    //print(User[0].first_name);
    print(UserObjectList.length);
    print(UserObjectList[0].first_name);
    await Future.delayed(Duration(seconds: 1));
    //return UserObjectList[0];
  }

}
