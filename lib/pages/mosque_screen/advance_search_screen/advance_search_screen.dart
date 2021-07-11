import 'package:flutter/material.dart';
import 'package:mus_greet/core/config/navigation.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/utils/routes.dart';
import 'package:mus_greet/core/widgets/action_button_widget.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';
import 'package:mus_greet/models/ModelProvider.dart';
import 'package:mus_greet/pages/add_skills_screen/add_skills_screen.dart';
//import 'package:mus_greet/pages/interest_screen/multi_line_chip.dart';
import 'package:mus_greet/pages/mosque_screen/mosque_search_list_view/mosque_search_list_view.dart';

class AdvanceSearchScreen extends StatefulWidget {
  final Users sessionUser;
  AdvanceSearchScreen({this.sessionUser}) ;
  @override
  _AdvanceSearchScreenState createState() => _AdvanceSearchScreenState();
}

class _AdvanceSearchScreenState extends State<AdvanceSearchScreen> {
  final List<String> _selectedReligion = List.empty(growable: true);
  final List<String> _selectPreference = List.empty(growable: true);
  static const List<String> _selected = [];

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
         // _selected,
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
              Navigation.back(context);
             // _navigationToSearch();
            },
          ),
          CustomSpacerWidget(width: 20,),
          Expanded(
            child: ActionButtonWidget(
              text: AppTexts.APPLY_TEXT,
              isFilled: true,
              callBack: (){
                print(_selectedReligion);
                print(_selectPreference);
                print("Apply");
                _navigationToSearch();
              },
            ),
          ),
        ],
      ),
    );
  }

  _navigationToSearch() {
    //_selectedReligion.clear();
    //_selectPreference.clear();
    Navigation.intentWithData(context, AppRoutes.MOSQUE_SEARCH_LIST_VIEW,ArgumentClass(_selectedReligion,_selectPreference,widget.sessionUser));

  }
}


class MultiSelectChip extends StatefulWidget {
  final List<String> reportList;
  final Function(List<String>) onSelectionChanged;
  final double width;
  final double fontSize;

  MultiSelectChip(this.reportList, {this.onSelectionChanged,this.fontSize=12,this.width=1});

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
                  width: widget.width,
                  color: selectedChoices.contains(item)
                      ? AppColors.background_color
                      : AppColors.background_color),
              label: Text(item),
              labelStyle: selectedChoices.contains(item)
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
