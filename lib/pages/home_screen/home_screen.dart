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
import 'package:mus_greet/core/widgets/bottom_navigation_widget.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';
import 'package:mus_greet/core/widgets/drawer_widget.dart';
import 'package:mus_greet/core/widgets/post_card_widget.dart';
import 'package:mus_greet/core/widgets/send_request_dialog_widget.dart';
import 'package:mus_greet/core/widgets/upload_image_bottom_sheet_widget.dart';
import 'package:mus_greet/models/ModelProvider.dart';
import 'package:mus_greet/pages/final/community_promise_page.dart';
import 'package:mus_greet/pages/friend_search/friend_search.dart';
import 'package:mus_greet/pages/home_screen/comment_screen/comment_screen.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';

import '../../models/ModelProvider.dart';

///This call is the home screen, where all post will displayed
class HomeScreen extends StatefulWidget {
  final Users sessionUser;
  HomeScreen({this.sessionUser});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //String LoginUserID = "61b35418-9426-4652-9e59-a65ad173117c";
  String LoginUserID;
  bool _navigateToComment = false;
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  List<Users> Userss =[];
  List<Posts> Postss =[];
  List<Users> UserObjectList = [];
  Users UserObject;
  //int   CommentsCount = 0;
  int  LikesCount = 0;

  CommunityPromiseArgumentClass args;
  Users sessionUser;



  @override

