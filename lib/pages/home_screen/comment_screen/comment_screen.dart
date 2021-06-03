import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:mus_greet/core/config/navigation.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/utils/routes.dart';
import 'package:mus_greet/core/widgets/add_comment_text_field_widget.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';
import 'package:mus_greet/core/widgets/comment_box_widget.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';
import 'package:mus_greet/core/widgets/drawer_widget.dart';
import 'package:mus_greet/core/widgets/post_card_widget.dart';
import 'package:mus_greet/models/ModelProvider.dart';

class CommentScreen extends StatefulWidget {
  final Posts PostObject;
  final Users UserObject;
  //final String UserName;
  //final String Post;
  //final String Post_image_path;

  CommentScreen({this.PostObject, this.UserObject});
  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  List<PostComments> PostCommentss;
  List<PostComments> Comments;
  //List<PostComments> RepliesList = [];
  List RepliesList = [];
  //PostComments Reply;
  List<Users> UsersList;
  int RepliesCount = 0;
  int CommentsCount = 0;

  @override
  Widget build(BuildContext context) {
    print(widget.PostObject.id);
    print("Hello");
    return Scaffold(
      key: _drawerKey,
      backgroundColor: AppColors.GREY_KIND,
      endDrawerEnableOpenDragGesture: false,
      appBar: _getAppBar(),
      drawer: DrawerWidget(),
      body: _getBody(),
    );
    return ListView(
      children: [
        PostCardWidget(
          profileImage: ImageConstants.IC_HOME_USER1,
          //name: AppTexts.TEMP_NAME1,
          name: widget.UserObject.first_name,
          isSponsored: false,
          timeAgo: AppTexts.TEMP_TIME_AGO_1,
          post: widget.PostObject.post,
          //image: ImageConstants.IMG_POST_2,
          image: widget.PostObject.post_image_path,
          isForComment: true,
        ),
        _getCommentSection(),
        CustomSpacerWidget(
          height: 80,
        ),
      ],
    );
  }

