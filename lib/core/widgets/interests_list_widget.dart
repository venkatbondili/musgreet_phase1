import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';

class InterestsListWidget extends StatefulWidget {
  final String contextImage;
  final String contextName;

  const InterestsListWidget(
      {Key key, this.contextImage, this.contextName})
      : super(key: key);

  @override
  _InterestsListWidgetState createState() =>
      _InterestsListWidgetState();
}

class _InterestsListWidgetState
    extends State<InterestsListWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: Column(
        children: [
          AssetImageWidget(
            image:widget.contextImage,
            //image: ImageConstants.IC_FATHER,
            height: 60,
            width: 60,
          ),
          getCommonPadding(
              0,
              10,
              0,
              0,
              Center(
                child: Text(
                  widget.contextName,
                  //"Food",
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: FontConstants.FONT,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black),
                ),
              )),
        ],
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

  _getInterestChild() {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: Column(
        children: [
          AssetImageWidget(
            image:widget.contextImage,
            //image: ImageConstants.IC_FATHER,
            height: 60,
            width: 60,
          ),
          getCommonPadding(
              0,
              10,
              0,
              0,
              Center(
                child: Text(
                  widget.contextName,
                  //"Food",
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: FontConstants.FONT,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black),
                ),
              )),
        ],
      ),
    );
  }

  ///Create a common padding widget for the About Us View
  Widget getCommonPadding(
      double left, double top, double bottom, double right, Widget widget) {
    return Padding(
      padding:
      EdgeInsets.only(left: left, top: top, bottom: bottom, right: right),
      child: widget,
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
