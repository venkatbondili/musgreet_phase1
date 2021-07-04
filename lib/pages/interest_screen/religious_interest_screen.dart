import 'dart:convert';

import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mus_greet/core/config/navigation.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/widgets/action_button_widget.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';
import 'package:mus_greet/models/MasterIntrests.dart';
import 'package:mus_greet/models/UserProfile.dart';
import 'package:mus_greet/pages/profile/view_profile_screen/view_profile_screen.dart';
import 'package:mus_greet/pages/interest_screen/multi_line_chip.dart';

import '../../main.dart';


class ReligiousInterestScreen extends StatefulWidget {
  List<UserProfile> userProfile;
  List<String> religiousData;
  ReligiousInterestScreen({this.userProfile,this.religiousData});
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
  String religious="";
  @override
  Widget build(BuildContext context) {
   // if(RELIGIOUS_INTRESTS.isEmpty) {
      return FutureBuilder<List<MasterIntrests>>(
        future: _getReligious(),
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
    //}

  }

  buildUi(List<MasterIntrests> intrests) {
    //_generatingReligious();
    getReligiousList();
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: _getBody(),
      ),
    );
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
      widget.religiousData,
      onSelectionChanged: (val) {
        // print(val);
        //setState(() {
          _selectedItems.clear();
          _selectedItems.addAll(val);
        //});
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
                //Navigation.back(context);
                print("Add");
                addVluestoreligiousIntrest();

              },
            ),
          ),
        ],
      ),
    );
  }

  addVluestoreligiousIntrest()
  {
    _generatingReligious();
    print(RELIGIOUSLIST);
    //religious=RELIGIOUSLIST.join(",");
    //print(religious=RELIGIOUSLIST.join(","));
    _UpdatingrReligious();
  }

  Future<List<MasterIntrests>> _getReligious() async
  {
    try {
      intrests = await Amplify.DataStore.query(MasterIntrests.classType);
      return intrests;
    }
    catch (e) {
      print("Could not query DataStore: " + e.stacktrace);
    }
  }

  getReligiousList()
  {
    RELIGIOUS_INTRESTS.clear();
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

  Future<void> _UpdatingrReligious() async
  {
    final updatedItem = widget.userProfile[0].copyWith(
        religious_interests: jsonEncode(RELIGIOUSLIST));
    await Amplify.DataStore.save(updatedItem);
    Navigator.pop(context,true);
  }

  Future<void> _generatingReligious() async
  {
    print("inside the religious list");
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


// class MultiSelectChip extends StatefulWidget {
//   final List<String> reportList;
//   final List<String> religiousData;
//   final Function(List<String>) onSelectionChanged;
//
//   MultiSelectChip(this.reportList, this.religiousData, {this.onSelectionChanged});
//
//   @override
//   _MultiSelectChipState createState() => _MultiSelectChipState();
// }
// class _MultiSelectChipState extends State<MultiSelectChip> {
//   List<String> selectedChoices = [];
//
//   void initState()
//   {
//     selectedChoices.clear();
//     print("inisde the init state");
//     selectedChoices =widget.religiousData;
//     print(widget.religiousData);
//     print(selectedChoices);
//   }
//
//
//   _buildChoiceList() {
//     List<Widget> choices = List.empty(growable: true);
//     widget.reportList.forEach(
//           (item) {
//         choices.add(
//           Theme(
//             data: ThemeData(canvasColor: Colors.transparent),
//             child: ChoiceChip(
//               padding: EdgeInsets.only(left: 5, right: 5),
//               side: BorderSide(
//                   width: 1,
//                   color: selectedChoices.contains(item)
//                       ? AppColors.background_color
//                       : AppColors.background_color),
//               label: Text(item),
//               labelStyle: selectedChoices.contains(item)
//                   ? TextStyle(
//                 fontFamily: FontConstants.FONT,
//                 fontSize: 12,
//                 color: AppColors.white,
//                 fontWeight: FontWeight.w900,
//               )
//                   : TextStyle(
//                   fontFamily: FontConstants.FONT,
//                   fontSize: 12,
//                   color: AppColors.black,
//                   fontWeight: FontWeight.w500),
//               //selected: selectedChoices.contains(item),
//               selected:  selectedChoices.contains(item),
//               backgroundColor: selectedChoices.contains(item)
//                   ? AppColors.background_color
//                   : AppColors.white,
//               selectedColor: AppColors.background_color,
//               onSelected: (selected) {
//                 setState(() {
//                   // selectedChoices.contains(item)
//                   //     ? selectedChoices.remove(item)
//                   //     : selectedChoices.add(item);
//                   print("inside the set state");
//                   print(selectedChoices.contains(item));
//                   if(!selectedChoices.contains(item))
//                     {
//                       print(item);
//                       print("selecting the item");
//                       selectedChoices.add(item);
//                       print(selectedChoices);
//                     }
//                   widget.onSelectionChanged(selectedChoices); // +added
//                 });
//               },
//             ),
//           ),
//         );
//       },
//     );
//     return choices;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     //selectedChoices.add(widget.reportList.first);
//     return Wrap(
//       spacing: 10.0, // spacing between adjacent chips
//       children: _buildChoiceList(),
//     );
//   }
// }