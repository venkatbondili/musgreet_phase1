import 'dart:convert';

import 'package:amplify_datastore/amplify_datastore.dart';
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
import 'package:mus_greet/pages/add_education_screen/add_education_screen.dart';
import 'package:mus_greet/pages/bio/bio.dart';
import 'package:mus_greet/pages/final/nearly_finished_page.dart';
import 'package:mus_greet/pages/islam_intrest/islam_intrest.dart';
import 'package:mus_greet/pages/languages_screen/select_languages.dart';
import 'package:mus_greet/pages/my_family_screen/my_family_screen.dart';
import 'package:mus_greet/pages/profile/view_profile_screen/view_profile_screen.dart';
import 'package:mus_greet/pages/profile_privacy/profile_privacy.dart';
import 'package:mus_greet/pages/relation/relationshio.dart';

import '../../../../main.dart';

class AboutTab extends StatefulWidget {
  final Users sessionUser;
  AboutTab({this.sessionUser});

  @override
  _AboutTabState createState() => _AboutTabState();
}

class _AboutTabState extends State<AboutTab> {
  List<UserProfile> userProfile;
  //List<Users> user=[];
  List<UserFamily> userFamily=[];
  List<String> name=[];
  List<String> relationship=[];
  List<String> listOfLanguages;
  List<UserEducation> userEducation;
  List<UserEducation> userEducationUsers=[];
  bool _isBioExpanded =false;
   bool _isEducationExpanded = false;
  bool _isContactInfoExpanded = false;
  bool _isGeneralInfoExpanded = false;
  bool _isFaithInfoExpanded = false;
  bool _isFamilyInfoExpanded = false;
  bool _isPrivacyInfoExpanded = false;
  Map<String,String> FAMILY_MEMBER={};
  String bio="";
  String sectName="";
  String revert="";
  String islamIntrestValue="";
  String policy="";
  bool language;
  String joinedDate="";
  String age="";
  String relationshipStatus="";
  String gender="";
  String houseNumber="";
  String street="";
  String city="";
  String country="";
  String postCode="";

  ViewProfileScreen args;
  Users sessionUser;

