import 'package:flutter/material.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';


class SocialMediaButtonWidget extends StatefulWidget {
  final String socialMediaIcon;
  final Function callBack;

  const SocialMediaButtonWidget({Key key, this.socialMediaIcon,this.callBack}) : super(key: key);
  @override
  _SocialMediaButtonWidgetState createState() => _SocialMediaButtonWidgetState();
}

class _SocialMediaButtonWidgetState extends State<SocialMediaButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> widget.callBack,
      child: Container(
        child: AssetImageWidget(
          image: widget.socialMediaIcon,
          height: 60,
          width: 60,
        ),
      ),
    );
  }
}
