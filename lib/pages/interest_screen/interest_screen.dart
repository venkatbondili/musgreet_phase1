import 'package:flutter/material.dart';
import 'package:mus_greet/core/config/navigation.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/widgets/action_button_widget.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';
import 'package:mus_greet/pages/add_skills_screen/add_skills_screen.dart';

class InterestScreen extends StatefulWidget {
  @override
  _InterestScreenState createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {
  final List<String> _selectedHobbies = List.empty(growable: true);
  final List<String> _selectedSportsAndExercise = List.empty(growable: true);
  final List<String> _selectedFamilyAndOutDoors = List.empty(growable: true);
  final List<String> _selectedVolunteer = List.empty(growable: true);
  final List<String> _selectedCommunityInvolvement = List.empty(growable: true);

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
                    categories: AppTexts.HOBIE_CATEGORIES,
                    data: _selectedHobbies),
                _getChipsAndHeaders(
                    header: AppTexts.INTEREST_SPORTS_EXERCISE,
                    categories: AppTexts.SPORTS_EXERCISE_CATEGORIES,
                    data: _selectedSportsAndExercise),
                _getChipsAndHeaders(
                    header: AppTexts.INTEREST_FAMILY_OUTDOOR,
                    categories: AppTexts.FAMILY_OUTDOORS_CATEGORIES,
                    data: _selectedFamilyAndOutDoors),
                _getChipsAndHeaders(
                    header: AppTexts.INTEREST_VOLUNTEER,
                    categories: AppTexts.VOLUNTEER_CATEGORIES,
                    data: _selectedVolunteer),
                _getChipsAndHeaders(
                    header: AppTexts.INTEREST_COMMUNITY_INVOLVEMENT,
                    categories: AppTexts.COMMUNITY_INVOLVEMENT_CATEGORIES,
                    data: _selectedCommunityInvolvement),
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
        MultiSelectChip(
          categories,
          onSelectionChanged: (val) {
            // print(val);
            setState(() {
              data.clear();
              data.addAll(val);
            });
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
                Navigation.back(context);
                print("Cancel");
              },
            ),
          ),
        ],
      ),
    );
  }
}
