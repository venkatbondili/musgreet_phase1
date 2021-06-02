import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';

class AdvanceFriendSearchContextWidget extends StatefulWidget {
  final String contextImage;
  final String contextName;

  const AdvanceFriendSearchContextWidget(
      {Key key, this.contextImage, this.contextName})
      : super(key: key);

  @override
  _AdvanceFriendSearchContextWidgetState createState() =>
      _AdvanceFriendSearchContextWidgetState();
}

class _AdvanceFriendSearchContextWidgetState
    extends State<AdvanceFriendSearchContextWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      shadowColor: AppColors.white_shade,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: AppColors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _getContextIcon(),
            CustomSpacerWidget(
              width: 20,
            ),
            _getContextName(),
            Expanded(
              child: CustomSpacerWidget(
                width: 5,
              ),
            ),
            _getNextButton(),
          ],
        ),
      ),
    );
  }

  _getContextIcon() {
    return Image.asset(
      widget.contextImage,
      height: 40,
      width: 40,
    );
  }

  _getContextName() {
    return Text(
      widget.contextName,
      style: TextStyle(
          fontFamily: FontConstants.FONT,
          fontWeight: FontWeight.w900,
          fontSize: 16,
          color: AppColors.header_black),
    );
  }

  _getNextButton() {
    return Image.asset(
      ImageConstants.IC_FORWARD,
      height: 20,
      width: 20,
    );
  }
}
