import 'package:flutter/material.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';
import 'package:mus_greet/core/widgets/following_mosque_list_grid.dart';
import 'package:mus_greet/core/widgets/s3_bucket_image_widget.dart';
import 'package:mus_greet/core/widgets/send_request_dialog_widget.dart';
import 'package:mus_greet/models/ModelProvider.dart';

import 'asset_image_widget.dart';


class FriendSearchListWidget extends StatefulWidget {
  final int index;
  final Users UserObject;

  const FriendSearchListWidget({Key key, this.index, this.UserObject}) : super(key: key);
  @override
  _FriendSearchListWidgetState createState() => _FriendSearchListWidgetState();
}

class _FriendSearchListWidgetState extends State<FriendSearchListWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      shadowColor: AppColors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        padding: EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: AppColors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _getUserDetails(),
            CustomSpacerWidget(
              width: 5,
            ),
            Flexible(
              child: _getRemoveButton(),
            ),
          ],
        ),
      ),
    );
  }


  _getUserDetails() {
    return Row(
      children: [
        _getUserImage(),
        CustomSpacerWidget(
          width: 10,
        ),
        _getNameAndLocation(),
      ],
    );
  }

  ///method to get profile image from s3 bucket
  _getUserImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: S3BucketImageWidget(
        image: "https://musgreetphase1images184452-staging.s3.eu-west-2.amazonaws.com/public/public.png",
        height: 70,
        width: 70,
        //fit: BoxFit.cover,
      ),
        //Image.network(widget.UserObject.User_Photos[0].photo_path),
    );
  }

  /// old function to get profile image from assets folder
  getUserImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: Image.asset(
        ImageConstants.IMG_POST_2,
        fit: BoxFit.cover,
        height: 70,
        width: 70,
      ),
    );
  }

  _getNameAndLocation() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.UserObject.first_name + " " + widget.UserObject.last_name,
          //AppTexts.FRIEND_NAME,
          style: TextStyle(
            fontFamily: FontConstants.FONT,
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
        ),
        CustomSpacerWidget(
          height: 4,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AssetImageWidget(
              image: ImageConstants.TEMP_LOCATION,
              height: 15,
              width: 15,
              color: AppColors.vertical_divider,
            ),
            CustomSpacerWidget(
              width: 4,
            ),
            Text(
              widget.UserObject.city +" , "+ widget.UserObject.country,
              //AppTexts.MOSQUE_LOCATION,
              style: TextStyle(
                fontFamily: FontConstants.FONT,
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppColors.vertical_divider,
              ),
            )
          ],
        ),
        CustomSpacerWidget(
          height: 4,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              AppTexts.DISTANCE,
              style: TextStyle(
                fontFamily: FontConstants.FONT,
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppColors.vertical_divider,
              ),
            )
          ],
        ),
      ],
    );
  }

  _getRemoveButton() {
    return MosqueFollowButton(
      radius: 30,
      callBack: () {
        print("Handle CallBack");
        _handleSearch();
      },
      text: widget.index==0 ? AppTexts.REQUEST_SENT_TEXT :AppTexts.ADD_FRIEND_TEXT,
      isFilled: widget.index==0 ? true : false,
    );
  }

  _handleSearch() {
    print("Handle Search!!");
    showDialog(context: context, builder: (context){
      return SendRequestDialogWidget();
    });
  }
}
