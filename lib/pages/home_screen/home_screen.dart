//import 'dart:html';
import 'dart:async';
import 'dart:io';
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
import 'package:amplify_storage_s3/amplify_storage_s3.dart';

import '../../models/ModelProvider.dart';

///This call is the home screen, where all post will displayed
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _navigateToComment = false;
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  List<Users> Userss =[];
  List<Posts> Postss =[];
  List<Users> UserObjectList = [];
  Users UserObject;
  int   CommentsCount = 0;
  int  LikesCount = 0;

  @override
  Widget build(BuildContext context) {
    print("Hello welcome to home screen build");
    queryPosts();
    //sleep(const Duration(seconds: 5));
    //Timer(Duration(seconds: 3),(){print("inside timer");});
    print("after Timer");
    //listUsers();
    print(Postss.length);
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
              print("index"+index.toString());
                //UserObject = _getUserName(Postss[index].usersID) as Users;
                //print(Postss[index].usersID);
                _getUserName(Postss[index].usersID);
                _countComments(Postss[index].id);
                //print("Know the UserObject Type");
              //print(UserObject.runtimeType);
              print(UserObjectList);
              //print(getUserName(Postss[index].id).runtimeType);
              //UserObjectList[0] = getUserName(Postss[index].id) as Users;
                //print("Comments count before widget"+ CommentsCount.toString());

              return PostCardWidget(
                //profileImage: ImageConstants.IC_HOME_USER1,
                //profileImage: Image.network('https://picsum.photos/250?image=9'),
                profileImage: "https://musgreetphase1images184452-staging.s3.eu-west-2.amazonaws.com/public/public.png",
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
                //image: "https://musgreetphase1images184452-staging.s3.eu-west-2.amazonaws.com/public/image_picker5824495182282881133.jpg",
                //image: "https://musgreetphase1images184452-staging.s3.eu-west-2.amazonaws.com/public/post_img_2.png",
                //callBack: () => _loadCommentScreen(),
                //callBack: () => _loadCommentScreen(Postss[index].id, User[0], Postss[index].post, Postss[index].post_image_path),
                callBack: () => _loadCommentScreen(Postss[index], UserObjectList[0],CommentsCount.toString()),
                commentsCount:CommentsCount.toString(),

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

        //Image.network('https://musgreetphase1images184452-staging.s3.eu-west-2.amazonaws.com/public/public.png'),

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

  _loadCommentScreen(Posts PostObject, Users UserObject, String CommentsCount) {
    //Navigation.intent(context, CommentScreen(PostID: PostID,UserName: UserName, Post: Post, Post_image_path: Post_Image_path));
    print(CommentsCount);
    Navigator.push(context,
        MaterialPageRoute(
            builder: (context) => CommentScreen(PostObject: PostObject, UserObject: UserObject, CommentsCount: CommentsCount),
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


  _queryPosts() {
    try {
      //List<Posts>
      Postss = Amplify.DataStore.query(Posts.classType) as List<Posts>;
      //print(Postss.length);
      print("inside posts before delay");
      //await Future.delayed(Duration(seconds: 1));
      print("inside posts");
      //setState(() {
        //Postss = Postss;
      //});
    } catch (e) {
      print("Could not query DataStore: " + e);
    }
  }
  Future<void> queryPosts() async {
    try {
      //List<Posts>
      Postss = await Amplify.DataStore.query(Posts.classType);
      print(Postss.length);
      print(Postss[8]);
      print("inside posts before delay");
      await Future.delayed(Duration(milliseconds: 1000));
      print("inside posts");
      //updatePost();
      //deletePost();
      //setState(() {
        //Postss = Postss;
      //});
    } catch (e) {
      print("Could not query DataStore: " + e);
    }
  }

  Future<void> updatePost() async{
    try{
      final updatedItem = Postss[3].copyWith(
          post: "Hi Friends! This is a new post added from APP visible to Community",
          post_image_path: "https://musgreetphase1images184452-staging.s3.eu-west-2.amazonaws.com/public/post_img.png",
          description: "Keep Smiling",
          visibility: "Community",
          usersID: "ab9530cd-17d0-4aa3-850e-95e42cc037bb",
          mosquesID: "",
          Post_Comments: [],
          Post_Likes: []);
      await Amplify.DataStore.save(updatedItem);
    }catch (e) {
      print("Could not query DataStore: " + e);
    }
  }
  Future<void> deletePost() async{
    try{
    await Amplify.DataStore.delete(Postss[4]);
    print(Postss.length);
    }catch (e) {
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

  Future<void> _countComments(String PostID) async {
    print(CommentsCount);
    CommentsCount = 0;
    print(CommentsCount);
    try {
      List<PostComments> Comments = await Amplify.DataStore.query(PostComments.classType, where: PostComments.POSTSID.eq(PostID));
      print("Comments Length" + Comments.length.toString());
      if(Comments.isNotEmpty){
        for(var i in Comments){
          if(i.parent_id == ""){
            CommentsCount ++;
          }
        }
      }
      print("Comments Count" + CommentsCount.toString());
      await Future.delayed(Duration(seconds: 2));

    } catch (e) {
      print("Could not query DataStore: " + e);
    }
  }

  Future<void> _getLikesCount(String PostID) async {
    LikesCount = 0;
    try {
      List<PostLikes> PostLikess = await Amplify.DataStore.query(PostLikes.classType, where: PostComments.POSTSID.eq(PostID));
    } catch (e) {
      print("Could not query DataStore: " + e);
    }

  }

  Future<Users> getUserName(String usersID) async {
    try {
      //print("User");
      print(usersID + "inside getUserName");
      UserObjectList = await Amplify.DataStore.query(Users.classType ,where :Users.ID.eq(usersID));
      //print(User[0].first_name);
      print(UserObjectList.length);
      print(UserObjectList[0].first_name);
      await Future.delayed(Duration(seconds: 1));
      print(UserObjectList[0].runtimeType);
      return UserObjectList[0];
      //return UserObjectList[0];
    } catch (e) {
      print("Could not query DataStore: " + e);
    }

  }

}
