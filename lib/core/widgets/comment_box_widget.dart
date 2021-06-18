import 'package:flutter/material.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';
import 'package:mus_greet/models/ModelProvider.dart';

class CommentBoxWidget extends StatefulWidget {
  final String userComment;
  final String userName;

  const CommentBoxWidget({Key key, this.userComment, this.userName}) : super(key: key);

  @override
  _CommentBoxWidgetState createState() => _CommentBoxWidgetState();
}

class _CommentBoxWidgetState extends State<CommentBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.white,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _getUserIcon(),
              _getUserNameAndComment(),
            ],
          ),
        ),
        CustomSpacerWidget(
          height: 4,
        ),
        _getReplayButtons(),
      ],
    );
  }

  _getUserIcon() {
    return Image.asset(
      ImageConstants.IC_HOME_USER2,
      height: 40,
      width: 40,
    );
  }

  _getUserNameAndComment() {
    return Flexible(
      child: Text.rich(
        TextSpan(
          //text: AppTexts.COMMENT_USER_NAME,
          text: widget.userName,
          style: TextStyle(
            fontFamily: FontConstants.FONT,
            fontSize: 13,
            fontWeight: FontWeight.w700,
          ),
          children: [
            TextSpan(
              text: widget.userComment,
              style: TextStyle(
                fontFamily: FontConstants.FONT,
                fontWeight: FontWeight.normal,
                fontSize: 12,
              ),
            ),
          ],
        ),
        maxLines: 2,
      ),
    );
  }

  _getReplayButtons() {
    return Container(
      padding: EdgeInsets.only(left: 70),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppTexts.TIME_AGO_COMMENT,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontFamily: FontConstants.FONT,
              color: AppColors.vertical_divider,
              fontSize: 10,
            ),
          ),
          Text(
            "                  •",
            style: TextStyle(color: AppColors.vertical_divider),
          ),
          Text(
            AppTexts.APPRECIATE_TEXT,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontFamily: FontConstants.FONT,
              fontSize: 10,
              color: AppColors.vertical_divider,
            ),
          ),
          Text(
            "      •",
            style: TextStyle(color: AppColors.vertical_divider),
          ),
          Text(
            AppTexts.REPLAY_COMMENT,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontFamily: FontConstants.FONT,
              color: AppColors.vertical_divider,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
