import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mus_greet/core/config/navigation.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/utils/routes.dart';
import 'package:mus_greet/core/widgets/action_button_widget.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';
import 'package:mus_greet/core/widgets/rounded_button_widget.dart';
import 'package:mus_greet/models/MasterIntrests.dart';
import 'package:mus_greet/models/ModelProvider.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:mus_greet/pages/advanced_search/search_skills_screen.dart';
import 'package:mus_greet/pages/interest_screen/multi_line_chip.dart';


class AddSkillsScreen extends StatefulWidget {
  final String callingScreen;
  final List<String> languagesList;
  final String gender;
  final String age;
  final List<UserProfile> userProfile;
  final List<String> skillsData;
  //final List<Users> genderFilteredUsers;
  //final List<Users> ageFilteredUsers;
  AddSkillsScreen({this.callingScreen, this.languagesList, this.gender, this.age, this.userProfile, this.skillsData
    //this.genderFilteredUsers,
    //this.ageFilteredUsers
  });
  @override
  _AddSkillsScreenState createState() => _AddSkillsScreenState();
}

class _AddSkillsScreenState extends State<AddSkillsScreen> {
  List<MasterIntrests> masterIntrest;
  //List<UserProfile> userProfile;
  List<String> SKILLS_CATEGORIES=[];
  List<String> skills;
  List<String> idIntrest;
  List<String> SKILLS=[];
  List<String> SKILLSLIST=[];
  String skillList;
  final List<String> _selectedItems =[];

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<MasterIntrests>>(
      future: _getSkills(),
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
    print("inside the widget");
    print(widget.userProfile);
    _getSkillsList();
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: _getBody(),
      ),
    );
  }


  _getBody() {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 15, right: 15, top: 60,bottom: 30),
            child: Column(
              children: [
                _getHeader(),
                CustomSpacerWidget(
                  height: 50,
                ),
                _getChipListOfSkills(),
                CustomSpacerWidget(
                  height: 50,
                ),
                _getIncreaseBrandValueTextTips(),
                CustomSpacerWidget(
                  height: 150,
                ),
                _getAddAndCancelButton(),
              ],
            ),
          ),
          Positioned(
            left: 20,
            top: 35,
            child: GestureDetector(
              onTap: (){
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
      ),
    );
  }



  _getHeader() {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            AppTexts.ADD_SKILLS,
            style: TextStyle(
              fontFamily: FontConstants.FONT,
              fontSize: 25,
              fontWeight: FontWeight.w900,
              color: AppColors.black,
            ),
          ),
          Text(
            AppTexts.CHOOSE_SKILLS,
            style: TextStyle(
              fontFamily: FontConstants.FONT,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
          ),
        ],
      ),
    );
  }

  _getChipListOfSkills() {
    print(SKILLS_CATEGORIES);
    return MultiSelectChip(
      SKILLS_CATEGORIES,
      widget.skillsData,
      onSelectionChanged: (val) {
        print("hiiiiiii");
        print(val);
       // setState(() {
          _selectedItems.clear();
          _selectedItems.addAll(val);
       // });
      },
    );
  }

  _getIncreaseBrandValueTextTips() {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: 15,right: 15),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.light_grey,
      ),
      child: Text(
        AppTexts.BRAND_VALUE_TEXT,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 12,
          fontFamily: FontConstants.FONT,
          color: AppColors.green
        ),
      )
    );
  }


  _getAddAndCancelButton(){
    return Container(
      padding: EdgeInsets.only(left: 20,right: 20),
      child: Row(
        children: [
          ActionButtonWidget(
            text: AppTexts.CANCEL,
            isFilled: false,
            callBack: (){
              Navigation.back(context);
              print("Cancel");
            },
          ),
          CustomSpacerWidget(width: 20,),
          Expanded(
            child: ActionButtonWidget(
              text: AppTexts.ADD,
              isFilled: true,
              callBack: (){
                if(widget.callingScreen == "AdvancedSearch"){
                  print("Calling from advanced Search");
                  print(_selectedItems);
                  _navigateToAdvancedSearchScreen(_selectedItems);
                  //_selectedItems.clear();
                }
                else {
                  print("calling from intrest tab");
                  getAddedSkillsValue();
                  //Navigation.back(context);
                  print("add");
                }


              },
            ),
          ),
        ],
      ),
    );
  }

  getAddedSkillsValue()
  {
    _generatingSkillsId();
    print("Before the Intrest");
    print(SKILLSLIST);
    //skillList=SKILLSLIST.join(",");
    //print(skillList=SKILLSLIST.join(","));
    _UpdatingSkills();
  }

  _navigateToAdvancedSearchScreen(List<String> selectedItems) {
    List<String> selectedSkillsList =_selectedItems;
    // Navigation.intentWithData(context, AppRoutes.SEARCH_SKILLS_SCREEN ,ArgumentLanguageClass(_selectedItems,"Languages"));
    Navigation.intentWithData(context, AppRoutes.SEARCH_SKILLS_SCREEN ,ArgumentClass(selectedSkillsList,widget.languagesList,widget.gender,widget.age,
        //widget.genderFilteredUsers,
        //widget.ageFilteredUsers,
        "Skills"));
  }

  Future<void> _userProfile() async {
    //userProfile=await Amplify.DataStore.query(UserProfile.classType , where :UserProfile.ID.eq("f6a5cb27-5528-470d-88c5-3f199a03ea79"));
    print("Inside the User Profile data store skills");
    var a=widget.userProfile[0].skills;
    var ab = (a.split(','));
    idIntrest=ab;
    print(idIntrest);

    for(int i=0;i<idIntrest.length;i++) {
      String skillList=idIntrest[i];
      print("Inside the For loop");
      for(int i=0;i<masterIntrest.length;i++) {
        print(skillList);
        if (skillList == masterIntrest[i].id) {
          print("inside the master");
          SKILLS.add(masterIntrest[i].intrest_name);
        }
      }
    }

    }


  Future<List<MasterIntrests>> _getSkills() async {
    try {
      masterIntrest = await Amplify.DataStore.query(MasterIntrests.classType);
     return masterIntrest;
    }
    catch (e) {
      print("Could not query DataStore: " + e.stacktrace);
    }
  }


  _getSkillsList()
  {SKILLS_CATEGORIES.clear();
    for(int i=0;i<masterIntrest.length;i++)
    {
      if(masterIntrest[i].category_name =="Skills")
      {
        SKILLS_CATEGORIES.add(masterIntrest[i].intrest_name);
      }
    }
    print("Get Skills Method");
    print(SKILLS_CATEGORIES);

  }

  _generatingSkillsId()  {
    print("inside the geneating");
    for(int i=0;i<_selectedItems.length;i++)
    {
      print(_selectedItems[i]);
      String nameOfSkills=_selectedItems[i];
      for(int i=0;i<masterIntrest.length;i++)
      {
        if(masterIntrest[i].category_name =="Skills") {
          if (nameOfSkills == masterIntrest[i].intrest_name) {
            SKILLSLIST.add(masterIntrest[i].id);
            print(SKILLSLIST);
            print(masterIntrest[i].id);
          }
        }
      }
    }

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


  Future<void> _UpdatingSkills() async {
    print("inside the updating skills");
    final updatedItem = widget.userProfile[0].copyWith(

        skills:  jsonEncode(SKILLSLIST));

    await Amplify.DataStore.save(updatedItem);
    Navigator.pop(context,true);
  }
}






