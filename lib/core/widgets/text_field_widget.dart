import 'package:flutter/material.dart';
import 'package:mus_greet/core/utils/constants.dart';



/// this will render text field on the screen
class TextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;

  TextFieldWidget({ this.controller,this.hintText});
  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width-120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.green,)
      ),
      child: TextField(
        controller: widget.controller,
        style: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 14,
          color: AppColors.black,
        ),
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: AppColors.black,
          ),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          contentPadding: EdgeInsets.only(left: 20,bottom: 10,top: 0,right: 20),
        ),
      ),
    );
  }
}
