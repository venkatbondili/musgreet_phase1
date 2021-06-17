import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mus_greet/core/config/navigation.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/utils/routes.dart';
import 'package:mus_greet/core/widgets/action_button_widget.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';
import 'package:mus_greet/core/widgets/rounded_button_widget.dart';
import 'package:mus_greet/models/ModelProvider.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:mus_greet/pages/advanced_search/search_skills_screen.dart';



class AddSkillsScreen extends StatefulWidget {
  final String callingScreen;
  final List<String> languagesList;
  final String gender;
  final String age;
  //final List<Users> genderFilteredUsers;
  //final List<Users> ageFilteredUsers;
  AddSkillsScreen({this.callingScreen, this.languagesList, this.gender, this.age
    //this.genderFilteredUsers,
    //this.ageFilteredUsers
  });
  @override
  _AddSkillsScreenState createState() => _AddSkillsScreenState();
}

class _AddSkillsScreenState extends State<AddSkillsScreen> {
  List<MasterIntrests> masterIntrest;
  List<UserProfile> userProfile;
  List<String> SKILLS_CATEGORIES=[];
  List<String> skills;
  List<String> idIntrest;
  List<String> SKILLS=[];
  List<String> SKILLSLIST=[];
  String skillList;
  final List<String> _selectedItems =[];

  @override
  Widget build(BuildContext context) {
    if(SKILLS_CATEGORIES.isEmpty) {
      _getSkills();
    }
    _userProfile();
    _generatingSkillsId();
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
        //SKILLS,
      onSelectionChanged: (val) {
        print("hiiiiiii");
        print(val);
        setState(() {
          _selectedItems.clear();
          _selectedItems.addAll(val);
        });
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
                  Navigation.back(context);
                  print("Before the Intrest");
                  print(SKILLSLIST);
                  skillList=SKILLSLIST.join(",");
                  print(skillList=SKILLSLIST.join(","));
                  _UpdatingSkills();
                  print("add");
                }


              },
            ),
          ),
        ],
      ),
    );
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
    userProfile=await Amplify.DataStore.query(UserProfile.classType , where :UserProfile.ID.eq("f6a5cb27-5528-470d-88c5-3f199a03ea79"));
    print("Inside the User Profile data store skills");
    var a=userProfile[0].skills;
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


  Future<void> _getSkills() async {
    try {
      masterIntrest = await Amplify.DataStore.query(MasterIntrests.classType);
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
    catch (e) {
      print("Could not query DataStore: " + e.stacktrace);
    }
  }

  Future<void> _generatingSkillsId() async {
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


  Future<void> _UpdatingSkills() async {
    final updatedItem = userProfile[0].copyWith(

        skills:  skillList);

    await Amplify.DataStore.save(updatedItem);

  }
}

class MultiSelectChip extends StatefulWidget {
  final List<String> reportList;
  //List<String> selectedChoices;
  final Function(List<String>) onSelectionChanged;
  final double width;
  final double fontSize;

  MultiSelectChip(this.reportList, {this.onSelectionChanged,this.fontSize=12,this.width=1});

  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}


class _MultiSelectChipState extends State<MultiSelectChip> {
 // // final List<String> =List.empty(growable: true);
   List<String> selectedList = List.empty(growable: true);
  _buildChoiceList() {
    List<Widget> choices = List.empty(growable: true);
    widget.reportList.forEach(
      (item)
      {
        print("inside the build");
        print(item);
        choices.add(
          Theme(
            data: ThemeData(canvasColor: Colors.transparent),
            child: ChoiceChip(
              padding: EdgeInsets.only(left: 5, right: 5),
              side: BorderSide(
                  width: widget.width,
                  color: selectedList.contains(item)
                      ? AppColors.background_color
                      : AppColors.background_color),
              label: Text(item),
              labelStyle: selectedList.contains(item)
                  ? TextStyle(
                      fontFamily: FontConstants.FONT,
                      fontSize: widget.fontSize,
                      color: AppColors.white,
                      fontWeight: FontWeight.w900,
                    )
                  : TextStyle(
                      fontFamily: FontConstants.FONT,
                      fontSize: widget.fontSize,
                      color: AppColors.black,
                      fontWeight: FontWeight.w500),
              selected: selectedList.contains(item),
              backgroundColor: selectedList.contains(item)
                  ? AppColors.background_color
                  : AppColors.white,
              selectedColor: AppColors.background_color,
              onSelected: (selected) {
                print("on Selected");
                print(selected);
                setState(() {
                  //_getSelectedChoiceList(item,selected);
                  // selectedList.contains(item)
                  //     ? selectedList.add(item)
                  //     : selectedList.remove(item);
                  // widget.onSelectionChanged(selectedList);
                });
              },
            ),
          ),
        );
      },
    );
    print("outside the method");
    return choices;
  }

  // _getSelectedChoiceList(String item,bool selected)
  // {
  //   if(selected==true)
  //     {
  //       print("true");
  //       if(!widget.selectedChoices.contains(item)) {
  //         widget.selectedChoices.add(item);
  //       }
  //     }else {
  //     print("false");
  //     print(widget.selectedChoices);
  //     print(item);
  //     if(widget.selectedChoices.contains(item));
  //     {
  //       print("contains true");
  //       widget.selectedChoices.remove(item);
  //       print(widget.selectedChoices);
  //     }
  //     }
  //   widget.onSelectionChanged(widget.selectedChoices);
  // }

  @override
  Widget build(BuildContext context) {
    //selectedChoices.add(widget.reportList.first);
    return Wrap(
      spacing: 10.0, // spacing between adjacent chips
      children: _buildChoiceList(),
    );
  }



}



