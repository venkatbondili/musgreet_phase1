import 'dart:convert';

import 'package:flutter/material.dart';
//import 'package:mus_greet/models/MasterIntrests.dart';
import 'package:mus_greet/core/config/navigation.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/utils/routes.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';
import 'package:mus_greet/models/MasterIntrests.dart';
import 'package:mus_greet/models/ModelProvider.dart';
import 'package:mus_greet/models/UserProfile.dart';
import 'package:mus_greet/pages/add_skills_screen/add_skills_screen.dart';
import 'package:mus_greet/pages/final/nearly_finished_page.dart';
import 'package:mus_greet/pages/interest_screen/interest_screen.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:mus_greet/pages/interest_screen/religious_interest_screen.dart';


class InterestTab extends StatefulWidget {
  final Users sessionUser;
  InterestTab({this.sessionUser});
  @override
  _InterestTabState createState() => _InterestTabState();
}

class _InterestTabState extends State<InterestTab> {

  List<MasterIntrests> masterIntrest;
 List<UserProfile> userProfile;
  List<String> idIntrest=[];
  List<String> IdSkill=[];
  List<String> idReligious=[];
  Map<String,dynamic> INTRESTS ={};
  Map<String,dynamic> SKILLS={};
  Map<String,dynamic> RELIGIOUS_LIST={};
  List<String> intrestData=[];
  List<String> skillsData=[];
  List<String> religiousData=[];

