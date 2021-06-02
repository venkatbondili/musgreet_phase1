import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mus_greet/core/utils/constants.dart';

class SearchTextFieldWidget extends StatelessWidget {
  const SearchTextFieldWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.green,
        ),
      ),
      child: TextField(
        //controller: widget.controller,
        style: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 14,
          color: AppColors.black,
        ),
        decoration: InputDecoration(
          //hintText: widget.hintText,
          hintStyle: TextStyle(
            fontFamily: FontConstants.FONT,
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: AppColors.black_50,
          ),
          labelText: AppTexts.LABEL_CURRENT_LOCATION,
          labelStyle: TextStyle(
            fontFamily: FontConstants.FONT,
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.header_black,
          ),
          hintText: AppTexts.HINT_LOCATION,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(6.0),
            child: SvgPicture.asset(
              ImageConstants.IC_CURRENT_LOCATION,
              height: 20,
              width: 20,
            ),
          ),
          suffixIcon: Container(
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.green),
              color: AppColors.background_color,
            ),
            margin: EdgeInsets.only(top: 2,right: 4,bottom: 2,left: 4),
            alignment: Alignment.center,
            child: Image.asset(
              ImageConstants.IC_SEARCH,
              height: 20,
              width: 20,
            ),
          ),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          contentPadding:
              EdgeInsets.only(left: 20, bottom: 10, top: 10, right: 20),
        ),
      ),
    );
  }
}
