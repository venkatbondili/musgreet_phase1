import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mus_greet/core/config/navigation.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/utils/routes.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';

class AboutTab extends StatefulWidget {
  @override
  _AboutTabState createState() => _AboutTabState();
}

class _AboutTabState extends State<AboutTab> {
  bool _isEducationExpanded = true;
  bool _isContactInfoExpanded = false;
  bool _isGeneralInfoExpanded = false;
  bool _isFaithInfoExpanded = false;
  bool _isFamilyInfoExpanded = false;
  bool _isPrivacyInfoExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 4),
      padding: EdgeInsets.all(20),
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getBioAndDottedBorder(),
          CustomSpacerWidget(
            height: 18,
          ),
          _isEducationExpanded
              ? _getEducationExpandedContainer()
              : _getEducationDetails(),
          CustomSpacerWidget(
            height: 10,
          ),
          _isContactInfoExpanded
              ? _getContactInfoExpandedContainer()
              : _getContactInfo(),
          CustomSpacerWidget(
            height: 10,
          ),
          _isGeneralInfoExpanded
              ? _getGeneralInfoExpandedContainer()
              : _getGeneralInfo(),
          CustomSpacerWidget(
            height: 10,
          ),
          _isFaithInfoExpanded
              ? _getFaithInfoExpandedContainer()
              : _getFaithInfo(),
          CustomSpacerWidget(
            height: 10,
          ),
          _isFamilyInfoExpanded
              ? _getFamilyInfoExpandedContainer()
              : _getFamilyMemberInfo(),
          CustomSpacerWidget(
            height: 10,
          ),
          _isPrivacyInfoExpanded
              ? _getPrivacyInfoExpandedContainer()
              : _getProfilePrivacyInfo(),
        ],
      ),
    );
  }

  _getBioAndDottedBorder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: Text(
            AppTexts.BIO,
            style: TextStyle(
              fontFamily: FontConstants.FONT,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.header_black,
            ),
          ),
        ),
        CustomSpacerWidget(
          height: 5,
        ),
        Container(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: Text(
            AppTexts.BIO_TEXT,
            style: TextStyle(
              fontFamily: FontConstants.FONT,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.header_black,
            ),
          ),
        ),
        CustomSpacerWidget(
          height: 30,
        ),
        Container(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: DottedLine(
            dashColor: AppColors.black_50,
          ),
        ),
      ],
    );
  }

  _getEducationDetails() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isEducationExpanded = !_isEducationExpanded;
        });
      },
      child: Container(
        padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppTexts.EDUCATION,
              style: TextStyle(
                fontFamily: FontConstants.FONT,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.header_black,
              ),
            ),
            _isEducationExpanded
                ? RotatedBox(
                    quarterTurns: 2,
                    child: _getArrowDownAndUp(_isEducationExpanded),
                  )
                : _getArrowDownAndUp(_isEducationExpanded),
          ],
        ),
      ),
    );
  }

  _navigateToEditEducationScreen({String route}) {
    if (route != null) {
      Navigation.intent(context, route);
    }
  }

  _getEditDetails({Function callBack}) {
    return GestureDetector(
      onTap: () => callBack(),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: AssetImageWidget(
          image: ImageConstants.IC_EDIT,
          height: 20,
          width: 20,
        ),
      ),
    );
  }

  _getArrowDownAndUp(bool isExpanded) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: AssetImageWidget(
        image: ImageConstants.IC_DOWN,
        height: 15,
        width: 15,
        color: isExpanded ? AppColors.black : null,
      ),
    );
  }

  _getEducationExpandedContainer() {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.comment_wall_color,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _getEducationDetails(),
          _getEducationInfo(
            institution: "London School Of Economics",
            dept: "BSC Computer Science",
            years: "2019-2021",
            editIcon: true,
          ),
          _getEducationInfo(
            institution: "Croydon Computer",
            dept: "HND computer",
            years: "2019-2021",
          ),
        ],
      ),
    );
  }

  _getEducationInfo(
      {String institution, String dept, String years, bool editIcon = false}) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 25, right: 25, top: 8, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  institution,
                  style: TextStyle(
                      fontFamily: FontConstants.FONT,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black),
                ),
                CustomSpacerWidget(
                  height: 2,
                ),
                Text(
                  dept,
                  style: TextStyle(
                      fontFamily: FontConstants.FONT,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black),
                ),
                CustomSpacerWidget(
                  height: 2,
                ),
                Text(
                  years,
                  style: TextStyle(
                    fontFamily: FontConstants.FONT,
                    fontSize: 10,
                    color: AppColors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          editIcon
              ? _getEditDetails(
                  callBack: (){
                    _navigateToEditEducationScreen(
                      route: AppRoutes.ADD_EDUCATION,
                    );
                  }
                )
              : Container(),
        ],
      ),
    );
  }

  _getContactInfo() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isContactInfoExpanded = !_isContactInfoExpanded;
        });
      },
      child: Container(
        padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppTexts.CONTACT_INFORMATION,
              style: TextStyle(
                fontFamily: FontConstants.FONT,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.header_black,
              ),
            ),
            _isContactInfoExpanded
                ? RotatedBox(
                    quarterTurns: 2,
                    child: _getArrowDownAndUp(_isContactInfoExpanded),
                  )
                : _getArrowDownAndUp(_isContactInfoExpanded),
          ],
        ),
      ),
    );
  }

  _getGeneralInfo() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isGeneralInfoExpanded = !_isGeneralInfoExpanded;
        });
      },
      child: Container(
        padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppTexts.GENERAL_INFORMATION,
              style: TextStyle(
                fontFamily: FontConstants.FONT,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.header_black,
              ),
            ),
            _isGeneralInfoExpanded
                ? RotatedBox(
                    quarterTurns: 2,
                    child: _getArrowDownAndUp(_isGeneralInfoExpanded),
                  )
                : _getArrowDownAndUp(_isGeneralInfoExpanded),
          ],
        ),
      ),
    );
  }

  _getContactInfoExpandedContainer() {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.comment_wall_color,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getContactInfo(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _getContactInfoData(
                      contactType: AppTexts.EMAIL,
                      details: 'muhammadiqbal.uiux@gmail.com'),
                  _getContactInfoData(
                      contactType: AppTexts.PHONE,
                      details: '+44 07538 211 456'),
                ],
              ),
              _isContactInfoExpanded
                  ? Padding(
                      padding: EdgeInsets.only(right: 25, top: 15),
                      child: _getEditDetails(
                          callBack: _navigateToEditEducationScreen),
                    )
                  : Container(),
            ],
          ),
        ],
      ),
    );
  }

  _getContactInfoData({
    String contactType,
    String details,
  }) {
    return Container(
      padding: EdgeInsets.only(left: 25, right: 25, top: 8, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            contactType,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.black_50,
              fontFamily: FontConstants.FONT,
            ),
          ),
          Text(
            details,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                fontFamily: FontConstants.FONT,
                color: AppColors.header_black),
          ),
        ],
      ),
    );
  }

  _getGeneralInfoExpandedContainer() {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.comment_wall_color,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getGeneralInfo(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _getContactInfoData(
                      contactType: AppTexts.JOINED_MUSGREET,
                      details: 'March 2021'),
                  _getContactInfoData(
                      contactType: AppTexts.GENDAR, details: 'Male'),
                  _getContactInfoData(contactType: AppTexts.AGE, details: '27'),
                  _getContactInfoData(
                      contactType: AppTexts.RELATION_SHIP, details: 'Single'),
                  _getContactInfoData(
                      contactType: AppTexts.LANGUAGE_SPOKEN,
                      details: 'English • Arabic • French'),
                  _getContactInfoData(
                      contactType: AppTexts.ADDRESS,
                      details: 'SE1 2RE, London, UK'),
                ],
              ),
              _isGeneralInfoExpanded
                  ? Padding(
                      padding: EdgeInsets.only(right: 25, top: 15),
                      child: _getEditDetails(
                          callBack: _navigateToEditEducationScreen),
                    )
                  : Container(),
            ],
          ),
        ],
      ),
    );
  }

  _getFaithInfo() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isFaithInfoExpanded = !_isFaithInfoExpanded;
        });
      },
      child: Container(
        padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppTexts.FAITH,
              style: TextStyle(
                fontFamily: FontConstants.FONT,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.header_black,
              ),
            ),
            _isFaithInfoExpanded
                ? RotatedBox(
                    quarterTurns: 2,
                    child: _getArrowDownAndUp(_isFaithInfoExpanded),
                  )
                : _getArrowDownAndUp(_isFaithInfoExpanded),
          ],
        ),
      ),
    );
  }

  _getFaithInfoExpandedContainer() {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.comment_wall_color,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getFaithInfo(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _getContactInfoData(
                      contactType: AppTexts.SECT, details: 'Shia'),
                  _getContactInfoData(
                      contactType: AppTexts.ARE_YOU_A_REVERT, details: 'Yes'),
                  _getContactInfoData(
                      contactType: AppTexts.INTERESTED_IN_ISLAM,
                      details: 'Yes'),
                ],
              ),
              _isFaithInfoExpanded
                  ? Padding(
                      padding: EdgeInsets.only(right: 25, top: 15),
                      child: _getEditDetails(
                          callBack: _navigateToEditEducationScreen),
                    )
                  : Container(),
            ],
          ),
        ],
      ),
    );
  }

  _getFamilyMemberInfo() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isFamilyInfoExpanded = !_isFamilyInfoExpanded;
        });
      },
      child: Container(
        padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppTexts.FAMILY_MEMBERS,
              style: TextStyle(
                fontFamily: FontConstants.FONT,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.header_black,
              ),
            ),
            _isFamilyInfoExpanded
                ? RotatedBox(
                    quarterTurns: 2,
                    child: _getArrowDownAndUp(_isFamilyInfoExpanded),
                  )
                : _getArrowDownAndUp(_isFamilyInfoExpanded),
          ],
        ),
      ),
    );
  }

  _getFamilyInfoExpandedContainer() {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.comment_wall_color,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getFamilyMemberInfo(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomSpacerWidget(
                    height: 10,
                  ),
                  _getMemberDetails(
                      name: "Ali Akbar Khan", relationShip: "Father"),
                  CustomSpacerWidget(
                    height: 10,
                  ),
                  _getMemberDetails(
                      name: "Asifa Ansari", relationShip: "Mother"),
                  CustomSpacerWidget(
                    height: 10,
                  ),
                ],
              ),
              _isFamilyInfoExpanded
                  ? Padding(
                      padding: EdgeInsets.only(right: 25, top: 15),
                      child: _getEditDetails(
                          callBack: (){
                            _navigateToEditEducationScreen(route: AppRoutes.MY_FAMILY);
                          }),
                    )
                  : Container(),
            ],
          ),
        ],
      ),
    );
  }

  _getMemberDetails({String name, String relationShip}) {
    return Container(
      padding: EdgeInsets.only(left: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _getMemberImage(relationShip: relationShip),
          CustomSpacerWidget(
            width: 15,
          ),
          _getNameAndRelationShip(name: name, relationShip: relationShip),
        ],
      ),
    );
  }

  _getMemberImage({String relationShip}) {
    var image = _getImageAccordingToRelationShip(relationShip: relationShip);
    return Image.asset(
      image,
      height: 35,
      width: 35,
    );
  }

  _getNameAndRelationShip({String name, String relationShip}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: TextStyle(
            fontFamily: FontConstants.FONT,
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
        ),
        CustomSpacerWidget(
          height: 0,
        ),
        Text(
          relationShip,
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

  _getProfilePrivacyInfo() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isPrivacyInfoExpanded = !_isPrivacyInfoExpanded;
        });
      },
      child: Container(
        padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppTexts.PROFILE_POLICY,
              style: TextStyle(
                fontFamily: FontConstants.FONT,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.header_black,
              ),
            ),
            _isPrivacyInfoExpanded
                ? RotatedBox(
                    quarterTurns: 2,
                    child: _getArrowDownAndUp(_isPrivacyInfoExpanded),
                  )
                : _getArrowDownAndUp(_isPrivacyInfoExpanded),
          ],
        ),
      ),
    );
  }

  _getPrivacyInfoExpandedContainer() {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.comment_wall_color,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getProfilePrivacyInfo(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _getContactInfoData(
                    contactType: AppTexts.PROFILE_VIEW,
                    details: 'Public',
                  ),
                ],
              ),
              _isFaithInfoExpanded
                  ? Padding(
                      padding: EdgeInsets.only(right: 25, top: 15),
                      child: _getEditDetails(
                          callBack: _navigateToEditEducationScreen),
                    )
                  : Container(),
            ],
          ),
        ],
      ),
    );
  }

  _getImageAccordingToRelationShip({String relationShip}) {
    if (relationShip == "Son") {
      return ImageConstants.FAMILY_SIX;
    } else if (relationShip == "Daughter") {
      return ImageConstants.FAMILY_FIVE;
    } else if (relationShip == "Sister") {
      return ImageConstants.FAMILY_FOUR;
    } else if (relationShip == "Brother") {
      return ImageConstants.FAMILY_THREE;
    } else if (relationShip == "Mother") {
      return ImageConstants.FAMILY_TWO;
    } else if (relationShip == "Father") {
      return ImageConstants.FAMILY_ONE;
    }
  }
}
