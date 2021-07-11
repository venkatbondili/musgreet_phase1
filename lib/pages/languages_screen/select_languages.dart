import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mus_greet/core/config/navigation.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/utils/routes.dart';
import 'package:mus_greet/core/widgets/action_button_widget.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';
import 'package:mus_greet/models/ModelProvider.dart';
import 'package:mus_greet/pages/address-verification/address_verification_view.dart';
import 'package:mus_greet/pages/advanced_search/search_skills_screen.dart';
import 'package:mus_greet/pages/profile/view_profile_screen/view_profile_screen.dart';
import 'package:amplify_flutter/amplify.dart';

class LanguagesScreen extends StatefulWidget {
  final String callingScreen;
  final List<String> skillsList;
  final String gender;
  final String age;
  final Users sessionId;
  final List<UserProfile> userProfile;
  //final List<Users> genderFilteredUsers;
  //final List<Users> ageFilteredUsers;
  LanguagesScreen({this.callingScreen,
    this.skillsList,
    this.gender,
    this.age,
     this.userProfile, this.sessionId,
    //this.genderFilteredUsers,
    //this.ageFilteredUsers
  });
  @override
  _LanguagesScreenState createState() => _LanguagesScreenState();
}
class _LanguagesScreenState extends State<LanguagesScreen> {
   String languages;
   List<UserProfile> userProfile=[];
   List<String> _selectedItems = [];
   List<String> _list=[];
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
    userDetails(widget.sessionId);
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
                _getChipListOfReligions(),
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
              onTap:() {
                Navigator.pop(context);
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
            AppTexts.SELECT_LANGUAGES,
            style: TextStyle(
              fontFamily: FontConstants.FONT,
              fontSize: 25,
              fontWeight: FontWeight.w900,
              color: AppColors.black,
            ),
          ),
          Text(
            AppTexts.CHOOSE_LANGUAGES,
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

  _getChipListOfReligions() {
    return MultiSelectChip(
      AppTexts.LANGUAGES_CATEGORIES,
      onSelectionChanged: (val) {
        print("selecting the value");
         print(val);
        setState(() {
          _selectedItems.clear();
          _selectedItems.addAll(val);
        });
        print(_selectedItems);
      },
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
              print("Cancel");
              Navigator.pop(context);
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
                }else if(widget.callingScreen == "NearlyFinished")
                {
                  print("creating the user profile");
                  createUserProfile(jsonEncode(_selectedItems));
                  //Navigator.pop(context,true);
                  Navigation.intentWithData(context, AppRoutes.NEARLYFINISHED,
                      AddressVerificationArgumentClass(widget.sessionId));
                }
                else
                {
                  updateUserProfile(jsonEncode(_selectedItems));
                  Navigator.pop(context,true);
                }

                //Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }

   _navigateToAdvancedSearchScreen(List<String> selectedItems) {
     List<String> selectedLanguagesList =_selectedItems;
     // Navigation.intentWithData(context, AppRoutes.SEARCH_SKILLS_SCREEN ,ArgumentLanguageClass(_selectedItems,"Languages"));
     Navigation.intentWithData(context, AppRoutes.SEARCH_SKILLS_SCREEN ,ArgumentClass(widget.skillsList,selectedLanguagesList, widget.gender,widget.age,
         //widget.genderFilteredUsers,
         //widget.ageFilteredUsers,
         "Languages"));
   }

  Future<void> userDetails(Users sessionId) async{
    print("user id" +sessionId.id);
    userProfile = await Amplify.DataStore.query(UserProfile.classType , where: UserProfile.USERSID.eq(widget.sessionId.id));
    print(userProfile);
     String link=userProfile[0].languages_spoken;
     var a=link.split(",");
    _list=a;
     //print(languages);
     print("print the languages");
  }

  // updateUserProfile(String languages) async{
  //   final updatedItem = userProfile[0].copyWith(
  //
  //       languages_spoken:languages);
  //
  //   await Amplify.DataStore.save(updatedItem);
  //   await Future.delayed(Duration(seconds: 1));
  //
  // }

   createUserProfile(String languages) async
   {
     print("creating the user profile");
     final Item = UserProfile(
         usersID: widget.sessionId.id,
         languages_spoken: languages);
     await Amplify.DataStore.save(Item);
   }

   updateUserProfile(String languages) async
   {
     print("updating the user profile");
     final updatedItem = userProfile[0].copyWith(
         usersID: widget.sessionId.id,
         languages_spoken: languages);

     await Amplify.DataStore.save(updatedItem);
   }
}
class MultiSelectChip extends StatefulWidget {
  final List<String> reportList;
  final Function(List<String>) onSelectionChanged;

  MultiSelectChip(this.reportList, {this.onSelectionChanged});

  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}
class _MultiSelectChipState extends State<MultiSelectChip> {
  List<String> selectedChoices = List.empty(growable: true);

  _buildChoiceList() {
    List<Widget> choices = List.empty(growable: true);
    widget.reportList.forEach(
          (item) {
        choices.add(
          Theme(
            data: ThemeData(canvasColor: Colors.transparent),
            child: ChoiceChip(
              padding: EdgeInsets.only(left: 5, right: 5),
              side: BorderSide(
                  width: 1,
                  color: selectedChoices.contains(item)
                      ? AppColors.background_color
                      : AppColors.background_color),
              label: Text(item),
              labelStyle: selectedChoices.contains(item)
                  ? TextStyle(
                fontFamily: FontConstants.FONT,
                fontSize: 12,
                color: AppColors.white,
                fontWeight: FontWeight.w900,
              )
                  : TextStyle(
                  fontFamily: FontConstants.FONT,
                  fontSize: 12,
                  color: AppColors.black,
                  fontWeight: FontWeight.w500),
              selected: selectedChoices.contains(item),
              backgroundColor: selectedChoices.contains(item)
                  ? AppColors.background_color
                  : AppColors.white,
              selectedColor: AppColors.background_color,
              onSelected: (selected) {
                setState(() {
                  selectedChoices.contains(item)
                      ? selectedChoices.remove(item)
                      : selectedChoices.add(item);
                  widget.onSelectionChanged(selectedChoices); // +added
                });

                //validator: (value) => value == null ? 'field required' : null;
              },
            ),
          ),
        );
      },
    );
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    //selectedChoices.add(widget.reportList.first);
    return Wrap(
      spacing: 10.0, // spacing between adjacent chips
      children: _buildChoiceList(),
    );
  }
}


