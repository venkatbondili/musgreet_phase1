import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';
import 'package:mus_greet/models/ModelProvider.dart';
import 'package:mus_greet/models/PostComments.dart';
import 'package:mus_greet/pages/home_screen/comment_screen/comment_screen.dart';
import 'package:mus_greet/pages/mosque_screen/mosque_details/mosque_comment_screen/mosque_comment_screen.dart';


class MosqueCommentTextFieldWidget extends StatefulWidget {
  final String hintText;
  final String ScreenType;
  //final String PostID;
  final String ParentID;
  //final String UserID;
  final Posts PostObject;
  //final Users UserObject;
  final Mosque MosqueObject;
  final PostComments postComments ;
  final String commentsCount;
  final Users sessionUser;
  MosqueCommentTextFieldWidget({this.hintText, this.ScreenType, this.ParentID,this.PostObject,
    //this.UserObject,
    this.MosqueObject,this.postComments,this.commentsCount, this.sessionUser});
  @override
  _MosqueCommentTextFieldWidgetState createState() => _MosqueCommentTextFieldWidgetState();
}

class _MosqueCommentTextFieldWidgetState extends State<MosqueCommentTextFieldWidget> {
  bool Action = false;
  bool reloadPage = false;
  int commentsCount ;
  String UserID;
  final ctrlText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    UserID = widget.sessionUser.id;
    commentsCount = int.parse(widget.commentsCount);
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        controller: ctrlText,
        style: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 14,
          color: AppColors.black,
        ),
        decoration: InputDecoration(
          hintText: widget.hintText,
          //hintText: "Write your replay",
          hintStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppColors.vertical_divider,
            fontFamily: FontConstants.FONT,
          ),
          suffixIcon: _getSuffixActionsButton(),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          contentPadding: EdgeInsets.only(left: 20,right: 20,top: 15),
        ),
        onSubmitted: (String str){
          _CreateComment(str, widget.ScreenType);
          print(str);
        },
      ),
    );
  }

  _getSuffixActionsButton(){
    return Container(
      padding: EdgeInsets.only(right: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          //Image.asset(
          //ImageConstants.IC_CAMERA,
          //height: 20,
          //width: 20,
          //),
          //CustomSpacerWidget(width: 10,),
          //Container(
          //width: 1.5,
          //height: 15,
          //color: AppColors.vertical_divider,
          //),
          //CustomSpacerWidget(width: 10,),
          GestureDetector(
            onTap: ()=>{
              _CreateComment(ctrlText.text, widget.ScreenType),
              print("about to refresh"),
              print(ctrlText.text),
              Action = true,
            },
            child: Image.asset(
              ImageConstants.IC_SEND,
              height: 20,
              width: 20,
            ),
          ),
        ],
      ),
    );
  }

  _CreateComment(String textFeildText, String ScreenType) async {
    //print(textFeildText);
    //print(widget.ParentID);
    //print(widget.PostObject.id);
    //print(widget.UserObject.id);
    try {
      final item = PostComments(
          comment: textFeildText,
          parent_id: widget.ParentID,
          postsID: widget.PostObject.id,
          usersID: UserID,
          Comments_PostLikes: []);
      await Amplify.DataStore.save(item);
      await Future.delayed(Duration(seconds: 2));
      ctrlText.clear();
      commentsCount++;
      _reloadPage(commentsCount);
    }catch (e) {
      print("Could not query DataStore: " + e);
    }
  }

  _reloadPage(int commentsCount){
    print("inside Reload function");
    //Navigator.pushReplacement(context, MaterialPageRoute( builder: (BuildContext context) => super.widget));
    reloadPage = true;
    //Navigator.pop(context);
    print("Thank you for reloading");
    Navigator.push(context,
        MaterialPageRoute(
          builder: (context) => MosqueCommentScreen(CommentsCount: commentsCount.toString(), MosqueObject:widget.MosqueObject, PostObject: widget.PostObject,sessionUser: widget.sessionUser,),
        )
    );
  }

}
