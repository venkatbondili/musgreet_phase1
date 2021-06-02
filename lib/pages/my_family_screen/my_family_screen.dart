import 'package:flutter/material.dart';
import 'package:mus_greet/core/config/navigation.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/widgets/action_button_widget.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';
import 'package:mus_greet/core/widgets/drop_down_text_field.dart';
import 'package:mus_greet/core/widgets/family_member_card_widget.dart';
import 'package:mus_greet/core/widgets/my_family_text_field_heading_widget.dart';

class MyFamilyScreen extends StatefulWidget {
  @override
  _MyFamilyScreenState createState() => _MyFamilyScreenState();
}

class _MyFamilyScreenState extends State<MyFamilyScreen> {
  final TextEditingController _controller = TextEditingController();
  var _relationShip;

  final List<RelationShipData> members = List.empty(growable: true);

  @override
  void initState() {
    members.add(RelationShipData(name: "Ali Akbar Khan",relationShip: "Father"),);
    members.add(RelationShipData(name: "Asifa Ansari",relationShip: "Mother"),);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: _getBody(),
      ),
    );
  }

  _getBody() {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 30),
        child: Column(
          children: [
            _getHeaderAndBack(),
            CustomSpacerWidget(
              height: 30,
            ),
            _getFamilyIcons(),
            CustomSpacerWidget(
              height: 40,
            ),
            _getFamilyMemberRelationShip(),
            CustomSpacerWidget(
              height: 15,
            ),
            _getNameOfMember(),
            CustomSpacerWidget(
              height: 40,
            ),
            _getAddButton(),
            CustomSpacerWidget(
              height: 40,
            ),
            members.length >= 0
                ? ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return FamilyMemberCardWidget(
                        callBack: () {
                          members.removeAt(index);
                          setState(() {});
                        },
                        relationShip: members[index].relationShip,
                        name: members[index].name,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return CustomSpacerWidget(
                        height: 20,
                      );
                    },
                    itemCount: members.length,
                  )
                : Container(),
            CustomSpacerWidget(
              height: 100,
            ),
            _getSaveButton(),
          ],
        ),
      ),
    );
  }

  _getHeaderAndBack() {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          height: 50,
          child: Text(
            AppTexts.MY_FAMILY,
            style: TextStyle(
              fontFamily: FontConstants.FONT,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
        ),
        Positioned(
          left: 0,
          top: 17,
          child: GestureDetector(
            onTap: () {
              Navigation.back(context);
            },
            child: AssetImageWidget(
              image: ImageConstants.IC_BACK,
              height: 15,
              width: 25,
            ),
          ),
        ),
      ],
    );
  }

  _getFamilyIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _getIcons(ImageConstants.FAMILY_ONE),
        _getIcons(ImageConstants.FAMILY_TWO),
        _getIcons(ImageConstants.FAMILY_THREE),
        _getIcons(ImageConstants.FAMILY_FOUR),
        _getIcons(ImageConstants.FAMILY_FIVE),
        _getIcons(ImageConstants.FAMILY_SIX),
      ],
    );
  }

  _getFamilyMemberRelationShip() {
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5),
      child: DropDownTextField(
        fieldName: AppTexts.ADD_A_FAMILY_MEMBER,
        data: AppTexts.FAMILY_CATEGORIES,
        callBack: (val) {
          print(val);
          setState(() {
            _relationShip = val;
          });
        },
      ),
    );
  }

  _getNameOfMember() {
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5),
      child: MyFamilyTextFieldHeadingWidget(
        fieldName: AppTexts.FAMILY_MEMBER_NAME,
        controller: _controller,
        hintText: AppTexts.WRITE_NAME,
      ),
    );
  }

  _getAddButton() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () => _handleOnTap(),
          child: Image.asset(
            ImageConstants.IC_CREATE,
            height: 40,
            width: 40,
          ),
        ),
        CustomSpacerWidget(
          height: 5,
        ),
        Text(
          AppTexts.ADD,
          style: TextStyle(
            fontFamily: FontConstants.FONT,
            fontSize: 12,
            fontWeight: FontWeight.w800,
            color: AppColors.vertical_divider,
          ),
        )
      ],
    );
  }

  _getSaveButton() {
    return Row(
      children: [
        Expanded(
          child: ActionButtonWidget(
            callBack: () {},
            text: AppTexts.SAVE,
            isFilled: true,
          ),
        ),
      ],
    );
  }

  _handleOnTap() {
    print("Hello");
    if (_controller.text.isNotEmpty && _relationShip != null) {
      final data =
          RelationShipData(name: _controller.text, relationShip: _relationShip);
      members.add(data);
      setState(() {});
    }
  }

  _getIcons(String image) {
    return Image.asset(
      image,
      height: 35,
      width: 35,
    );
  }
}

class RelationShipData {
  final String name;
  final String relationShip;

  RelationShipData({this.name, this.relationShip});
}
