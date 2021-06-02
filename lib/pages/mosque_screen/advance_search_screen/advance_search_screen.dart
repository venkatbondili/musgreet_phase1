import 'package:flutter/material.dart';
import 'package:mus_greet/core/config/navigation.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/widgets/action_button_widget.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';
import 'package:mus_greet/pages/add_skills_screen/add_skills_screen.dart';

class AdvanceSearchScreen extends StatefulWidget {
  @override
  _AdvanceSearchScreenState createState() => _AdvanceSearchScreenState();
}

class _AdvanceSearchScreenState extends State<AdvanceSearchScreen> {
  final List<String> _selectedReligion = List.empty(growable: true);
  final List<String> _selectPreference = List.empty(growable: true);

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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _getHeaderAndBack(),
            CustomSpacerWidget(
              height: 15,
            ),
            _getChipsAndHeaders(
                header: AppTexts.LABEL_SELECT,
                categories: AppTexts.RELIGION_CATEGORIES,
                data: _selectedReligion),
            CustomSpacerWidget(
              height: 30,
            ),
            _getChipsAndHeaders(
              header: AppTexts.SEARCH_BASED_ON_FACILITIES,
              categories: AppTexts.FACILITIES_CATEGORIES,
              data: _selectPreference,
            ),
            CustomSpacerWidget(height: 25,),
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
            AppTexts.ADVANCE_SEARCH,
            style: TextStyle(
              fontFamily: FontConstants.FONT,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: AppColors.header_black,
            ),
          ),
        ),
        Positioned(
          left: 0,
          top: 17,
          child:GestureDetector(
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

  _getChipsAndHeaders(
      {String header, List<String> data, List<String> categories}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            header,
            style: TextStyle(
              fontFamily: FontConstants.FONT,
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.header_black,
            ),
          ),
        ),
        CustomSpacerWidget(
          height: 0,
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
          width: 0.5,
          fontSize: 12,
        ),
      ],
    );
  }


  _getAddAndCancelButton(){
    return Container(
      padding: EdgeInsets.only(left: 10,right: 10),
      child: Row(
        children: [
          ActionButtonWidget(
            text: AppTexts.CANCEL,
            isFilled: false,
            callBack: (){
              print("Cancel");
            },
          ),
          CustomSpacerWidget(width: 20,),
          Expanded(
            child: ActionButtonWidget(
              text: AppTexts.APPLY_TEXT,
              isFilled: true,
              callBack: (){
                print("Apply");
              },
            ),
          ),
        ],
      ),
    );
  }
}
