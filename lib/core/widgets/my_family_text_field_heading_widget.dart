import 'package:flutter/material.dart';
import 'package:mus_greet/core/utils/constants.dart';

import 'custom_spacer_widget.dart';
import 'package:form_field_validator/form_field_validator.dart';


class MyFamilyTextFieldHeadingWidget extends StatefulWidget {
  final String fieldName;
  final TextEditingController controller;
  final String hintText;

  MyFamilyTextFieldHeadingWidget({this.fieldName, this.controller,this.hintText});

  @override
  _MyFamilyTextFieldHeadingWidgetState createState() => _MyFamilyTextFieldHeadingWidgetState();
}

class _MyFamilyTextFieldHeadingWidgetState extends State<MyFamilyTextFieldHeadingWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.fieldName,
          style: TextStyle(
            fontFamily: FontConstants.FONT,
            fontSize: 14,
            fontWeight: FontWeight.w900,
            color: AppColors.black,
          ),
        ),
        CustomSpacerWidget(
          height: 8,
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.vertical_divider,)
          ),
          child: TextFormField(
            controller: widget.controller,
            validator: MultiValidator(
                [
                  RequiredValidator(errorText:  widget.fieldName + ' field is required'),
                ]
            ),
            style: TextStyle(
              fontFamily: FontConstants.FONT,
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: AppColors.black,
            ),
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.vertical_divider,
              ),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 20,right: 20),
            ),
          ),
        )
      ],
    );
  }
}
