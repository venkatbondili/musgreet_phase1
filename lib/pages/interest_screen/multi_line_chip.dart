

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mus_greet/core/utils/constants.dart';

class MultiSelectChip extends StatefulWidget {
  final List<String> reportList;
  final List<String> intrestData;
  final Function(List<String>) onSelectionChanged;
  final double width;
  final double fontSize;

  MultiSelectChip(this.reportList,this.intrestData, {this.onSelectionChanged,this.fontSize=12,this.width=1});

  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  List<String> selectedChoices = List.empty(growable: true);
 // List<String> selectedChoices=

  void initState()
  {
    selectedChoices.clear();
    print("inisde the init state");
    selectedChoices =widget.intrestData;
    print(widget.intrestData);
    print(selectedChoices);
  }


  _buildChoiceList() {
    List<Widget> choices = List.empty(growable: true);
    choices.clear();
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
                  widget.onSelectionChanged(selectedChoices); //+added
                });
              },
            ),
          ),
        );
      },
    );
    print(choices);
    print("List of choices");
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