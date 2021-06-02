import 'package:flutter/material.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';
import 'package:mus_greet/core/widgets/following_mosque_list_grid.dart';
import 'package:mus_greet/core/widgets/send_request_dialog_widget.dart';

import 'asset_image_widget.dart';


class FriendSearchListWidget extends StatefulWidget {
  final int index;

  const FriendSearchListWidget({Key key, this.index}) : super(key: key);
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
            _getMemberDetails(),
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


  _getMemberDetails() {
    return Row(
      children: [
        _getMemberImage(),
        CustomSpacerWidget(
          width: 10,
        ),
        _getNameAndRelationShip(),
      ],
    );
  }

  _getMemberImage() {
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

  _getNameAndRelationShip() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppTexts.FRIEND_NAME,
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
              AppTexts.MOSQUE_LOCATION,
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