  /// Future builder to get list of posts
  Widget build(BuildContext context) {
    print("Hello welcome to home screen build");
    //queryPosts();
    args = ModalRoute.of(context).settings.arguments as CommunityPromiseArgumentClass;
    print("args");
    print(args);
    if(args == null){
      print("inside args is null");
      sessionUser = widget.sessionUser;
      print(sessionUser);
      print(sessionUser.first_name);
    }
   else{
      sessionUser = args.sessionUser;
      print(sessionUser);
    }
    //LoginUserID = sessionUser.id;
    print(sessionUser);
    print("after Timer");
    //print(Postss.length);
    return FutureBuilder<List<Posts>>(
      future: queryPosts(),
      builder: (ctx, snapshot) {
        //List<Posts> PostsData = snapshot.data;
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            Postss = snapshot.data;
            return _buildUI(Postss,sessionUser);
          default:
            return _buildLoadingScreen();
        }
      },
    );
  }

  /// to build UI after getting list of posts
  _buildUI(List<Posts> postss, Users sessionUser) {
    print("inside build UI");
    return WillPopScope(
      onWillPop: () => _onWillPop(),
      child: Scaffold(
        key: _drawerKey,
        backgroundColor: AppColors.GREY_KIND,
        endDrawerEnableOpenDragGesture: false,
        appBar: _getAppBar(),
        drawer: DrawerWidget(),
        body: _getBody(postss, sessionUser),
        bottomNavigationBar: _getBottomNavigation(),
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
  _getBody(List<Posts> posts, Users sessionUser) {
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
            if(posts.length == 0){
              return PostCardWidget(
                //profileImage: ImageConstants.IC_HOME_USER1,
                //profileImage: Image.network('https://picsum.photos/250?image=9'),
                //profileImage:// userData profile photo link need to be linked,
                profileImage: "https://musgreetphase1images184452-staging.s3.eu-west-2.amazonaws.com/public/home_user1.png",
                //name: AppTexts.TEMP_NAME1,
                //name: Postss[index].usersID,
                //name: UserObject.first_name,
                //name: UserObjectList[0].first_name,
                name: "MUsgreet",
                isSponsored: false,
                //timeAgo: AppTexts.TEMP_TIME_AGO_1,
                timeAgo:"",
                //image: ImageConstants.IMG_POST1,
                post: "Welcome to Musgreet Home!!! Create your Posts here",
                image: "https://musgreetphase1images184452-staging.s3.eu-west-2.amazonaws.com/public/post_img.png",
                //image: "https://musgreetphase1images184452-staging.s3.eu-west-2.amazonaws.com/public/image_picker5824495182282881133.jpg",
                //image: "https://musgreetphase1images184452-staging.s3.eu-west-2.amazonaws.com/public/post_img_2.png",
                //callBack: () => _loadCommentScreen(),
                //callBack: () => _loadCommentScreen(Postss[index].id, User[0], Postss[index].post, Postss[index].post_image_path),
                //callBack: () =>
                   // _loadCommentScreen(postData, UserData, CommentsCount.toString(), sessionUser),
                //commentsCount: CommentsCount.toString(),
              );
            }
            else{
              return getpostcardWidget(posts[index], index, sessionUser);
            }
          },
          separatorBuilder: (context, index) {
            return Divider(
              height: 1,
              color: Colors.transparent,
            );
          },
          itemCount: posts.length,
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

  /// Getting User details and calling comments count to build post card widget
  Widget getpostcardWidget(Posts postData, int index, Users sessionUser) {
    print(postData);
    return FutureBuilder<Users>(
      //future: _getUser(postData.usersID),
      future: _getUser(postData.usersID),
      builder: (ctx, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            Users UserData = snapshot.data;
            return commentsCountPostCardWidget(postData, UserData, index, sessionUser);
          default:
            return _buildLoadingScreen();
        }
      },
    );
  }

  /// Getting comments count and with all the details building post card widget
  commentsCountPostCardWidget(Posts postData, Users UserData, int index, Users sessionUser) {
    print(postData);
    print(UserData);
    return FutureBuilder<int>(
      future: _countComments(postData.id),
      builder: (ctx, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            int CommentsCount = snapshot.data;
            //return _getPostCardWidgetUI(postData,UserData,index,CommentsCount);
            return PostCardWidget(
              //profileImage: ImageConstants.IC_HOME_USER1,
              //profileImage: Image.network('https://picsum.photos/250?image=9'),
              //profileImage:// userData profile photo link need to be linked,
              profileImage: "https://musgreetphase1images184452-staging.s3.eu-west-2.amazonaws.com/public/home_user1.png",
              //name: AppTexts.TEMP_NAME1,
              //name: Postss[index].usersID,
              //name: UserObject.first_name,
              //name: UserObjectList[0].first_name,
              name: UserData.first_name + " " + UserData.last_name,
              isSponsored: false,
              //timeAgo: AppTexts.TEMP_TIME_AGO_1,
              timeAgo: UserData.postcode,
              //image: ImageConstants.IMG_POST1,
              post: postData.post,
              image: postData.post_image_path,
              //image: "https://musgreetphase1images184452-staging.s3.eu-west-2.amazonaws.com/public/image_picker5824495182282881133.jpg",
              //image: "https://musgreetphase1images184452-staging.s3.eu-west-2.amazonaws.com/public/post_img_2.png",
              //callBack: () => _loadCommentScreen(),
              //callBack: () => _loadCommentScreen(Postss[index].id, User[0], Postss[index].post, Postss[index].post_image_path),
              callBack: () =>
                  _loadCommentScreen(postData, UserData, CommentsCount.toString(), sessionUser),
              commentsCount: CommentsCount.toString(),
            );
          default:
            return _buildLoadingScreen();
        }
      },
    );
  }

  /// This method will navigate to Comment Screen
  _loadCommentScreen(Posts PostObject, Users UserObject, String CommentsCount, Users sessionUser) {
    //Navigation.intent(context, CommentScreen(PostID: PostID,UserName: UserName, Post: Post, Post_image_path: Post_Image_path));
    print(CommentsCount);
    Navigator.push(context,
        MaterialPageRoute(
          builder: (context) => CommentScreen(PostObject: PostObject, UserObject: UserObject, CommentsCount: CommentsCount,LogedInUser: sessionUser),
        )
    );
    //CommentScreen(PostID: PostID,UserName: UserName, Post: Post, Post_image_path: Post_Image_path,);
    //print("Hello inside load comment screen");
    // print(PostID+ UserName+ Post+ Post_Image_path );
    setState(() {
      _navigateToComment = true;
    });
  }

  ///navigation to friends Search screen
  _handleSearch() {
    print("Handle friend Search!!");
    //Navigation.intent(context, AppRoutes.FRIEND_SEARCH);
    Navigator.push(context,
        MaterialPageRoute(
          builder: (context) => FriendSearch(sessionUser:sessionUser),
        )
    );
    //showDialog(context: context, builder: (context){
    // return SendRequestDialogWidget();
    //});

  }

  /// This will render the waiting screen
  Widget _buildLoadingScreen() {
    return Center(
      child: Container(
        width: 50,
        height: 50,
        child: CircularProgressIndicator(),
      ),
    );
  }

  /// This will render the bottom navigation bar
  _getBottomNavigation() {
    if(args == null){
      sessionUser = widget.sessionUser;
    }
    else {
      sessionUser = args.sessionUser;
    }
    print(sessionUser.first_name);
    return BottomNavigationWidget(
      //MosqueFollowersList: UserMosqueFollowingList,
      //CallingFunction: _navigateback(),
      sessionUser: sessionUser,
      CallingScreen: "Home",
      index: 0,
    );
  }

  /// this will get the all the posts from data base
  Future<List<Posts>> queryPosts() async {
    try {
      //List<Posts>
      Postss = await Amplify.DataStore.query(Posts.classType,where:Posts.MOSQUESID.eq(""));
      print("inside posts");
      print(Postss);
      return Postss;
    } catch (e) {
      print("Could not query DataStore: " + e);
    }
  }

  /// This will get the user object of the individual post
  Future<Users> _getUser(String usersID) async {
    print("User");
    print(usersID);
    try {
      UserObjectList = await Amplify.DataStore.query(Users.classType ,where :Users.ID.eq(usersID));
      //print(User[0].first_name);
      print(UserObjectList.length);
      print(UserObjectList[0].first_name);
      //await Future.delayed(Duration(seconds: 1));
      return UserObjectList[0];
    } catch (e) {
      print("Could not query DataStore: " + e);
    }
  }

  /// This will render the comments count of the particular post
  Future<int> _countComments(String PostID) async {
    int CommentsCount = 0;
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
      //await Future.delayed(Duration(seconds: 2));
      return CommentsCount;
    } catch (e) {
      print("Could not query DataStore: " + e);
    }
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

  Future<void> updatePost() async{
    try{
      final updatedItem = Postss[3].copyWith(
          post: "Hi Friends! This is a new post added from APP visible to Community",
          post_image_path: "https://musgreetphase1images184452-staging.s3.eu-west-2.amazonaws.com/public/post_img.png",
          description: "Keep Smiling",
          visibility: "Community",
          usersID: "044882f7-f98a-4313-bcbe-ca082c41c2d7",
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

  Future<void> getUserName(String usersID) async {
    print("User");
    print(usersID);
    UserObjectList = await Amplify.DataStore.query(Users.classType ,where :Users.ID.eq(usersID));
    //print(User[0].first_name);
    print(UserObjectList.length);
    print(UserObjectList[0].first_name);
    //await Future.delayed(Duration(seconds: 1));
    return UserObjectList[0];
  }

  Future<void> _getLikesCount(String PostID) async {
    LikesCount = 0;
    try {
      List<PostLikes> PostLikess = await Amplify.DataStore.query(PostLikes.classType, where: PostComments.POSTSID.eq(PostID));
    } catch (e) {
      print("Could not query DataStore: " + e);
    }

  }

  _getPostCardWidgetUI(Posts postData,Users UserData, int index, int CommentsCount,){
    print("printing Index");
    print(index);
    if(index == Postss.length-1) {
      return Column(
        children:[
        PostCardWidget(
        //profileImage: ImageConstants.IC_HOME_USER1,
        //profileImage: Image.network('https://picsum.photos/250?image=9'),
        profileImage: "https://musgreetphase1images184452-staging.s3.eu-west-2.amazonaws.com/public/public.png",
        //name: AppTexts.TEMP_NAME1,
        //name: Postss[index].usersID,
        //name: UserObject.first_name,
        //name: UserObjectList[0].first_name,
        name: UserData.first_name + " " + UserData.last_name,
        isSponsored: false,
        //timeAgo: AppTexts.TEMP_TIME_AGO_1,
        timeAgo: UserData.postcode,
        //image: ImageConstants.IMG_POST1,
        post: postData.post,
        image: postData.post_image_path,
        //image: "https://musgreetphase1images184452-staging.s3.eu-west-2.amazonaws.com/public/image_picker5824495182282881133.jpg",
        //image: "https://musgreetphase1images184452-staging.s3.eu-west-2.amazonaws.com/public/post_img_2.png",
        //callBack: () => _loadCommentScreen(),
        //callBack: () => _loadCommentScreen(Postss[index].id, User[0], Postss[index].post, Postss[index].post_image_path),
        callBack: () =>
            _loadCommentScreen(postData, UserData, CommentsCount.toString(),sessionUser),
        commentsCount: CommentsCount.toString(),
      ),
          Container(
            child: Image.asset(
              ImageConstants.TEMP_IMG_ADD,
              fit: BoxFit.fitWidth,
            ),
          ),
        ]
      );
    }
    else{
      //return FriendSearchListWidget(
        //index: index, UserObject: Userss[index],
      //);
      return PostCardWidget(
        //profileImage: ImageConstants.IC_HOME_USER1,
        //profileImage: Image.network('https://picsum.photos/250?image=9'),
        profileImage: "https://musgreetphase1images184452-staging.s3.eu-west-2.amazonaws.com/public/public.png",
        //name: AppTexts.TEMP_NAME1,
        //name: Postss[index].usersID,
        //name: UserObject.first_name,
        //name: UserObjectList[0].first_name,
        name: UserData.first_name + " " + UserData.last_name,
        isSponsored: false,
        //timeAgo: AppTexts.TEMP_TIME_AGO_1,
        timeAgo: UserData.postcode,
        //image: ImageConstants.IMG_POST1,
        post: postData.post,
        image: postData.post_image_path,
        //image: "https://musgreetphase1images184452-staging.s3.eu-west-2.amazonaws.com/public/image_picker5824495182282881133.jpg",
        //image: "https://musgreetphase1images184452-staging.s3.eu-west-2.amazonaws.com/public/post_img_2.png",
        //callBack: () => _loadCommentScreen(),
        //callBack: () => _loadCommentScreen(Postss[index].id, User[0], Postss[index].post, Postss[index].post_image_path),
        callBack: () =>
            _loadCommentScreen(postData, UserData, CommentsCount.toString(),sessionUser),
        commentsCount: CommentsCount.toString(),
      );
    }

  }

}
