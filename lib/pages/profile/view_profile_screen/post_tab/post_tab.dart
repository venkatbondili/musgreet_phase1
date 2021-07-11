import 'package:flutter/material.dart';
import 'package:mus_greet/core/config/navigation.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/utils/routes.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';
import 'package:mus_greet/core/widgets/post_card_widget.dart';
import 'package:mus_greet/core/widgets/rounded_button_widget.dart';
import 'package:mus_greet/core/widgets/text_field_widget.dart';
import 'package:mus_greet/models/ModelProvider.dart';
import 'package:mus_greet/models/Posts.dart';
import 'package:mus_greet/models/Users.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:mus_greet/pages/create_post_screen/create_post_screen.dart';
import 'package:mus_greet/pages/home_screen/comment_screen/comment_screen.dart';


class PostTab extends StatefulWidget {
  final Users sessionUser;
  PostTab({this.sessionUser});
  @override
  _PostTabState createState() => _PostTabState();
}

class _PostTabState extends State<PostTab> {

  final TextEditingController _controller = TextEditingController();
  List<Users> Userss =[];
  List<Posts> Postss =[];
  List<Users> UserObjectList = [];
  Users UserObject;
  //int   CommentsCount = 0;
  int  LikesCount = 0;
  String UserID;

  @override
  Widget build(BuildContext context) {
    UserID = widget.sessionUser.id;
    return FutureBuilder<Users>(
      future: _getUser(UserID),
      builder: (ctx, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            UserObject = snapshot.data;
            return _buildUI(UserObject);
          default:
            return _buildLoadingScreen();
        }
      },
    );
  }

  ///This will render text field for posting the thoughts to community
  _getTextField() {
    return Container(
      margin: EdgeInsets.only(top: 4),
      color: AppColors.white,
      height: 70,
      padding: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          AssetImageWidget(
            image: ImageConstants.IC_HOME_USER2,
            height: 60,
            width: 60,
          ),
          CustomSpacerWidget(
            width: 0,
          ),
          GestureDetector(
            onTap: (){
              _navigatetoCreatePost();
              //Navigation.intent(context, AppRoutes.CREATE_POST_SCREEN);
            },//=> widget.callBack(),
            child: Container(
              padding: EdgeInsets.only(left: 2,right: 0,top: 8,bottom: 8),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.background_color),
                  borderRadius: BorderRadius.circular(30)
              ),
              child: Text(
                "Whats on your mind?                                                ",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: AppColors.black,
                ),
              ),
            ),
          ),
        //_getEditButton(),
        ],
      ),
    );
  }

  _navigatetoCreatePost(){
    print("inside navigate to create post");
    print(widget.sessionUser.first_name);

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => CreatePostScreen(sessionUser:widget.sessionUser)));

  }

  _getEditButton() {
    return RoundedButtonWidget(
      text: "Whats on your mind?",
      callBack: () {
        Navigation.intent(context, AppRoutes.CREATE_POST_SCREEN);
      },
    );
  }
  _buildUI(Users UserObject) {
    return FutureBuilder<List<Posts>>(
      future: _getPosts(UserObject),
      builder: (ctx, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            Postss = snapshot.data;
            return _buildPosts(UserObject, Postss);
          default:
            return _buildLoadingScreen();
        }
      },
    );
  }

  _buildPosts(Users UserObject, List<Posts> posts){
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _getTextField(),
                Postss.isNotEmpty ? ListView.separated(
                  //physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index){
                    print(index);
                    return getpostcardWidget(posts[index],UserObject);
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      height: 1,
                      color: Colors.transparent,
                    );
                  },
                  itemCount: posts.length,
                ) : PostCardWidget(
                  //profileImage: ImageConstants.IC_HOME_USER1,
                  //profileImage: Image.network('https://picsum.photos/250?image=9'),
                  //profileImage:// userData profile photo link need to be linked,
                  profileImage: "https://musgreetphase1images184452-staging.s3.eu-west-2.amazonaws.com/public/home_user1.png",
                  //name: AppTexts.TEMP_NAME1,
                  //name: Postss[index].usersID,
                  //name: UserObject.first_name,
                  //name: UserObjectList[0].first_name,
                  name: "Musgreet",
                  isSponsored: false,
                  //timeAgo: AppTexts.TEMP_TIME_AGO_1,
                  timeAgo:"",
                  //image: ImageConstants.IMG_POST1,
                  post: "Welcome to Musgreet!!! Create your Posts here",
                  image: "https://musgreetphase1images184452-staging.s3.eu-west-2.amazonaws.com/public/post_img.png",
                  //image: "https://musgreetphase1images184452-staging.s3.eu-west-2.amazonaws.com/public/image_picker5824495182282881133.jpg",
                  //image: "https://musgreetphase1images184452-staging.s3.eu-west-2.amazonaws.com/public/post_img_2.png",
                  //callBack: () => _loadCommentScreen(),
                  //callBack: () => _loadCommentScreen(Postss[index].id, User[0], Postss[index].post, Postss[index].post_image_path),
                  //callBack: () =>
                  // _loadCommentScreen(postData, UserData, CommentsCount.toString(), sessionUser),
                  commentsCount: 0.toString(),
                ),
              ],
            ),
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
      ),
    );
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _getTextField(),
          ListView.separated(
            //physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index){
              print(index);
              return getpostcardWidget(posts[index],UserObject);
            },
            separatorBuilder: (context, index) {
              return Divider(
                height: 1,
                color: Colors.transparent,
              );
            },
            itemCount: posts.length,
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
      ),
    );
  }
  Widget _buildLoadingScreen() {
    return Center(
      child: Container(
        width: 50,
        height: 50,
        child: CircularProgressIndicator(),
      ),
    );
  }

  Future<Users>_getUser(String UserID) async {
    try {
      List<Users> Userss = await Amplify.DataStore.query(Users.classType, where: Users.ID.eq(UserID));
      print(Userss);
      return Userss[0];
    } catch (e) {
      print("Could not query DataStore: " + e);
    }

  }

  Future<List<Posts>> _getPosts(Users userObject) async {
    try {
      //List<Posts>
      Postss = await Amplify.DataStore.query(Posts.classType, where: Posts.USERSID.eq(userObject.id));
      print(Postss);
      print("inside posts");
      return Postss;
    } catch (e) {
      print("Could not query DataStore: " + e);
    }
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
      //_navigateToComment = true;
    });
  }

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

  Widget getpostcardWidget(Posts postData, Users UserData) {
    return FutureBuilder<int>(
      future: _countComments(postData.id),
      builder: (ctx, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            int CommentsCount = snapshot.data;
            return PostCardWidget(
              //profileImage: ImageConstants.IC_HOME_USER1,
              //profileImage: Image.network('https://picsum.photos/250?image=9'),
              profileImage: "https://musgreetphase1images184452-staging.s3.eu-west-2.amazonaws.com/public/public.png",
              //name: AppTexts.TEMP_NAME1,
              //name: Postss[index].usersID,
              //name: UserObject.first_name,
              //name: UserObjectList[0].first_name,
              name: UserData.first_name + " "+ UserData.last_name,
              isSponsored: false,
              //timeAgo: AppTexts.TEMP_TIME_AGO_1,
              timeAgo: UserData.postcode,
              //image: ImageConstants.IMG_POST1,
              post:postData.post,
              image: postData.post_image_path,
              //image: "https://musgreetphase1images184452-staging.s3.eu-west-2.amazonaws.com/public/image_picker5824495182282881133.jpg",
              //image: "https://musgreetphase1images184452-staging.s3.eu-west-2.amazonaws.com/public/post_img_2.png",
              //callBack: () => _loadCommentScreen(),
              //callBack: () => _loadCommentScreen(Postss[index].id, User[0], Postss[index].post, Postss[index].post_image_path),
              callBack: () => _loadCommentScreen(postData, UserData, CommentsCount.toString()),
              commentsCount:CommentsCount.toString(),
            );
          default:
            return _buildLoadingScreen();
        }
      },
    );
  }

  _getAdminPost() {

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
      post: "Welcome to Musgreet!!! Create your Posts here",
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

}