  @override
  Widget build(BuildContext context) {
    print("Build Context");
    //print(widget.userProfile);

    return FutureBuilder<List<MasterIntrests>>(
      future: _getMasterIntrestList(),
      builder: (ctx, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            masterIntrest = snapshot.data;
            return buildUi(masterIntrest);
          default:
            return _buildLoadingScreen();
        }
      },
    );

  }

  buildUi(List<MasterIntrests> masterIntrest)
  {
    return FutureBuilder<List<UserProfile>>(
      future: getUserProfile(),
      builder: (ctx, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            print('done state');

            userProfile = snapshot.data;
            print(snapshot.data);
            return buildUserProfileList(userProfile);
          default:
            return _buildLoadingScreen();
        }
      },
    );
  }


  buildUserProfileList(List<UserProfile> userProfile)
  {print("BUILD UI");
  print(userProfile);
  print(userProfile[0]);
  print(masterIntrest.length);
  getIntrests();
  print(idIntrest.length);
  //print(userProfile[0].community_interests);

  return Container(
      margin: EdgeInsets.only(top: 4),
      width: MediaQuery.of(context).size.width,
      color: AppColors.white,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        getCommonPadding(
            26,
            7,
            0,
            27,
            Text(
              AppTexts.COMMUNITY_INTEREST,
              style: TextStyle(
                  fontFamily: FontConstants.FONT,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.header_black),
            )),
        getCommonPadding(
          39,
          7,
          0,
          27,
          Row(
            children: [
              Text(
                AppTexts.INTEREST,
                style: TextStyle(
                    fontFamily: FontConstants.FONT,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.header_black),
              ),
              Text(
                INTRESTS.length.toString(),
                style: TextStyle(
                    fontFamily: FontConstants.FONT,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.green),
              ),
              Expanded(
                child: CustomSpacerWidget(
                  width: 4,
                ),
              ),
              GestureDetector(
                onTap: () => _navigateToInterestScreen(userProfile),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: AssetImageWidget(
                    image: ImageConstants.IC_EDIT,
                    height: 20,
                    width: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
        getInterestList(),
        getCommonPadding(
          39,
          0,
          0,
          27,
          Row(
            children: [
              Text(
                AppTexts.SKILLS,
                style: TextStyle(
                    fontFamily: FontConstants.FONT,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black),
              ),
              Text(
                SKILLS.length.toString(),
                style: TextStyle(
                    fontFamily: FontConstants.FONT,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.green),
              ),
              Expanded(
                child: getCommonPadding(
                    10,
                    0,
                    0,
                    0,
                    Container(
                      height: 30,
                      decoration: BoxDecoration(
                        color: AppColors.green_light,
                        borderRadius: BorderRadius.all(
                          Radius.circular(40),
                        ),
                      ),
                      child: Center(
                        child: getCommonPadding(
                            15,
                            3,
                            3,
                            15,
                            Text(
                              'For more options, visit our business services',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontFamily: FontConstants.FONT,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.green),
                            )),
                      ),
                    )),
              ),
              CustomSpacerWidget(
                width: 15,
              ),
              GestureDetector(
                onTap: () => _navigateToEditSkillsScreen(userProfile),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: AssetImageWidget(
                    image: ImageConstants.IC_EDIT,
                    height: 20,
                    width: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
        getSkills(),
        getCommonPadding(
          39,
          0,
          0,
          27,
          Row(
            children: [
              Text(
                AppTexts.RELIGIOUS_INTEREST,
                style: TextStyle(
                    fontFamily: FontConstants.FONT,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black),
              ),
              Text(
                RELIGIOUS_LIST.length.toString(),
                style: TextStyle(
                    fontFamily: FontConstants.FONT,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.green),
              ),
              Expanded(
                child: CustomSpacerWidget(
                  width: 5,
                ),
              ),
              GestureDetector(
                onTap: () => _navigateToReligiousScreen(userProfile),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: AssetImageWidget(
                    image: ImageConstants.IC_EDIT,
                    height: 20,
                    width: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
        getReligiousInterest(),
        getCommonPadding(
            0,
            30,
            0,
            0,
            Center(
              child: AssetImageWidget(
                image: ImageConstants.AMAZON_ADS,
                width: MediaQuery.of(context).size.width,
              ),
            ))
      ]));
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

  ///Create a common padding widget for the About Us View
  Widget getCommonPadding(
      double left, double top, double bottom, double right, Widget widget) {
    return Padding(
      padding:
      EdgeInsets.only(left: left, top: top, bottom: bottom, right: right),
      child: widget,
    );
  }


  getReligiousInterest() {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 100.0,
        child: Padding(
          padding: const EdgeInsets.only(left: 39),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              new ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount:RELIGIOUS_LIST.length,
                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Column(
                        children: [
                          AssetImageWidget(
                            image: RELIGIOUS_LIST.values.elementAt(index),
                            height: 60,
                            width: 60,
                          ),

                          getCommonPadding(
                              0,
                              10,
                              0,
                              0,
                              Center(
                                child: Text(
                                  RELIGIOUS_LIST.keys.elementAt(index),
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: FontConstants.FONT,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.black),
                                ),
                              )),
                        ],
                      ),
                    );

                  }

              ),
              //getInterestChild(),
              //getInterestChild(),
              //getInterestChild(),
              //getInterestChild(),
              //getInterestChild(),
              //getInterestChild(),
            ],
          ),
        ));
  }



  getInterestChild() {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: Column(
        children: [
          AssetImageWidget(
            image: ImageConstants.IC_FATHER,
            height: 60,
            width: 60,
          ),

          getCommonPadding(
              0,
              10,
              0,
              0,
              Center(
                child: Text(
                  "Food",
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: FontConstants.FONT,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black),
                ),
              )),
        ],
      ),
    );
  }

  getInterestList() {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 90.0,
        child: Padding(
          padding: const EdgeInsets.only(left: 39),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
          new ListView.builder(
          shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount:INTRESTS.length,
              itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Column(
                    children: [
                      AssetImageWidget(
                        image: INTRESTS.values.elementAt(index),
                        height: 60,
                        width: 60,
                      ),

                      getCommonPadding(
                          0,
                          10,
                          0,
                          0,
                          Center(
                            child: Text(
                              INTRESTS.keys.elementAt(index),
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: FontConstants.FONT,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.black),
                            ),
                          )),
                    ],
                  ),
                );

              }

          ),
              //getInterestChild(),
              //getInterestChild(),
              //getInterestChild(),
              //getInterestChild(),
              //getInterestChild(),
              //getInterestChild(),
            ],
          ),
        ));
  }


  getSkills() {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 90.0,
        child: Padding(
          padding: const EdgeInsets.only(left: 39),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              new ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount:SKILLS.length,
                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Column(
                        children: [
                          AssetImageWidget(
                            image: SKILLS.values.elementAt(index),
                            height: 60,
                            width: 60,
                          ),

                          getCommonPadding(
                              0,
                              10,
                              0,
                              0,
                              Center(
                                child: Text(
                                  SKILLS.keys.elementAt(index),
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: FontConstants.FONT,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.black),
                                ),
                              )),
                        ],
                      ),
                    );

                  }

              ),
              //getInterestChild(),
              //getInterestChild(),
              //getInterestChild(),
              //getInterestChild(),
              //getInterestChild(),
              //getInterestChild(),
            ],
          ),
        ));
  }

  ///This will edit the interest and navigate to add interest screen
  _navigateToInterestScreen(List<UserProfile> userProfile) {
    //Navigation.intent(context, AppRoutes.INTEREST_SCREEN);
   //Navigator.push(context, MaterialPageRoute(builder: (context)=>InterestScreen(userProfile:widget.userProfile),));
   Navigator.of(context).push(new MaterialPageRoute(builder: (_)=>new InterestScreen(userProfile: userProfile ,intrestData :intrestData)),).then((value) => value?build(context):null);
  }

  ///This will edit the interest and navigate to add interest screen
  _navigateToEditSkillsScreen(List<UserProfile> userProfile) {
    //Navigation.intent(context, AppRoutes.ADD_SKILLS_IMAGES);
    //Navigation.intent(context, AppRoutes.ADD_SKILLS);
    Navigator.of(context).push(new MaterialPageRoute(builder: (_)=>new AddSkillsScreen(userProfile: userProfile,skillsData:skillsData)),).then((value) => value?build(context):null);
  }


   _navigateToReligiousScreen(List<UserProfile> userProfile)
   {
     //Navigation.intent(context, AppRoutes.ADD_RELIGIOUS_INTERESTS_SCREEN);
     Navigator.of(context).push(new MaterialPageRoute(builder: (_)=>new ReligiousInterestScreen(userProfile: userProfile,religiousData:religiousData)),).then((value) => value?build(context):null);
   }

   Future<List<UserProfile>>getUserProfile() async{
print('inside getusrprofile method');
print(widget.sessionUser.id);
      try {
        userProfile = await Amplify.DataStore.query(UserProfile.classType,
            where: UserProfile.USERSID.eq(widget.sessionUser.id));
        print(userProfile);
        print("Inside the User Profile");
        return userProfile;
      } catch(e)
     {

     }
   }

   getIntrests() { //idIntrest.clear();
    //try {
    print("Inside the get Intrest");
    print(masterIntrest.length);
      INTRESTS.clear();
      SKILLS.clear();
      RELIGIOUS_LIST.clear();
    intrestData.clear();
    skillsData.clear();
    religiousData.clear();
      print("Inside the User Profile data store");
       var  intrestId=userProfile[0].community_interests;
       if(intrestId != null){
         print(intrestId);
         print(intrestId.runtimeType);
         List<dynamic> intrest=jsonDecode(intrestId);
         print(intrest);
         var intrestString=intrest.join(",");
         var intrestList=intrestString.split(",");
         print(intrestList);
         idIntrest=intrestList;

         for(int i=0;i<idIntrest.length;i++) {
           String hobbieList=idIntrest[i];
           print("Inside the For loop");
           for(int i=0;i<masterIntrest.length;i++) {
             print(hobbieList);
             if (hobbieList == masterIntrest[i].id) {
               intrestData.add(masterIntrest[i].intrest_name);
               print("inside the master");
               INTRESTS.addAll({
                 masterIntrest[i].intrest_name :masterIntrest[i].photo_path,
               });
             }
           }
         }

       }else{
        INTRESTS = {};
       }



       print("------------Skills-------------");
       var  skillsId=userProfile[0].skills;
       if(skillsId != null){
         print(skillsId);
         print(skillsId.runtimeType);
         List<dynamic> skills=jsonDecode(skillsId);
         print(skills);
         var SkillsString=skills.join(",");
         var skilldList=SkillsString.split(",");
         print(skilldList);
         IdSkill=skilldList;

         for(int i=0;i<IdSkill.length;i++) {
           String skillList=IdSkill[i];
           print("Inside the For loop for skills");
           for(int i=0;i<masterIntrest.length;i++) {
             print(skillList);
             if (skillList == masterIntrest[i].id) {
               skillsData.add(masterIntrest[i].intrest_name);
               print("inside the master skills");
               SKILLS.addAll({
                 masterIntrest[i].intrest_name :masterIntrest[i].photo_path,
               });
             }
           }
         }

       }
       else{
         SKILLS = {};
       }


       print("-----------------Religious -----------");

        var  religious=userProfile[0].religious_interests;
        if(religious != null){
          print(religious);
          print(religious.runtimeType);
          List<dynamic> religiousDecode=jsonDecode(religious);
          print(religiousDecode);
          var religiousString=religiousDecode.join(",");
          var religiousList=religiousString.split(",");
          print(religiousList);
          idReligious=religiousList;

          for(int i=0;i<idReligious.length;i++) {
            String religiousList=idReligious[i];
            print("Inside the For loop for skills");
            for(int i=0;i<masterIntrest.length;i++) {
              print(religiousList);
              if (religiousList == masterIntrest[i].id) {
                religiousData.add(masterIntrest[i].intrest_name);
                print("inside the master religious");
                RELIGIOUS_LIST.addAll({
                  masterIntrest[i].intrest_name :masterIntrest[i].photo_path,
                });
              }
            }
          }
        } else{
          RELIGIOUS_LIST = {};
        }

      print("end of the list");

    //}catch(e)


  }


   Future<List<MasterIntrests>> _getMasterIntrestList() async
   {
     try {
       masterIntrest = await Amplify.DataStore.query(MasterIntrests.classType );
       print("inside the Master List");
       print(masterIntrest);
       return masterIntrest;
     } catch (e) {
       print("Could not query DataStore: " + e);
     }
   }




}

