import 'package:flutter/material.dart';
import 'package:mus_greet/core/config/navigation.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/utils/routes.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';
import 'package:mus_greet/core/widgets/post_card_widget.dart';
import 'package:mus_greet/core/widgets/rounded_button_widget.dart';
import 'package:mus_greet/core/widgets/text_field_widget.dart';


class PostTab extends StatefulWidget {
  @override
  _PostTabState createState() => _PostTabState();
}

class _PostTabState extends State<PostTab> {

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _getTextField(),
          PostCardWidget(
            profileImage: ImageConstants.IC_HOME_USER1,
            name: AppTexts.TEMP_NAME1,
            isSponsored: false,
            timeAgo: AppTexts.TEMP_TIME_AGO_1,
            image: ImageConstants.IMG_POST1,
          ),
          PostCardWidget(
            profileImage: ImageConstants.IC_HOME_USER1,
            name: AppTexts.TEMP_NAME2,
            isSponsored: true,
            timeAgo: AppTexts.TEMP_TIME_AGO_2,
            image: ImageConstants.IMG_POST1,
          ),
          PostCardWidget(
            profileImage: ImageConstants.IC_HOME_USER1,
            name: AppTexts.TEMP_NAME1,
            isSponsored: false,
            timeAgo: AppTexts.TEMP_TIME_AGO_1,
            image: ImageConstants.IMG_POST1,
          ),
          PostCardWidget(
            profileImage: ImageConstants.IC_HOME_USER1,
            name: AppTexts.TEMP_NAME2,
            isSponsored: true,
            timeAgo: AppTexts.TEMP_TIME_AGO_2,
            image: ImageConstants.IMG_POST1,
          ),
        ],
      ),
    );
  }

  ///This will render text field for posting the thoughts to community
  _getTextField() {
    return Container(
      margin: EdgeInsets.only(top: 4),
      color: AppColors.white,
      height: 70,
      padding: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          AssetImageWidget(
            image: ImageConstants.IC_HOME_USER2,
            height: 60,
            width: 60,
          ),
          CustomSpacerWidget(
            width: 0,
          ),
          GestureDetector(
            onTap: (){
              Navigation.intent(context, AppRoutes.CREATE_POST_SCREEN);
            },//=> widget.callBack(),
            child: Container(
              padding: EdgeInsets.only(left: 15,right: 15,top: 8,bottom: 8),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.background_color),
                  borderRadius: BorderRadius.circular(30)
              ),
              child: Text(
                "Whats on your mind?                                                ",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: AppColors.black,
                ),
              ),
            ),
          ),
        //_getEditButton(),
        ],
      ),
    );
  }

  _getEditButton() {
    return RoundedButtonWidget(
      text: "Whats on your mind?",
      callBack: () {
        Navigation.intent(context, AppRoutes.CREATE_POST_SCREEN);
      },
    );
  }
}
