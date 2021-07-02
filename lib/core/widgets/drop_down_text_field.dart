import 'package:flutter/material.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';
import 'package:form_field_validator/form_field_validator.dart';

class DropDownTextField extends StatefulWidget {
  final List<String> data;
  final String fieldName;
  final Function(String role) callBack;

  DropDownTextField({this.callBack, this.data, this.fieldName});

  @override
  _DropDownTextFieldState createState() => _DropDownTextFieldState();
}

class _DropDownTextFieldState extends State<DropDownTextField> {
  String _category;

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
            borderRadius: BorderRadius.circular(10),
            color: AppColors.white,
            border: Border.all(color: AppColors.vertical_divider, width: 1),
          ),
          child: DropdownButtonFormField(
            // validator: RequiredValidator(errorText: "This field is required"),
            iconSize: 24,
            isExpanded: true,
            //dropdownColor: AppColors.white,
            items: widget.data.map((String category) {
              return new DropdownMenuItem(
                  value: category,
                  child: Text(
                    category,
                    style: TextStyle(
                      fontFamily: FontConstants.FONT,
                      fontSize: 13,
                      fontWeight: FontWeight.w900,
                      color: AppColors.black,
                    ),
                  ));
            }).toList(),
            onChanged: (newValue) {
              // do other stuff with _category
              setState(() {
                _category = newValue;
                widget.callBack(_category);
              });
            },
            // validator: MultiValidator(
            //     [
            //       RequiredValidator(errorText: 'Password field is required'),
            //     ]
            // ),
            value: _category,

            validator: (value) => value == null ?   widget.fieldName + '  field is required' : null,
            // validator: MultiValidator(
            //     [
            //       RequiredValidator(errorText: 'Password field is required'),
            //     ]
            // ),
            dropdownColor: AppColors.white,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 15, right: 15),
              hintText: AppTexts.LABEL_SELECT,
              helperStyle: TextStyle(
                fontFamily: FontConstants.FONT,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.vertical_divider,
              ),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
