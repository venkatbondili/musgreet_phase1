import 'package:flutter/material.dart';
import 'package:mus_greet/core/config/navigation.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/utils/routes.dart';
import 'package:mus_greet/core/widgets/action_button_widget.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';

class FollowingMosqueGrid extends StatefulWidget {
  final Function callBack;

  const FollowingMosqueGrid({Key key, this.callBack}) : super(key: key);
  @override
  _FollowingMosqueGridState createState() => _FollowingMosqueGridState();
}

class _FollowingMosqueGridState extends State<FollowingMosqueGrid> {
  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: (){
        widget.callBack();
      },
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          padding: EdgeInsets.all(6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _getMosqueImage(),
              CustomSpacerWidget(
                height: 10,
              ),
              Flexible(
                child: _getNameOfMosque(),
              ),
              CustomSpacerWidget(
                height: 5,
              ),
              _getMosqueLocation(),
              _getMosqueReligion(),
            ],
          ),
        ),
      ),
    );
  }

  _getMosqueImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        height: 140,
        width: double.infinity,
        child: Image.asset(
          ImageConstants.IMG_MOSQUE,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  _getNameOfMosque() {
    return Text(
      AppTexts.MOSQUE_NAME,
      maxLines: 1,
      overflow: TextOverflow.clip,
      style: TextStyle(
        fontFamily: FontConstants.FONT,
        fontSize: 11,
        fontWeight: FontWeight.w700,
        color: AppColors.black,
      ),
    );
  }

  _getMosqueLocation() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AssetImageWidget(
          image: ImageConstants.TEMP_LOCATION,
          height: 13,
          width: 13,
          color: AppColors.vertical_divider,
        ),
        CustomSpacerWidget(
          width: 4,
        ),
        Text(
          AppTexts.MOSQUE_LOCATION,
          style: TextStyle(
            fontFamily: FontConstants.FONT,
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.vertical_divider,
          ),
        )
      ],
    );
  }

  _getMosqueReligion() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 13,
          width: 13,
        ),
        CustomSpacerWidget(
          width: 4,
        ),
        Text(
          AppTexts.SHIA_TEXT,
          style: TextStyle(
            fontFamily: FontConstants.FONT,
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: AppColors.vertical_divider,
          ),
        ),
        Expanded(
          child: CustomSpacerWidget(
            width: 4,
          ),
        ),
        _getRemoveButton(),
      ],
    );
  }

  _getRemoveButton() {
    return MosqueFollowButton(
      radius: 30,
      callBack: () {
        print("Handle CallBack");
      },
      text: AppTexts.UNFOLLOW_TEXT,
      isFilled: true,
    );
  }
}



class MosqueFollowButton extends StatefulWidget {
  final Function callBack;
  final String text;
  final bool isFilled;
  final double radius;

  MosqueFollowButton({ this.callBack, this.text, this.isFilled=false,this.radius=8}) ;

  @override
  _ActionButtonWidgetState createState() => _ActionButtonWidgetState();
}

class _ActionButtonWidgetState extends State<MosqueFollowButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> widget.callBack(),
      child: Container(
        padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.background_color),
          borderRadius: BorderRadius.circular(widget.radius),
          color: widget.isFilled ? AppColors.background_color : null,
        ),
        child: Text(
          widget.text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            fontFamily: FontConstants.FONT,
            color: widget.isFilled? AppColors.white : AppColors.background_color,
          ),
        ),
      ),
    );
  }
}
