import 'package:flutter/material.dart';
import 'package:mus_greet/core/config/navigation.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/utils/routes.dart';
import 'package:mus_greet/core/widgets/action_button_widget.dart';
import 'package:mus_greet/core/widgets/advance_friend_search_context_widget.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';
import 'package:mus_greet/core/widgets/drop_down_text_field.dart';

class SearchInterestsScreen extends StatefulWidget {
  @override
  _SearchInterestsScreenState createState() => _SearchInterestsScreenState();
}

class _SearchInterestsScreenState extends State<SearchInterestsScreen> {
  final List<Widget> fieldList = List.empty(growable: true);

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
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 30),
        child: Column(
          children: [
            _getHeaderAndBack(),
            CustomSpacerWidget(
              height: 30,
            ),
            _getGenderAndAge(),
            CustomSpacerWidget(
              height: 10,
            ),
            _getLanguages(),
            CustomSpacerWidget(
              height: 10,
            ),
            _getInterests(),
            CustomSpacerWidget(
              height: 250,
            ),
            _getAddAndCancelButton(),
          ],
        ),
      ),
    );
  }


  _getHeaderAndBack() {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          height: 50,
          child: Text(
            AppTexts.SEARCH_INTERESTS,
            style: TextStyle(
              fontFamily: FontConstants.FONT,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
        ),
        Positioned(
          left: 0,
          top: 17,
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
    );
  }

  _getGenderAndAge() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Container(
              padding: EdgeInsets.only(left: 5, right: 5),
              child: DropDownTextField(
                fieldName: AppTexts.GENDAR,
                data: AppTexts.GENDER,
                callBack: (val) {
                  print(val);
                },
              ),
            ),
          ),
          CustomSpacerWidget(
            width: 15,
          ),
          Flexible(
            child: Container(
              padding: EdgeInsets.only(left: 5, right: 5),
              child: DropDownTextField(
                fieldName: AppTexts.AGE,
                data: AppTexts.DATES_CATEGORIES,
                callBack: (val) {
                  print(val);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  _getLanguages(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text( "Select",
          style: TextStyle(
            fontFamily: FontConstants.FONT,
            fontSize: 15,
            fontWeight: FontWeight.w900,
            color: AppColors.black,
          ),
        ),
        CustomSpacerWidget(
          height: 8,
        ),
        GestureDetector(
          onTap: (){
            ///Get Languages list here
            print("TEST");
            Navigation.intent(context, AppRoutes.LANGUAGES_SCREEN);
          },
          child: Material(
            elevation: 5,
            shadowColor: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.white,
                border: Border.all(color: AppColors.vertical_divider, width: 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomSpacerWidget(height: 5,),
                      Text(
                        AppTexts.LANGUAGES,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                          color: AppColors.black_50,
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: CustomSpacerWidget(
                      width: 5,
                    ),
                  ),
                  CustomSpacerWidget(width: 5,),
                  _getNextButton(),
                ],
              ),
            ),
          ),
        ),
      ],);
  }

  _getInterests(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text( "Select Interests",
          style: TextStyle(
            fontFamily: FontConstants.FONT,
            fontSize: 15,
            fontWeight: FontWeight.w900,
            color: AppColors.black,
          ),
        ),
        CustomSpacerWidget(
          height: 8,
        ),
        GestureDetector(
          onTap: (){
            ///Get Interests list here
              print("TEST");
              Navigation.intent(context, AppRoutes.INTEREST_SCREEN);
          },
          child: Material(
            elevation: 5,
            shadowColor: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.white,
                border: Border.all(color: AppColors.vertical_divider, width: 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomSpacerWidget(height: 5,),
                      Text(
                        "Football, Gardening, Swimming...",
                        //AppTexts.LANGUAGES,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                          color: AppColors.black_50,
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: CustomSpacerWidget(
                      width: 5,
                    ),
                  ),
                  CustomSpacerWidget(width: 5,),
                  _getNextButton(),
                ],
              ),
            ),
          ),
        ),
      ],);
  }

  _get(){
    return GestureDetector(
      onTap: (){
        ///Change Post Privacy here
      },
      child: Material(
        elevation: 5,
        shadowColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.white,
            border: Border.all(color: AppColors.vertical_divider, width: 1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomSpacerWidget(height: 5,),
                  Text(
                    AppTexts.LANGUAGES,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      color: AppColors.black_50,
                    ),
                  )
                ],
              ),
              Expanded(
                child: CustomSpacerWidget(
                  width: 5,
                ),
              ),
              CustomSpacerWidget(width: 5,),
              _getNextButton(),
            ],
          ),
        ),
      ),
    );
  }

  _getNextButton() {
    return Image.asset(
      ImageConstants.IC_FORWARD,
      height: 13,
      width: 13,
    );
  }

  _getAddAndCancelButton() {
    return Container(
      padding: EdgeInsets.only(left: 8, right: 8),
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
              text: AppTexts.SEARCH,
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