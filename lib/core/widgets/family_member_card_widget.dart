import 'package:flutter/material.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';
import 'package:mus_greet/core/widgets/rounded_button_widget.dart';

class FamilyMemberCardWidget extends StatefulWidget {
  final String relationShip;
  final String name;
  final Function callBack;

  const FamilyMemberCardWidget({Key key, this.relationShip, this.name,this.callBack})
      : super(key: key);

  @override
  _FamilyMemberCardWidgetState createState() => _FamilyMemberCardWidgetState();
}

class _FamilyMemberCardWidgetState extends State<FamilyMemberCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: AppColors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _getMemberDetails(),
            _getRemoveButton(),
          ],
        ),
      ),
    );
  }

  _getMemberDetails(){
    return Row(
      children: [
        _getMemberImage(),
        CustomSpacerWidget(width: 15,),
        _getNameAndRelationShip(),
      ],
    );
  }

  _getMemberImage() {
    var image = _getImageAccordingToRelationShip();
    return Image.asset(
      image,
      height: 35,
      width: 35,
    );
  }

  _getNameAndRelationShip(){
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.name,
          style: TextStyle(
            fontFamily: FontConstants.FONT,
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
        ),
        CustomSpacerWidget(height: 0,),
        Text(
          widget.relationShip,
          style: TextStyle(
            fontFamily: FontConstants.FONT,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.vertical_divider,
          ),
        ),
      ],
    );
  }

  _getRemoveButton(){
    return RoundedButtonWidget(
      callBack: ()=> widget.callBack(),
      text: AppTexts.REMOVE,
    );
  }

  _getImageAccordingToRelationShip() {
    if (widget.relationShip == "Son") {
      return ImageConstants.FAMILY_SIX;
    } else if (widget.relationShip == "Daughter") {
      return ImageConstants.FAMILY_FIVE;
    } else if (widget.relationShip == "Sister") {
      return ImageConstants.FAMILY_FOUR;
    } else if (widget.relationShip == "Brother") {
      return ImageConstants.FAMILY_THREE;
    } else if (widget.relationShip == "Mother") {
      return ImageConstants.FAMILY_TWO;
    } else if (widget.relationShip == "Father") {
      return ImageConstants.FAMILY_ONE;
    }
  }


}
