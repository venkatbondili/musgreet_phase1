import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';


class AppCommentTextFieldWidget extends StatefulWidget {
  @override
  _AppCommentTextFieldWidgetState createState() => _AppCommentTextFieldWidgetState();
}

class _AppCommentTextFieldWidgetState extends State<AppCommentTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        style: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 14,
          color: AppColors.black,
        ),
        decoration: InputDecoration(
          hintText: "Write your replay",
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
      ),
    );
  }

  _getSuffixActionsButton(){
    return Container(
      padding: EdgeInsets.only(right: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            ImageConstants.IC_CAMERA,
            height: 20,
            width: 20,
          ),
          CustomSpacerWidget(width: 10,),
          Container(
            width: 1.5,
            height: 15,
            color: AppColors.vertical_divider,
          ),
          CustomSpacerWidget(width: 10,),
          Image.asset(
            ImageConstants.IC_SEND,
            height: 20,
            width: 20,
          ),
        ],
      ),
    );
  }

}
