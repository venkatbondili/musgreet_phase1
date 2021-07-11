import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';

class LoginScreenTextField extends StatefulWidget {
  final TextEditingController controller;
  final String leadingIcon;
  final String hintText;
  final String suffixIcon;
  final bool isPasswordField;

  const LoginScreenTextField({
    Key key,
    this.controller,
    this.leadingIcon,
    this.hintText,
    this.suffixIcon,
    this.isPasswordField = false,
  }) : super(key: key);

  @override
  _LoginScreenTextFieldState createState() => _LoginScreenTextFieldState();
}

class _LoginScreenTextFieldState extends State<LoginScreenTextField> {
  bool _shouldShowPassword = false;


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 50,
      padding: EdgeInsets.only(left: 15, top: 10, bottom: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.green_light),
      ),
      child: TextField(
        controller: widget.controller,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: FontConstants.FONT,
          fontSize: 13,
          color: AppColors.black,
        ),
        obscureText: widget.isPasswordField,
        cursorColor: AppColors.vertical_divider,
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: EdgeInsetsDirectional.only(start: 0, end: 20, top: 5),
            child: AssetImageWidget(
              image: widget.leadingIcon,
              height: 10,
              width: 10,
            ),
          ),
          suffixIcon: widget.suffixIcon != null
              ? GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.only(start: 6, end: 20, top: 5),
                    child: AssetImageWidget(
                      image: widget.suffixIcon,
                      height: 10,
                      width: 10,
                    ),
                  ),
                )
              : null,
          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w900,
            color: AppColors.light_grey,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsetsDirectional.only(bottom: 7),
        ),
      ),
    );
  }
}
