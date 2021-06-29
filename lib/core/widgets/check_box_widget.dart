import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';

class CheckBoxWidget extends StatefulWidget {
  final Function(bool) callBack;
  final Widget textWidget;

  const CheckBoxWidget({Key key, this.callBack,this.textWidget}) : super(key: key);

  @override
  _CheckBoxWidgetState createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _isChecked = !_isChecked;
              });
              widget.callBack(_isChecked);
            },
            child: Container(
              height: 16,
              width: 16,
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: AppColors.green),
                  color: _isChecked ? AppColors.green : AppColors.white),
              child: AssetImageWidget(
                image: ImageConstants.IC_CHECK,
                height: 8,
                width: 8,
              ),
            ),
          ),
          CustomSpacerWidget(
            width: 8,
          ),
          Expanded(
            child: widget.textWidget
          ),
        ],
      ),
    );
  }

  _privacyPolicy() {}
}
