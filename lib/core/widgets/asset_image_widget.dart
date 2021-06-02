import 'package:flutter/material.dart';
import 'package:mus_greet/core/utils/constants.dart';


///For showing assets images on the screen
class AssetImageWidget extends StatelessWidget {
  final String image;
  final double height;
  final double width;
  final Color color;

  const AssetImageWidget({this.image, this.height, this.width,this.color});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      height: height,
      width: width,
      color: color!=null ? AppColors.black.withOpacity(0.5) : null,
    );
  }
}
