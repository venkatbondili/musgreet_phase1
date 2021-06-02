import 'package:flutter/material.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';

import 'custom_spacer_widget.dart';


class SponsoredWidget extends StatefulWidget {
  @override
  _SponsoredWidgetState createState() => _SponsoredWidgetState();
}

class _SponsoredWidgetState extends State<SponsoredWidget> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(top: 4,),
      width: MediaQuery.of(context).size.width,
      color: AppColors.white,
      child: Column(
        children: [
          _getHeader(),
          _getImageSection(),
        ],
      ),
    );
  }

  ///This is the header section, It will return user details with profile image
  _getHeader() {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 20, top: 5, bottom: 5),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _getProfileImage(),
          CustomSpacerWidget(
            width: 5,
          ),
          _getUserDetails(),
        ],
      ),
    );
  }

  /// This will return profile image.
  _getProfileImage() {
    return AssetImageWidget(
      image: ImageConstants.IC_ROLEX_LOGO,
      height: 60,
      width: 60,
    );
  }

  /// This will return User details like name and time of submission
  _getUserDetails() {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Rolexwatches.com",
            style: TextStyle(
              fontFamily: FontConstants.FONT,
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
          CustomSpacerWidget(
            height: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                AppTexts.TEMP_TIME_AGO_2,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.normal,
                  color: AppColors.black.withOpacity(.6),
                ),
              ),
              CustomSpacerWidget(
                width: 20,
              ),
              Container(
                padding: EdgeInsets.only(
                    top: 3, left: 10, right: 10, bottom: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.GREY_KIND,
                ),
                alignment: Alignment.center,
                child: Text(
                  AppTexts.SPONSORED_TEXT,
                  style: TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.normal,
                    color: AppColors.green,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }


  _getImageSection() {
    return Image.asset(
     ImageConstants.IMG_ROLEX,
      height: 100,
      width: double.infinity,
      fit: BoxFit.fitWidth,
    );
  }
}
