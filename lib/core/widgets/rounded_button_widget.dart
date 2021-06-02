import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mus_greet/core/utils/constants.dart';

class RoundedButtonWidget extends StatefulWidget {
  final Function callBack;
  final String text;


  RoundedButtonWidget({ this.callBack,this.text});
  @override
  _RoundedButtonWidgetState createState() => _RoundedButtonWidgetState();
}

class _RoundedButtonWidgetState extends State<RoundedButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> widget.callBack(),
      child: Container(
        padding: EdgeInsets.only(left: 15,right: 15,top: 8,bottom: 8),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.background_color),
          borderRadius: BorderRadius.circular(30)
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: AppColors.green,
          ),
        ),
      ),
    );
  }
}
