import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mus_greet/core/utils/constants.dart';

import 'advance_search_widget.dart';
import 'custom_spacer_widget.dart';

class AdvanceSearchWidgetMosque extends StatefulWidget {
  final Function callBack;

  const AdvanceSearchWidgetMosque({Key key, this.callBack}) : super(key: key);

  @override
  _AdvanceSearchWidgetState createState() => _AdvanceSearchWidgetState();
}

class _AdvanceSearchWidgetState extends State<AdvanceSearchWidgetMosque> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.callBack(),
      child: Container(
        padding: EdgeInsets.all(7),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.white_shade),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _getAdvanceSearchIcon(),
            CustomSpacerWidget(
              width: 6,
            ),
            _getAdvanceSearchText(),
          ],
        ),
      ),
    );
  }

  _getAdvanceSearchIcon() {
    return SvgPicture.asset(
      ImageConstants.IC_ADVANCE_SEARCH,
      height: 15,
      width: 12,
      color: AppColors.black,
    );
  }

  _getAdvanceSearchText() {
    return Container(
      alignment: Alignment.center,
      child: Text(
        AppTexts.ADVANCE_SEARCH,
        style: TextStyle(
            fontFamily: FontConstants.FONT,
            fontWeight: FontWeight.normal,
            fontSize: 12,
            color: AppColors.header_black),
      ),
    );
  }
}
