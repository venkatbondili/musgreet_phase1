import 'package:flutter/material.dart';
import 'package:mus_greet/core/utils/constants.dart';


///For showing assets images on the screen
class S3BucketImageWidget extends StatelessWidget {
  final String image;
  final double height;
  final double width;
  final Color color;

  const S3BucketImageWidget({this.image, this.height, this.width,this.color});

  @override
  Widget build(BuildContext context) {
    print(image);
    //Image.network('https://musgreetphase1images184452-staging.s3.eu-west-2.amazonaws.com/public/public.png', );
    return Image.network(
      image,
      height: height,
      width: width,
      color: color!=null ? AppColors.black.withOpacity(0.5) : null,
    );
  }
}
