import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mus_greet/core/config/navigation.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/utils/routes.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';
import 'package:mus_greet/models/UserEducation.dart';
import 'package:mus_greet/models/UserFamily.dart';
import 'package:mus_greet/models/UserProfile.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:mus_greet/models/Users.dart';

class AboutTab extends StatefulWidget {
  List<UserProfile> userProfile;
  AboutTab({this.userProfile});
  @override
  _AboutTabState createState() => _AboutTabState();
}

class _AboutTabState extends State<AboutTab> {
  //List<UserProfile> userProfile;
  List<Users> user;
  List<UserFamily> userFamily;
  List<String> name=[];
  List<String> relationship=[];
  List<String> listOfLanguages;
  List<UserEducation> userEducation;
  bool _isBioExpanded =false;
   bool _isEducationExpanded = true;
  bool _isContactInfoExpanded = false;
  bool _isGeneralInfoExpanded = false;
  bool _isFaithInfoExpanded = false;
  bool _isFamilyInfoExpanded = false;
  bool _isPrivacyInfoExpanded = false;
  String userid="315eca04-ab0d-46f7-b063-d8707d607a18";
  Map<String,String> FAMILY_MEMBER={};

  @override
  Widget build(BuildContext context) {
    //userList();
    return FutureBuilder<List<Users>>(
      future: userList(),
      builder: (ctx, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            user = snapshot.data;
            return buildFamilyList(user);
          default:
            return _buildLoadingScreen();
        }
      }
    );
  }

  buildFamilyList(List<Users> user)
  {
    //userFamilyList();
    return FutureBuilder<List<UserFamily>>(
      future: userFamilyList(),
      builder: (ctx, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            userFamily = snapshot.data;
            return buildEducation(userFamily,user);
          default:
            return _buildLoadingScreen();
        }
      },
    );
  }


  buildEducation(List<UserFamily> userFamily, List<Users> user)
  {
    //education();
    return FutureBuilder<List<UserEducation>>(
      future: education(),
      builder: (ctx, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            userEducation = snapshot.data;
            return buildAbout(userFamily,user,userEducation);
          default:
            return _buildLoadingScreen();
        }
      },
    );
  }


  buildAbout(List<UserFamily> userFamily, List<Users> user, List<UserEducation> userEducation)
  {
    bool status = false;
    gettingLanguages();
    if(userFamily.isNotEmpty && user.isNotEmpty && userEducation.isNotEmpty){
      status = true;
    }//
    return status ? Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 4),
      padding: EdgeInsets.all(20),
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _isBioExpanded?
          _getBioAndDottedBorderContainer()
              :_getBioAndDottedBorderInfo(),
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
    ): Container();
  }


  _getBioAndDottedBorder1() {
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
            widget.userProfile[0].bio,
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

  _getBioAndDottedBorderInfo() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isBioExpanded = !_isBioExpanded;
        });
      },
      child: Container(
        padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppTexts.BIO,
              style: TextStyle(
                fontFamily: FontConstants.FONT,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.header_black,
              ),
            ),

            _isBioExpanded
                ? RotatedBox(
              quarterTurns: 2,
              child: _getArrowDownAndUp(_isBioExpanded),
            )
                : _getArrowDownAndUp(_isBioExpanded),
          ],
        ),
      ),
    );
  }

  _getBioAndDottedBorderContainer() {
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
          _getBioAndDottedBorderInfo(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        children:[
                          _getContactInfoData(
                              contactType: "", details: widget.userProfile[0].bio),
                        ]
                    ),
                  ]
              ),
              _isBioExpanded
                  ? Padding(
                padding: EdgeInsets.only(right: 25, top: 15),
                //_getLockDetails(),
                child: _getEditDetails(callBack: (){
                  _navigateToEditEducationScreen(route: AppRoutes.BIO);
                }),
              )
                  : Container(),
            ],

          ),
        ],
      ),
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

  _getIconDetails()
  {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: AssetImageWidget(
          image: ImageConstants.IC_EYE,
          height: 20,
          width: 20,
        ),
      ),
    );
  }

  _getLockDetails()
  {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: AssetImageWidget(
          image: ImageConstants.IC_LOCK,
          height: 20,
          width: 20,
        ),
      ),
    );
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
          for(int i=0;i<userEducation.length ;i++)
            if(userid ==userEducation[i].usersID)
          _getEducationInfo(
            institution: userEducation[i].institution,
            dept: userEducation[i].course,
            years: "2019-2021",
            editIcon: true,
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
                  Row(
                    children:[
                  _getContactInfoData(
                      contactType: AppTexts.EMAIL,
                      details: user[0].email),
                    ]
                  ),
                ]
              ),
              _isContactInfoExpanded
                  ? Padding(
                padding: EdgeInsets.only(right: 25, top: 15),
                child: _getLockDetails(),
              )
                  : Container(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        children:[
                          _getContactInfoData(
                              contactType: AppTexts.PHONE,
                              details: user[0].phone),
                        ]
                    ),
                  ]
              ),
              GestureDetector(
                child: Padding(
                  padding: EdgeInsets.only(left:210, top: 20),
                  child: AssetImageWidget(
                    image: ImageConstants.IC_EYE,
                    height: 20,
                    width: 20,
                  ),
                ),
              ),
              _isContactInfoExpanded
                  ? Padding(
                padding: EdgeInsets.only(right: 25, top: 15),
                child:
                _getEditDetails( callBack: (){
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
                  Row (
                    children: [
                  _getContactInfoData(
                      contactType: AppTexts.JOINED_MUSGREET,
                      details: 'March 2021'),
                        ]
                     ),
                    ]
                   ),
                  _isGeneralInfoExpanded
                      ? Padding(
                    padding: EdgeInsets.only(right: 25, top: 15),
                    child: _getLockDetails(),
                  )
                      : Container(),
                  ],
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row (
                          children: [
                            _getContactInfoData(
                                contactType: AppTexts.GENDAR, details: 'Male'),
                          ]
                      ),
                    ]
                ),
                _isGeneralInfoExpanded
                    ? Padding(
                  padding: EdgeInsets.only(right: 25, top: 15),
                  child: _getLockDetails(),
                )
                    : Container(),
              ]
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row (
                          children: [
                            _getContactInfoData(
                                contactType: AppTexts.AGE,
                                details: "27"),
                          ]
                      ),
                    ]
                ),
                _isGeneralInfoExpanded
                    ? Padding(
                  padding: EdgeInsets.only(right: 25, top: 15),
                  child: _getLockDetails(),
                )
                    : Container(),
              ]
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row (
                          children: [
                            _getContactInfoData(
                                contactType: AppTexts.RELATION_SHIP,
                                details: "27"),
                          ]
                      ),
                    ]
                ),
                _isGeneralInfoExpanded
                    ? Padding(
                  padding: EdgeInsets.only(right: 25, top: 15),
                  child: _getEditDetails(),
                )
                    : Container(),
              ]
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row (
                          children: [
                            _getContactInfoData(
                                contactType: AppTexts.LANGUAGE_SPOKEN,
                                details: listOfLanguages.join('.')),
                          ]
                      ),
                    ]
                ),
                _isGeneralInfoExpanded
                    ? Padding(
                  padding: EdgeInsets.only(right: 25, top: 15),
                  child: _getEditDetails(callBack: (){
                    _navigateToEditEducationScreen(route: AppRoutes.LANGUAGES_SCREEN);
                  }),
                )
                    : Container(),
              ]
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row (
                          children: [
                            _getContactInfoData(
                                contactType: AppTexts.ADDRESS,
                                details: "27"),
                          ]
                      ),
                    ]
                ),
                _isGeneralInfoExpanded
                    ? Padding(
                  padding: EdgeInsets.only(right: 25, top: 15),
                  child: _getLockDetails(),
                )
                    : Container(),
              ]
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
                    Row(
                        children:[
                          _getContactInfoData(
                              contactType: AppTexts.SECT, details: widget.userProfile[0].sect),
                        ]
                    ),
                  ]
              ),
              GestureDetector(
                child: Padding(
                  padding: EdgeInsets.only(left:210, top: 20),
                  child: AssetImageWidget(
                    image: ImageConstants.IC_EYE,
                    height: 20,
                    width: 20,
                  ),
                ),
              ),
              _isFaithInfoExpanded
                  ? Padding(
                padding: EdgeInsets.only(right: 25, top: 15),
                child: _getLockDetails(),
              )
                  : Container(),

            ],

          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        children:[
                          _getContactInfoData(
                              contactType: AppTexts.ARE_YOU_A_REVERT, details: widget.userProfile[0].are_you_revert.toString()),
                        ]
                    ),
                  ]
              ),
              _isFaithInfoExpanded
                  ? Padding(
                padding: EdgeInsets.only(right: 25, top: 15),
                child: _getLockDetails(),
              )
                  : Container(),

            ],

          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        children:[
                          _getContactInfoData(
                              contactType: AppTexts.INTERESTED_IN_ISLAM,
                              details: widget.userProfile[0].islam_interest.toString()),
                        ]
                    ),
                  ]
              ),
              _isFaithInfoExpanded
                  ? Padding(
                padding: EdgeInsets.only(right: 25, top: 15),
                child: _getEditDetails(callBack: (){
                  _navigatetoIslamScreen();
                }),
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
                  for(int i=0;i<FAMILY_MEMBER.length;i++)
                  _getMemberDetails(
                      name: FAMILY_MEMBER.keys.elementAt(i), relationShip: FAMILY_MEMBER.values.elementAt(i)),
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
                    Row(
                        children:[
                          _getContactInfoData(
                              contactType: AppTexts.PROFILE_VIEW, details: widget.userProfile[0].profile_privacy),
                        ]
                    ),
                  ]
              ),
              _isPrivacyInfoExpanded
                  ? Padding(
                padding: EdgeInsets.only(right: 25, top: 15),
                child: _getEditDetails(callBack: (){
                  _navigateToEditEducationScreen(route: AppRoutes.PROFILE_PRIVACY);
                }),
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

  gettingLanguages() {
    try {
      //userProfile = await Amplify.DataStore.query(UserProfile.classType,where: UserProfile.ID.eq("0263d01c-1250-4541-826d-8d63f96cf8c0"));
      String language=widget.userProfile[0].languages_spoken;
      var splitting= language.split(",");
      listOfLanguages=splitting;
      print(listOfLanguages);
      print(widget.userProfile);
      print("inside the user profile");
    }catch(e)
    {
      print("Could not query DataStore: " + e);
    }
  }

  Future<List<Users>> userList() async{

    try {
      user= await Amplify.DataStore.query(Users.classType,where: Users.ID.eq(userid));
      print(user);
      print("inside the user");
      return user;
    }catch(e)
    {
      print("Could not query DataStore: " + e);
    }
  }

  Future<List<UserFamily>> userFamilyList() async{
    try {
      userFamily= await Amplify.DataStore.query(UserFamily.classType);
      print("user family list");
      print(userFamily.length);
      return userFamily;
    }catch(e)
    {
      print("Could not query DataStore: " + e);
    }

  }

  getUserFamily() {
    if(userFamily.isNotEmpty) {
      for (int i = 0; i < user.length; i++) {
        print(userFamily[i].name);
        if (userid == userFamily[i].user_id) {
          print("hiiii");
          FAMILY_MEMBER.addAll({
            userFamily[i].name: userFamily[i].relationship,
          });
        }
      }
    }else
      {
        print("User Family List is Empty");
      }
  }

  Future<List<UserEducation>> education() async {
    try {
      userEducation= await Amplify.DataStore.query(UserEducation.classType);
      print(userEducation);
      print("inside the user");
      return userEducation;
    }catch(e)
    {
      print("Could not query DataStore: " + e);
    }
  }

  _navigatetoIslamScreen() {
    print("inside navigation");
    Navigation.intent(context, AppRoutes.ISLAM_INTREST);
  }

  Widget _buildLoadingScreen() {
    return Center(
      child: Container(
        width: 50,
        height: 50,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
