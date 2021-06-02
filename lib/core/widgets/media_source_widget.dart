import 'package:flutter/material.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';

class MediaSourceWidget extends StatefulWidget {
  final String image;
  final String text;
  final Function callBack;

  const MediaSourceWidget({Key key, this.image, this.text,this.callBack}) : super(key: key);
  @override
  _MediaSourceWidgetState createState() => _MediaSourceWidgetState();
}

class _MediaSourceWidgetState extends State<MediaSourceWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> widget.callBack(),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 15,bottom: 15,left: 10,right: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: AppColors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AssetImageWidget(
              image: widget.image,
              height: 30,
              width: 30,
            ),
            CustomSpacerWidget(width: 15,),
            Text(
              widget.text,
              style: TextStyle(
                fontFamily: FontConstants.FONT,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.header_black
              ),
            )
          ],
        ),
      ),
    );
  }
}