  _getBody() {
    return Stack(
      children: [
        //_navigateToComment
        //? CommentScreen(PostID: Postss[0].id, UserName: User[0].first_name, Post:Postss[0].post,)
        //? CommentScreen(PostID: Postss[0].id, UserName: "Sindhu", Post:"Hello",Post_image_path: "hii",)
        //:
        ListView(
          children: [
            PostCardWidget(
              profileImage: ImageConstants.IC_HOME_USER1,
              //name: AppTexts.TEMP_NAME1,
              //name: widget.UserName,
              name: widget.UserObject.first_name + widget.UserObject.last_name,
              isSponsored: false,
              timeAgo: AppTexts.TEMP_TIME_AGO_1,
              post: widget.PostObject.post,
              //image: ImageConstants.IMG_POST_2,
              image: widget.PostObject.post_image_path,
              isForComment: true,
            ),
            _getCommentSection(),
            CustomSpacerWidget(
              height: 80,
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

  _getCommentSection() {
    queryComments();
    return Container(
      padding: EdgeInsets.only(top: 10, left: 20, right: 20),
      color: AppColors.comment_wall_color,
      width: double.maxFinite,
      child: Column(
        children: [
          _getViewAllCommentButton(),
          CustomSpacerWidget(
            height: 10,
          ),
          _getUsersComment(),
          CustomSpacerWidget(
            height: 20,
          ),
          _addCommentTextField(),
          CustomSpacerWidget(
            height: 10,
          ),
        ],
      ),
    );

  }

  _getViewAllCommentButton() {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.only(left: 10),
      height: 20,
      alignment: Alignment.centerLeft,
      child: Text(
        AppTexts.VIEW_ALL_COMMENT,
        style: TextStyle(
          fontFamily: FontConstants.FONT,
          fontSize: 12,
          fontWeight: FontWeight.w700,
          decoration: TextDecoration.underline,
          shadows: [Shadow(color: AppColors.black)],
        ),
      ),
    );
  }

  _getUsersCommentss() {
    return Container(
      padding: EdgeInsets.only(left: 20),
      child: Column(
        children: [
          CommentBoxWidget(
            //userComment: AppTexts.COMMENT_SCREEN_TEXT,
            userComment: Comments[0].comment,
          ),
          CustomSpacerWidget(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.only(left: 40),
            child: CommentBoxWidget(
              userComment: AppTexts.COMMENT_SCREEN_TEXT2,
            ),
          ),
        ],
      ),
    );
  }

  _getUsersComment() {
    print(Comments.length);
    return ListView.separated(
      //physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Center(
            child: Comments[index].parent_id == "" ? Container(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                children: [
                  CommentBoxWidget(
                    //userComment: AppTexts.COMMENT_SCREEN_TEXT,
                    userComment: Comments[index].comment,
                    userName: AppTexts.COMMENT_USER_NAME,
                  ),
                  CustomSpacerWidget(
                    height: 15,
                  ),
                ],
              ),
            ) : _repliesCounter(Comments[index].id)
        );
      },
      separatorBuilder: (context, index) {
        return Divider(
          height: 1,
          color: Colors.transparent,
        );
      },
      //itemCount: PostCommentss.length,
      //itemCount: 1,
      itemCount: Comments.length,
    );
  }

  _getAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.white,
      leading: GestureDetector(
        onTap: () {
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

  _handleSearch() {
    print("Handle friend Search!!");
    Navigation.intent(context, AppRoutes.FRIEND_SEARCH);
    //showDialog(context: context, builder: (context){
    // return SendRequestDialogWidget();
    //});

  }

  _addCommentTextField() {
    _CommentsCounter();
    return AppCommentTextFieldWidget(hintText: "Write your Comment", ScreenType: "Comment",PostObject: widget.PostObject, UserObject: widget.UserObject, ParentID: "",);
  }

  Future<void> queryComments() async {
    try {
      //print(widget.PostID + "    Helloooooo");
      //print("Welcome to comments query");
      Comments = await Amplify.DataStore.query(PostComments.classType,
          where: PostComments.POSTSID.eq(widget.PostObject.id));
      //PostCommentss = await Amplify.DataStore.query(PostComments.classType);
      //print(PostCommentss[6]);
      await Future.delayed(Duration(seconds: 2));
      //for (var i in Comments) {
      //_getUserDetails(Comments[0].usersID);
      //}
      //_getUserDetails();
      // updateComments();
      //print(Comments);
    } catch (e) {
      print("Could not query DataStore: " + e);
    }
  }

  Future<void> updateComments() async {
    final updatedItem = PostCommentss[6].copyWith(
        comment: "Really great job sindhuja, Keep it up",
        parent_id: "",
        postsID: "bc440d02-350e-4d67-abc5-f4ffc7e6e301",
        usersID: "40d605ff-0ce4-4b4f-ae43-9e97d37c6cfc",
        Comments_PostLikes: []);
    await Amplify.DataStore.save(updatedItem);
  }


  /// Method to get commented user details
  Future<void> _getUserDetails(String UserID) async {
    try {
      UsersList = await Amplify.DataStore.query(
          Users.classType, where: Users.ID.eq(UserID));
    } catch (e) {
      print("Could not query DataStore: " + e);
    }
  }

  _addReplies(PostComments Reply) {
    print("Welcome");
    print(RepliesList.length);
    var i;
    print(Reply);
    for (i = 0; i <= RepliesList.length; i++) {
      print(i);
      if (RepliesList.isEmpty) {
        RepliesList.add(Reply);
        break;
      }
      else {
        if (Reply.id != RepliesList[i].id) {
          print("wow");
          RepliesList.add(Reply);
        }
      }
    }
    //print(RepliesList.length);
  }

  _repliesCounter(String RepliesID) {
    print("inside replies");
    //print(RepliesID);
    //print(Parent_Comment);
    if (RepliesID != null) {
      int count = 0;
      if(RepliesList.isEmpty){
        RepliesList.add(RepliesID);
      }
      for (var i = 0; i < RepliesList.length; i++) {
        count++;
        print(count);
        print(RepliesList[i]);
        if (RepliesList[i] == RepliesID) {
          break;
        }
        if (count == RepliesList.length) {
          RepliesList.add(RepliesID);
          RepliesCount++;
        }
      }
    }
    RepliesCount = RepliesList.length;
    print(RepliesList);
    print(RepliesList.length);
  }

  _CommentsCounter(){
    print("inside Comments Counter");
    print(RepliesList.length);
    print(RepliesCount);
    CommentsCount = Comments.length - RepliesList.length;
    print(CommentsCount);
  }
}







