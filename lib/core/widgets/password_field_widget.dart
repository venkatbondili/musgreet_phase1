import 'package:flutter/material.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';

class PasswordFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String leadingIcon;
  final String hintText;
  final bool isPasswordField;
  final bool isSuffix;

  const PasswordFieldWidget(
      {Key key,
      this.controller,
      this.leadingIcon,
      this.hintText,
      this.isPasswordField,
      this.isSuffix = true})
      : super(key: key);

  @override
  _PasswordFieldWidgetState createState() => _PasswordFieldWidgetState();
}

class _PasswordFieldWidgetState extends State<PasswordFieldWidget> {
  bool _isObscure = true;

  @override
  void initState() {
    if (widget.isPasswordField != null) {
      _isObscure = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 55,
      padding: EdgeInsets.only(left: 15, top: 10, bottom: 12),
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
        obscureText: _isObscure,
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
          suffixIcon: widget.isSuffix
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.only(start: 6, end: 20, top: 5),
                    child: AssetImageWidget(
                      image: _isObscure
                          ? ImageConstants.IC_INVISIBLE
                          : ImageConstants.IC_VISIBLE,
                      height: 10,
                      width: 10,
                    ),
                  ),
                )
              : Container(
                  height: 10,
                  width: 10,
                ),
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
