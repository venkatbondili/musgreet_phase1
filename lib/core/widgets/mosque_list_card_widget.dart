import 'package:flutter/material.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/widgets/action_button_widget.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';
import 'package:mus_greet/core/widgets/following_mosque_list_grid.dart';
import 'package:mus_greet/core/widgets/rounded_button_widget.dart';
import 'package:mus_greet/models/ModelProvider.dart';

import 'custom_spacer_widget.dart';

class MosqueListCardWidget extends StatefulWidget {
  final int index;
  final Mosque mosqueObject;

  const MosqueListCardWidget({Key key, this.index, this.mosqueObject}) : super(key: key);

  @override
  _MosqueListCardWidgetState createState() => _MosqueListCardWidgetState();
}

class _MosqueListCardWidgetState extends State<MosqueListCardWidget> {
  @override
  Widget build(BuildContext context) {
    //print(widget.mosqueObject);
    return Material(
      elevation: 2,
      shadowColor: AppColors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        padding: EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: AppColors.white),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _getMosqueDetails(),
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

  _getMosqueDetails() {
    return Row(
      children: [
        _getMosqueImage(),
        CustomSpacerWidget(
          width: 5,
        ),
        _getMosqueNameAndLocation(),
      ],
    );
  }

  _getMosqueImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: Image.asset(
        ImageConstants.IMG_MOSQUE,
        fit: BoxFit.cover,
        height: 70,
        width: 70,
      ),
    );
  }

  _getMosqueNameAndLocation() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          //AppTexts.MOSQUE_NAME,
          widget.mosqueObject.mosque_name,
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
              color: AppColors.black_50,
            ),
            CustomSpacerWidget(
              width: 4,
            ),
            Text(
             // AppTexts.MOSQUE_LOCATION,
              widget.mosqueObject.city,
              style: TextStyle(
                fontFamily: FontConstants.FONT,
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppColors.black_50,
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
            Container(
              height: 15,
              width: 15,
            ),
            CustomSpacerWidget(
              width: 4,
            ),
            Text(
              //AppTexts.SHIA_TEXT,
              widget.mosqueObject.sect,
              style: TextStyle(
                fontFamily: FontConstants.FONT,
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppColors.black_50,
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
      },
      text: widget.index==0 ? AppTexts.UNFOLLOW_TEXT :AppTexts.FOLLOW_TEXT,
      isFilled: widget.index==0 ? true : false,
    );
  }
}
