import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:mus_greet/core/config/navigation.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/widgets/action_button_widget.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';
import 'package:mus_greet/models/MasterIntrests.dart';
import 'package:mus_greet/models/UserProfile.dart';
import 'package:mus_greet/pages/profile/view_profile_screen/view_profile_screen.dart';

import '../../main.dart';


class ReligiousInterestScreen extends StatefulWidget {
  @override
  _ReligiousInterestScreenState createState() => _ReligiousInterestScreenState();
}
class _ReligiousInterestScreenState extends State<ReligiousInterestScreen> {
  final List<String> _selectedItems = List.empty(growable: true);
  List<MasterIntrests> intrests;
  List<UserProfile> userProfile;
  List<String> RELIGIOUS_INTRESTS=[];
  List<String> idIntrset;
  List<String> RELIGIOUS_INTRESTS_List_ID=[];
  List<String> RELIGIOUSLIST=[];
  String religious;
  @override
  Widget build(BuildContext context) {
    if(RELIGIOUS_INTRESTS.isEmpty) {
      _getReligious();
    }
    _generatingReligious();
    _userProfile();
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
            AppTexts.ADD_RELIGIONS,
            style: TextStyle(
              fontFamily: FontConstants.FONT,
              fontSize: 25,
              fontWeight: FontWeight.w900,
              color: AppColors.black,
            ),
          ),
          Text(
            AppTexts.CHOOSE_RELIGIONS,
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
      RELIGIOUS_INTRESTS,
      onSelectionChanged: (val) {
        // print(val);
        setState(() {
          _selectedItems.clear();
          _selectedItems.addAll(val);
        });
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
                Navigation.back(context);
                print("Add");
                print(RELIGIOUSLIST);
                religious=RELIGIOUSLIST.join(",");
                print(religious=RELIGIOUSLIST.join(","));
                _UpdatingrReligious();
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _userProfile() async
  {
    userProfile=await Amplify.DataStore.query(UserProfile.classType , where :UserProfile.ID.eq("8f826f1a-91e6-4cf7-a396-b2fb47045a96"));
    print("Inside the User Profile data store skills");
  }
  Future<void> _getReligious() async
  {

    try {
      intrests = await Amplify.DataStore.query(MasterIntrests.classType);
      for(int i=0;i<intrests.length;i++)
      {
        if(intrests[i].category_name =="Religious Interests")
        {
          RELIGIOUS_INTRESTS.add(intrests[i].intrest_name);
        }
      }
      print("Get Religious Method");
      print(RELIGIOUS_INTRESTS);

    }
    catch (e) {
      print("Could not query DataStore: " + e.stacktrace);
    }
  }

  Future<void> _UpdatingrReligious() async
  {
    final updatedItem = userProfile[0].copyWith(
        bio: userProfile[0].bio,
        relationship_status: userProfile[0].relationship_status,
        languages_spoken:  userProfile[0].languages_spoken,
        sect: userProfile[0].sect,
        are_you_revert: true,
        islam_interest: true,
        profile_privacy: userProfile[0].profile_privacy,
        community_interests: userProfile[0].community_interests,
        skills:  userProfile[0].skills,
        religious_interests: religious,
        usersID: userProfile[0].usersID);
    await Amplify.DataStore.save(updatedItem);

  }

  Future<void> _generatingReligious() async
  {
    print("inside the geneating");
    for(int i=0;i<_selectedItems.length;i++)
    {
      print(_selectedItems[i]);
      String nameOfReligious=_selectedItems[i];
      for(int i=0;i<intrests.length;i++)
      {
        if(intrests[i].category_name =="Religious Interests") {
          if (nameOfReligious == intrests[i].intrest_name) {
            RELIGIOUSLIST.add(intrests[i].id);
            print(RELIGIOUSLIST);
            print(intrests[i].id);
          }
        }
      }
    }

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