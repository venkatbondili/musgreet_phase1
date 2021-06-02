import 'package:flutter/material.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';


class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: EdgeInsets.only(top: 20,bottom: 20),
        alignment: Alignment.topCenter,
        color: AppColors.green,
        child: ListView(
          children: [
            _getUserProfile(),
            CustomSpacerWidget(height: 30,),
            _getDivider(),
            GestureDetector(
              onTap: (){
                ///Handle navigation from drawer
              },
              child: _getContainerWithIconAndText(icon: ImageConstants.IC_HOME, text: "Home"),
            ),
            _getDivider(),
            GestureDetector(
              onTap: (){
                ///Handle navigation from drawer
              },
              child: _getContainerWithIconAndText(icon: ImageConstants.IC_HOME, text: "Home"),
            ),
            _getDivider(),
            GestureDetector(
              onTap: (){
                ///Handle navigation from drawer
              },
              child: _getContainerWithIconAndText(icon: ImageConstants.IC_HOME, text: "Home"),
            ),
            _getDivider(),
            GestureDetector(
              onTap: (){
                ///Handle navigation from drawer
              },
              child: _getContainerWithIconAndText(icon: ImageConstants.IC_HOME, text: "Home"),
            ),
            _getDivider(),
            GestureDetector(
              onTap: (){
                ///Handle navigation from drawer
              },
              child: _getContainerWithIconAndText(icon: ImageConstants.IC_HOME, text: "Home"),
            ),
            _getDivider(),
            GestureDetector(
              onTap: (){
                ///Handle navigation from drawer
              },
              child: _getContainerWithIconAndText(icon: ImageConstants.IC_HOME, text: "Home"),
            ),
            _getDivider(),
            GestureDetector(
              onTap: (){
                ///Handle navigation from drawer
              },
              child: _getContainerWithIconAndText(icon: ImageConstants.IC_HOME, text: "Home"),
            ),
            _getDivider(),
            GestureDetector(
              onTap: (){
                ///Handle navigation from drawer
              },
              child: _getContainerWithIconAndText(icon: ImageConstants.IC_HOME, text: "Home"),
            ),

          ],
        )
      ),
    );
  }

  _getUserProfile(){
    return CircleAvatar(
      radius: 60,
      backgroundImage: AssetImage(ImageConstants.IMG_POST_2,),
      backgroundColor: AppColors.white,
    );
  }

  _getDivider(){
    return Divider(
      height: 10,
      color: AppColors.light_grey,
      thickness: 1,
    );
  }

  _getContainerWithIconAndText({String icon, String text}){
    return Container(
      height: 50,
      padding: EdgeInsets.only(left: 40),
      width: double.infinity,
      alignment: Alignment.centerLeft,
      child:Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _getIcon(icon: icon),
          CustomSpacerWidget(
            width: 40,
          ),
          _getText(text: text),
        ],
      ),
    );
  }

  _getIcon({String icon}){
    return AssetImageWidget(
      image: icon,
      height: 25,
      width: 25,
    );
  }

  _getText({String text}){
    return Text(
      text,
      style: TextStyle(
        fontFamily: FontConstants.FONT,
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColors.white,
      ),
    );
  }
}
