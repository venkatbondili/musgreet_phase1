import 'dart:async';
import 'dart:convert';

import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:mus_greet/core/config/navigation.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/widgets/action_button_widget.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';
import 'package:mus_greet/main.dart';
import 'package:mus_greet/models/MasterIntrests.dart';
import 'package:mus_greet/models/UserProfile.dart';
//import 'package:mus_greet/pages/add_skills_screen/add_skills_screen.dart';
import 'package:mus_greet/pages/interest_screen/multi_line_chip.dart';

class InterestScreen extends StatefulWidget {
  List<UserProfile> userProfile;
  List<String> intrestData;
  InterestScreen({this.userProfile, this.intrestData});
  @override
  _InterestScreenState createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {
  List<MasterIntrests> intrests;
  //List<UserProfile> userProfile=[];
  List<String> idIntrest;
  List<String> HOBIE_CATEGORIES=[] ;
  List<String> COMMUNITYINTREST =[];
  List<String> SPORTS_EXERCISE_CATEGORIES=[];
  List<String> FAMILY_OUTDOORS_CATEGORIES=[];
  List<String> VOLUNTEER_CATEGORIES=[];
  List<String> COMMUNITY_INVOLVEMENT_CATEGORIES=[];
  String communityIntrest="";
   final List<String> _selectedIntrests = [];
  final List<String> _selectedSports = [];
  final List<String> _selectedFamily = [];
  final List<String> _selectedVolunteer= [];
  final List<String> _selectedCommunity= [];
  List<String> intrestData=[];


   //List<String> _selectedSportsAndExercise =List.empty(growable: true);//final List<String> _selectedFamilyAndOutDoors = List.empty(growable: true);
  //final List<String> _selectedVolunteer = List.empty(growable: true);
  //final List<String> _selectedCommunityInvolvement = List.empty(growable: true);




  @override
  Widget build(BuildContext context) {
    print("inside the build context");

    //print(widget.userProfile);
    return FutureBuilder<List<MasterIntrests>>(
      future: getIntrest(),
      builder: (ctx, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            intrests = snapshot.data;
            return buildUi(intrests);
          default:
            return _buildLoadingScreen();
        }
      },
    );
  }


