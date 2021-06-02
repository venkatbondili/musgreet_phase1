import 'package:flutter/material.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/widgets/add_comment_text_field_widget.dart';
import 'package:mus_greet/core/widgets/comment_box_widget.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';
import 'package:mus_greet/core/widgets/post_card_widget.dart';

class CommentScreen extends StatefulWidget {
  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        PostCardWidget(
          profileImage: ImageConstants.IC_HOME_USER1,
          name: AppTexts.TEMP_NAME1,
          isSponsored: false,
          timeAgo: AppTexts.TEMP_TIME_AGO_1,
          image: ImageConstants.IMG_POST_2,
          isForComment: true,
        ),
        _getCommentSection(),
        CustomSpacerWidget(
          height: 80,
        ),
      ],
    );
  }

  _getCommentSection() {
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
            height: 50,
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

  _getUsersComment() {
    return Container(
      padding: EdgeInsets.only(left: 20),
      child: Column(
        children: [
          CommentBoxWidget(
            userComment: AppTexts.COMMENT_SCREEN_TEXT,
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

  _addCommentTextField(){
    return AppCommentTextFieldWidget();
  }
}
