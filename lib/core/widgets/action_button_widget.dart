import 'package:flutter/material.dart';
import 'package:mus_greet/core/utils/constants.dart';


class ActionButtonWidget extends StatefulWidget {
  final Function callBack;
  final String text;
  final bool isFilled;
  final double radius;

  ActionButtonWidget({ this.callBack, this.text, this.isFilled=false,this.radius=8}) ;

  @override
  _ActionButtonWidgetState createState() => _ActionButtonWidgetState();
}

class _ActionButtonWidgetState extends State<ActionButtonWidget> {
  @override
  Widget build(BuildContext context) {
   return GestureDetector(
      onTap: ()=> widget.callBack(),
      child: Container(
        padding: EdgeInsets.only(left: 35,right: 35,top: 12,bottom: 12),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.background_color),
          borderRadius: BorderRadius.circular(widget.radius),
          color: widget.isFilled ? AppColors.background_color : null,
        ),
        child: Text(
          widget.text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            fontFamily: FontConstants.FONT,
            color: widget.isFilled? AppColors.white : AppColors.background_color,
          ),
        ),
      ),
    );
  }
}
