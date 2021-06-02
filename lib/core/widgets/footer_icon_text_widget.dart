import 'package:flutter/material.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';


///This will return footer icons and count on them.
class FooterIconAndTextWidget extends StatefulWidget {
  final String image;
  final String text;
  final String count;
  final Color color;

  FooterIconAndTextWidget({this.image, this.text, this.count,this.color});

  @override
  _FooterIconAndTextWidgetState createState() =>
      _FooterIconAndTextWidgetState();
}

class _FooterIconAndTextWidgetState extends State<FooterIconAndTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _getFooterIcon(),
        CustomSpacerWidget(
          width: 10,
        ),
        _getTextAndCount(),
      ],
    );
  }


  ///This will return Icons for footer
  _getFooterIcon() {
    return GestureDetector(
      onTap: () => _handleAction(),
      child: AssetImageWidget(
        image: widget.image,
        height: 20,
        width: 20,
        color: widget.color!=null? widget.color : null,

      ),
    );
  }

  /// This will return Icons name and count on them
  _getTextAndCount() {
    return Column(
      children: [
        _getCount(),
        _getNameOfFooter(),
      ],
    );
  }

  /// Count on footer
  _getCount() {
    return Text(
      widget.count.toString(),
      style: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.bold,
        color: AppColors.green,
      ),
    );
  }

  /// Name of footer
  _getNameOfFooter() {
    return Text(
      widget.text,
      style: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        color: AppColors.black,
      ),
    );
  }

  ///For handling the action after footer button pressed
  _handleAction() {
    ///temp
    print("Handle likes, comment and Share");
  }
}