  @override
  Widget build(BuildContext context) {
    //userList();

    // args=ModelRoute.of(context).settings.arguments as ViewProfileScreen;
    // sessionUser=args.sessionUser;
    // userid=sessionUser.id;
    return FutureBuilder<List<UserProfile>>(
      future: userList(),
      builder: (ctx, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            userProfile = snapshot.data;
            return buildFamilyList(userProfile);
          default:
            return _buildLoadingScreen();
        }
      }
    );
  }

  buildFamilyList(List<UserProfile> userProfile)
  {
    //userFamilyList();
    print(widget.sessionUser);
    print("inside the user list method");
    return FutureBuilder<List<UserFamily>>(
      future: userFamilyList(),
      builder: (ctx, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            userFamily = snapshot.data;
            return buildEducation(userFamily,widget.sessionUser);
          default:
            return _buildLoadingScreen();
        }
      },
    );
  }


  buildEducation(List<UserFamily> userFamily, Users user)
  {
    //education();
    print(userFamily.length);
    print("inside the user family method");
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


  buildAbout(List<UserFamily> userFamily, Users user, List<UserEducation> userEducation) {
    bool status = false;
    print("inside the build about");
    print(userEducation);
    getUserFamily();
    gettingLanguages(userProfile);
    print("after getting the languages");
    if(userFamily.isNotEmpty && userEducation.isNotEmpty){
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
        // Container(
        //   padding: EdgeInsets.only(left: 15, right: 15),
        //   child: Text(
        //     //widget.userProfile[0].bio,
        //     "",
        //     style: TextStyle(
        //       fontFamily: FontConstants.FONT,
        //       fontSize: 12,
        //       fontWeight: FontWeight.w400,
        //       color: AppColors.header_black,
        //     ),
        //   ),
        // ),
        // CustomSpacerWidget(
        //   height: 30,
        // ),
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
    _getBioDetails();
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
                              contactType: "", details: bio ),
                        ]
                    ),
                  ]
              ),
              _isBioExpanded
                  ? Padding(
                padding: EdgeInsets.only(right: 25, top: 15),
                //_getLockDetails(),
                child: _getEditDetails(callBack: (){
                  //_navigateToEditEducationScreen(route: AppRoutes.BIO);
                  Navigator.of(context).push(new MaterialPageRoute(builder: (_)=>new Bio(sessionUser:widget.sessionUser)),).then((value) => value?build(context):null);
                }),
              )
                  : Container(),
            ],

          ),
        ],
      ),
    );
  }

  _getBioDetails()
  {
    if(userProfile[0].bio == "" || userProfile[0].bio == null){
      bio = "Add your bio here";
    }else{
      bio=userProfile[0].bio;
    }
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
        child:Column(
          children: [
         Row(
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
                    child: _getArrowDownAndUpEducation(_isEducationExpanded),
                  )
                : _getArrowDownAndUpEducation(_isEducationExpanded),

          ],
        ),
        ]
        )
      ),
    );
  }



  _getLockDetails()
  {
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.only(left:0, top: 15),
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

  _getEditDetailsForEducation({Function callBack}) {
    return GestureDetector(
      onTap: () => callBack(),
      child: Padding(
        padding: EdgeInsets.only(left: 300, top: 0),
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

  _getArrowDownAndUpEducation(bool isExpanded) {
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: AssetImageWidget(
        image: ImageConstants.IC_DOWN,
        height: 15,
        width: 15,
        color: isExpanded ? AppColors.black : null,
      ),
    );
  }

  _getEducationExpandedContainer() {
    bool editIcon=true;
    _getEducationList();
    print("inside the user education");
    print(userEducationUsers.length);
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.comment_wall_color,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _getEducationDetails(),
             Column(
               children: <Widget>[
                 //mainAxisAlignment: MainAxisAlignment.start,
                 new ListView.builder(
                   shrinkWrap: true,
                   scrollDirection: Axis.vertical,
                   itemCount: userEducationUsers.length,
                   itemBuilder:(context ,index)
                   {
                     return  _getEducationInfo(
                              institution: userEducationUsers[index].institution,
                              dept: userEducationUsers[index].course,
                              years: userEducationUsers[index].from + "," + userEducationUsers[index].to,
                              //editIcon: true,
                              number:index,
                            );
                   }

                 )
               ],

             ),
        ],
      ),

    );
  }

  _getEducationList()
  { print("get educationlist");
  userEducationUsers.clear();
      print("for loop of education list");
        String userId=widget.sessionUser.id;
        for(int i=0;i<userEducation.length;i++)
          {print("for loop for length");
            if(userId== userEducation[i].usersID)
              {print("if condition is true");
                userEducationUsers.add(userEducation[i]);
              }

      }
    print(userEducationUsers.length);
  }

  _getEducationInfo(
      {String institution, String dept, String years, bool editIcon = false, int number}) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 25, right: 25, top: 8, bottom: 8),
      child:Column(
        children:[
       Row(
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
                 )
              ],
            ),

          ),
          number==0? _getEditDetails(
              callBack: (){
                //_navigateToEditEducationScreen(
                //route: AppRoutes.ADD_EDUCATION,
                Navigator.of(context).push(new MaterialPageRoute(builder: (_)=> AddEducationScreen(sessionUser:widget.sessionUser)),).then((value) => value?build(context):null);
              }
          )
              : Container(),
        ],
        ),
      ]
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
                      details: widget.sessionUser.email),
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
                              details: widget.sessionUser.phone),
                        ]
                    ),
                  ]
              ),
              GestureDetector(
                child: Padding(
                  padding: EdgeInsets.only(left: 0, top:30),
                  child: AssetImageWidget(
                    image: ImageConstants.IC_EYE,
                    height: 20,
                    width: 20,
                  ),
                ),
              ),
              _isContactInfoExpanded
                  ? Padding(
                padding: EdgeInsets.only(right:22, top: 15),
                child:
                _getLockDetails(
                 // _navigateToEditEducationScreen(route: AppRoutes.MY_FAMILY);
                ),
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
      padding: EdgeInsets.only(left: 10, right: 0, top: 8, bottom: 8),
      width: MediaQuery.of(context).size.width -104,
      child: Flexible(
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
              maxLines: 5,
              textAlign: TextAlign.justify,
              //overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: FontConstants.FONT,
                  color: AppColors.header_black),
            ),
          ],
        ),
      ),
    );
  }

  _getGeneralInfoExpandedContainer() {
    _getLanguages();
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
                      details: joinedDate),
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
                                contactType: AppTexts.GENDAR, details: gender),
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
                                details: age),
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
                                details: relationshipStatus),
                          ]
                      ),
                    ]
                ),
                _isGeneralInfoExpanded
                    ? Padding(
                  padding: EdgeInsets.only(right: 25, top: 15),
                  child: _getEditDetails(callBack: (){
                    //_navigateToEditEducationScreen(route: AppRoutes.LANGUAGES_SCREEN);
                    Navigator.of(context).push(new MaterialPageRoute(builder: (_)=>new Reliationship(sessionId: widget.sessionUser,)),).then((value) => value?build(context):null);
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
                            language?
                            _getContactInfoData(
                                contactType: AppTexts.LANGUAGE_SPOKEN,
                                details: listOfLanguages.join('.')) :
                            _getContactInfoData(
                                contactType: AppTexts.LANGUAGE_SPOKEN,
                                details: "Add the Languages"),
                          ]
                      ),
                    ]
                ),
                _isGeneralInfoExpanded
                    ? Padding(
                  padding: EdgeInsets.only(right: 25, top: 15),
                  child: _getEditDetails(callBack: (){
                    //_navigateToEditEducationScreen(route: AppRoutes.LANGUAGES_SCREEN);
                    Navigator.of(context).push(new MaterialPageRoute(builder: (_)=>new LanguagesScreen(sessionId: widget.sessionUser,)),).then((value) => value?build(context):null);
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
                                details: houseNumber + " ," + street + "\n " + city+ ", " + country + ", " + postCode),
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

  _getLanguages()
  {
    if(listOfLanguages == null  || listOfLanguages ==  [])
      {
        language=false;
      }else
        {
          language=true;
        }
     joinedDate=widget.sessionUser.joined_date.toString();
     gender=widget.sessionUser.gender;
     age=widget.sessionUser.age;
     relationshipStatus=userProfile[0].relationship_status;
     houseNumber=widget.sessionUser.house_number;
     street=widget.sessionUser.street;
     city=widget.sessionUser.city;
     country=widget.sessionUser.country;
     postCode=widget.sessionUser.postcode;
     if(joinedDate == "" || joinedDate == null){
       joinedDate = "No data available";
     }
     if(gender == "" || gender == null){
       gender = "No data available";
     }
     if(relationshipStatus == "" || relationshipStatus == null){
       relationshipStatus = "No data available";
     }
    if(houseNumber == "" || houseNumber == null){
      houseNumber = "No data available";
    }
    if(street == "" || street == null){
      street = "No data available";
    }
    if(city == "" || city == null){
      city = "No data available";
    }
    if(country == "" || country == null ){
      country = "No data available";
    }
    if(postCode == "" || postCode == null){
      postCode = "No data available";
    }
    //listOfLanguages.join(".");
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
    _gettheSectData();
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
                              contactType: AppTexts.SECT, details: sectName),
                        ]
                    ),
                  ]
              ),
              GestureDetector(
                child: Padding(
                  padding: EdgeInsets.only(left:0, top: 30),
                  child: AssetImageWidget(
                    image: ImageConstants.IC_EYE,
                    height: 20,
                    width: 20,
                  ),
                ),
              ),
              _isFaithInfoExpanded
                  ? Padding(
                padding: EdgeInsets.only(right: 22, top: 15),
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
                              contactType: AppTexts.ARE_YOU_A_REVERT, details:revert),
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
                              details: islamIntrestValue),
                        ]
                    ),
                  ]
              ),
              _isFaithInfoExpanded
                  ? Padding(
                padding: EdgeInsets.only(right: 25, top: 15),
                child: _getEditDetails(callBack: (){
                 // _navigatetoIslamScreen();
                  Navigator.of(context).push(new MaterialPageRoute(builder: (_)=> IslamIntrest(sessionUser:widget.sessionUser)),).then((value) => value?build(context):null);
                }),
              )
                  : Container(),

            ],

          ),
        ],
      ),
    );
  }

  _gettheSectData()
  {
    sectName=userProfile[0].sect;
    islamIntrestValue=userProfile[0].islam_interest.toString();
    revert=userProfile[0].are_you_revert.toString();
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
                    //name:"" ,relationShip: ""),
                ],
              ),
              _isFamilyInfoExpanded
                  ? Padding(
                      padding: EdgeInsets.only(right: 25, top: 15),
                      child: _getEditDetails(
                          callBack: (){
                           // _navigateToEditEducationScreen(route: AppRoutes.MY_FAMILY);

                            Navigator.of(context).push(new MaterialPageRoute(builder: (_)=> MyFamilyScreen(sessionUser:widget.sessionUser)),).then((value) => value?build(context):null);
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
      //"",
      height: 0,
      width: 0,
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
    _getPrivacy();
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
                              contactType: AppTexts.PROFILE_VIEW, details: policy),
                        ]
                    ),
                  ]
              ),
              _isPrivacyInfoExpanded
                  ? Padding(
                padding: EdgeInsets.only(right: 25, top: 15),
                child: _getEditDetails(callBack: (){
                  //_navigateToEditEducationScreen(route: AppRoutes.PROFILE_PRIVACY);
                  Navigator.of(context).push(new MaterialPageRoute(builder: (_)=> ProfilePrivacy(sessionUser:widget.sessionUser)),).then((value) => value?build(context):null);
                }),
              )
                  : Container(),
            ],

          ),
        ],
      ),
    );
  }

  _getPrivacy()
  {
    policy=userProfile[0].profile_privacy;
    if(policy=="" || policy==null)
      {
        policy="No Data Available";
      }
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

  gettingLanguages(List<UserProfile> userProfile) async {
    try{
    String language=userProfile[0].languages_spoken;
    if(language.isNotEmpty){
      print("getting languages");
      print(language);
      List<dynamic> languageDecode=jsonDecode(language);
      print(languageDecode);
      var languageJoin=languageDecode.join(",");
      var splitting= languageJoin.split(",");
      listOfLanguages=splitting;
      print(listOfLanguages);
      print(userProfile);
      print("inside the user profile");
    }
    else{
      listOfLanguages = [];
    }
    }catch(e)
    {
      print("Could not query DataStore: " + e);
    }
  }

  Future<List<UserProfile>> userList() async{
    try{
      userProfile = await Amplify.DataStore.query(UserProfile.classType,where: UserProfile.USERSID.eq(widget.sessionUser.id));
      print(userProfile);
      return userProfile;
    }catch(e)
    {

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
    FAMILY_MEMBER.clear();
    if(userFamily.isNotEmpty) {
      for (int i = 0; i < userFamily.length; i++) {
        print(userFamily[i].name);
        if (widget.sessionUser.id == userFamily[i].user_id) {
          print("inside the family widget");
          FAMILY_MEMBER.addAll({
            userFamily[i].name: userFamily[i].relationship,
          });
        }
      }
    }else
      {
        FAMILY_MEMBER = {};
        print("User Family List is Empty");
      }

    print(FAMILY_MEMBER);
  }

  Future<List<UserEducation>> education() async {
    try {
      userEducation= await Amplify.DataStore.query(UserEducation.classType);
      print(userEducation);
      print("inside the user education");
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
