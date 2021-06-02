import 'package:flutter/material.dart';
import 'package:mus_greet/core/config/navigation.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/widgets/action_button_widget.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';
import 'package:mus_greet/core/widgets/drop_down_text_field.dart';

class SearchEducationScreen extends StatefulWidget {
  @override
  _SearchEducationScreenState createState() => _SearchEducationScreenState();
}

class _SearchEducationScreenState extends State<SearchEducationScreen> {
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
            _getListOfInfo(),
            CustomSpacerWidget(
              height: 350,
            ),
            _getAddAndCancelButton(),
          ],
        ),
      ),
    );
  }

  _getListOfInfo() {
    return Column(
      children: [
        _getSchoolCollegeDropDown(),
        CustomSpacerWidget(
          height: 15,
        ),
        _getFromAndToDates(),
      ],
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
            AppTexts.SEARCH_EDUCATION,
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

  _getSchoolCollegeDropDown() {
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5),
      child: DropDownTextField(
        fieldName: AppTexts.ADD_YOUR_SCHOOL_COLLEGE,
        data: AppTexts.COLLEGE_CATEGORIES,
        callBack: (val) {
          print(val);
        },
      ),
    );
  }



  _getFromAndToDates() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Container(
              padding: EdgeInsets.only(left: 5, right: 5),
              child: DropDownTextField(
                fieldName: AppTexts.ADD_FROM,
                data: AppTexts.DATES_CATEGORIES,
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
                fieldName: AppTexts.ADD_TO,
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