    buildUi(List<MasterIntrests> intrests)
    { print("inside the build List");
    //_generatingListId();
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: _getBody(),
      ),
    );
    }




  _getBody() {
    _getIntrestList();
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 30, right: 20, top: 60, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _getHeader(),
                CustomSpacerWidget(
                  height: 25,
                ),
                _getChipsAndHeaders(
                    header: AppTexts.INTEREST_TEXT_HEADER,
                    categories: HOBIE_CATEGORIES,
                    data: _selectedIntrests),
                _getChipsAndHeaders(
                    header: AppTexts.INTEREST_SPORTS_EXERCISE,
                    categories: SPORTS_EXERCISE_CATEGORIES,
                    data: _selectedSports),
                _getChipsAndHeaders(
                    header: AppTexts.INTEREST_FAMILY_OUTDOOR,
                    categories: FAMILY_OUTDOORS_CATEGORIES,
                    data: _selectedFamily),
                _getChipsAndHeaders(
                    header: AppTexts.INTEREST_VOLUNTEER,
                    categories: VOLUNTEER_CATEGORIES,
                    data: _selectedVolunteer),
                _getChipsAndHeaders(
                    header: AppTexts.INTEREST_COMMUNITY_INVOLVEMENT,
                    categories: COMMUNITY_INVOLVEMENT_CATEGORIES,
                    data: _selectedCommunity),
                CustomSpacerWidget(
                  height: 30,
                ),
                _getAddAndCancelButton(),

              ],
            ),
          ),
          Positioned(
            left: 20,
            top: 35,
            child: GestureDetector(
              onTap: ()=> Navigation.back(context),
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
            AppTexts.INTEREST_TEXT_HEADER,
            style: TextStyle(
              fontFamily: FontConstants.FONT,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
          Text(
            AppTexts.CHOOSE_INTEREST,
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

  _getChipsAndHeaders(
      {String header, List<String> data, List<String> categories}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomSpacerWidget(
          height: 10,
        ),
        Text(
          header,
          style: TextStyle(
            fontFamily: FontConstants.FONT,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
        ),
        CustomSpacerWidget(
          height: 10,
        ),
        // MultiSelectChip(
        //   categories,
        //   //_selectedIntrests,MultiSelectChip
        //   onSelectionChanged: (val) {
        //     print("selecting the value");
        //      print(val);
        //     setState(() {
        //       data.clear();
        //       data.addAll(val);
        //     });
        //   },
        // ),
        MultiSelectChip(
          categories,
          widget.intrestData,
         //communityIntrest,
          onSelectionChanged: (val) {
            print("inisde the on selection changed");
             print(val);
           // setState(() {
              data.clear();
              data.addAll(val);
            //});
          },
        ),
        CustomSpacerWidget(
          height: 10,
        ),
      ],
    );
  }




  _getAddAndCancelButton() {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        children: [
          ActionButtonWidget(
            text: AppTexts.CANCEL,
            isFilled: false,
            callBack: () {
              Navigation.back(context);
            },
          ),
          CustomSpacerWidget(width: 20,),
          Expanded(
            child: ActionButtonWidget(
              text: AppTexts.ADD,
              isFilled: true,
              callBack: () {
                //_navigateToBackScreen(context);
                print(_selectedIntrests);
                print("action button");
                addValuesToIntrests();
               // print("Cancel");
              },
            ),
          ),
        ],
      ),
    );
  }


  // Future<void> getIntrests() async
  // {
  //
  //   try {
  //     userProfile = await Amplify.DataStore.query(UserProfile.classType , where:UserProfile.ID.eq("e12a41ad-653e-4208-a31c-f38f64b03857"));
  //     print(userProfile);
  //     print("inside the Intest");
  //     //print(mosque[22]);
  //   } catch (e) {
  //     print("Could not query DataStore: " + e.StackTrace);
  //   }
  // }

  Future<List<MasterIntrests>> getIntrest() async{
    try {
      intrests = await Amplify.DataStore.query(MasterIntrests.classType);
      print("inside the data store");
      print(intrests);
      return intrests;
    } catch (e) {
      print("Could not query DataStore: " + e);
    }

  }

  _getIntrestList()
  {
    HOBIE_CATEGORIES.clear();
    SPORTS_EXERCISE_CATEGORIES.clear();
    VOLUNTEER_CATEGORIES.clear();
    FAMILY_OUTDOORS_CATEGORIES.clear();
    COMMUNITY_INVOLVEMENT_CATEGORIES.clear();
    for(int i=0 ;i<intrests.length;i++)
    {
      print(intrests[i].category_name);
       if(intrests[i].category_name =="Hobbie")
    {
      print(i);
      print(intrests[i].intrest_name);
      HOBIE_CATEGORIES.add(intrests[i].intrest_name);
    }else if(intrests[i].category_name == "Sports And Exercise")
    {
      SPORTS_EXERCISE_CATEGORIES.add(intrests[i].intrest_name);
    }
    else if(intrests[i].category_name =="Family And Outdoors")
    {

      FAMILY_OUTDOORS_CATEGORIES.add(intrests[i].intrest_name);
    }else if(intrests[i].category_name == "Volunteer")
    {

      VOLUNTEER_CATEGORIES.add(intrests[i].intrest_name);
    }else if(intrests[i].category_name == "Community Involvement")
    {

      COMMUNITY_INVOLVEMENT_CATEGORIES.add(intrests[i].intrest_name);
    }
    }
  }


  _generatingListId()
  {
    print("checkig the list of selected data");
    print(_selectedIntrests);
    for(int i=0;i<_selectedIntrests.length;i++)
      {
        String nameOfHobby=_selectedIntrests[i];
        for(int i=0;i<intrests.length;i++)
          {
            if(nameOfHobby ==intrests[i].intrest_name)
              {
                COMMUNITYINTREST.add(intrests[i].id);
                print("Inside the List");
                print(COMMUNITYINTREST);
                print(intrests[i].id);
              }
          }
      }

    for(int i=0;i<_selectedSports.length;i++)
    {

      String nameOfSports=_selectedSports[i];
      for(int i=0;i<intrests.length;i++)
      {
        if(nameOfSports ==intrests[i].intrest_name)
        {
          COMMUNITYINTREST.add(intrests[i].id);
          print("Inside the List");
          print(COMMUNITYINTREST);
          print(intrests[i].id);
        }
      }
    }

    for(int i=0;i<_selectedFamily.length;i++)
    {

      String nameOfFamily=_selectedFamily[i];
      for(int i=0;i<intrests.length;i++)
      {
        if(nameOfFamily ==intrests[i].intrest_name)
        {
          COMMUNITYINTREST.add(intrests[i].id);
          print("Inside the List");
          print(COMMUNITYINTREST);
          print(intrests[i].id);
        }
      }
    }

    for(int i=0;i<_selectedVolunteer.length;i++)
    {

      String nameOfVolunteer=_selectedVolunteer[i];
      for(int i=0;i<intrests.length;i++)
      {
        if(nameOfVolunteer ==intrests[i].intrest_name)
        {
          COMMUNITYINTREST.add(intrests[i].id);
          print("Inside the List");
          print(COMMUNITYINTREST);
          print(intrests[i].id);
        }
      }
    }

    for(int i=0;i<_selectedCommunity.length;i++)
    {

      String nameOfCommunity=_selectedCommunity[i];
      for(int i=0;i<intrests.length;i++)
      {
        if(nameOfCommunity ==intrests[i].intrest_name)
        {
          COMMUNITYINTREST.add(intrests[i].id);
          print("Inside the List");
          print(COMMUNITYINTREST);
          print(intrests[i].id);
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

  Future<void> _UpdatingIntrest() async
  {
    print(communityIntrest);
    print("updating the user");
    //print(widget.userProfile);
   // print(widget.userProfile[0].community_interests);
      final updatedItem = widget.userProfile[0].copyWith(

          //community_interests: communityIntrest
          community_interests: jsonEncode(COMMUNITYINTREST));

      await Amplify.DataStore.save(updatedItem);
    //await Future.delayed(const Duration(seconds: 3));
    print("updating the user Profile");
    print(updatedItem);
    Timer(Duration(seconds: 2),()=> _navigateToback());

    print(communityIntrest);
    //Navigation.back(context);
   Navigator.pop(context,true);

  }

  _navigateToback()
  {
    Navigator.pop(context,true);
  }

  void addValuesToIntrests() {
     print("Add Button");
    _generatingListId();
     print("List of the Intest");
     print(intrestData);
    print("Before the Intrest");
    print(COMMUNITYINTREST);
    //communityIntrest=COMMUNITYINTREST.join(",");
     
    // communityIntrest=jsonEncode(COMMUNITYINTREST);
    print(communityIntrest);
    _UpdatingIntrest();
    // Navigator.pop(context, communityIntrest);

  }



}



