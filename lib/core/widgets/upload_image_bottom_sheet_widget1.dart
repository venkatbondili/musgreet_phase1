import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mus_greet/core/config/navigation.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';


///Call this widget like this
/*_handleSearch() {
  print("Handle Search!!");
  showModalBottomSheet(
    elevation: 15,
    enableDrag: true,
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: UploadImageBottomSheetWidget(),
      );
    },
  );
}*/


class UploadImageBottomSheetWidget extends StatefulWidget {
  @override
  _UploadImageBottomSheetWidgetState createState() =>
      _UploadImageBottomSheetWidgetState();
}

class _UploadImageBottomSheetWidgetState
    extends State<UploadImageBottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _getButtons(),
    );
  }

  _getSelectImageSourceButton({String buttonText, bool isCancel = false}) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 25, top: 25),
      child: Text(
        buttonText,
        style: TextStyle(
            fontFamily: FontConstants.FONT,
            fontSize: 16,
            fontWeight: isCancel ? FontWeight.w500 : FontWeight.w900,
            color: isCancel ? AppColors.vertical_divider : AppColors.black),
      ),
    );
  }

  _getButtons() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: AppColors.white),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomSpacerWidget(height: 5,),
          GestureDetector(
            onTap: ()=> _handleOpenGallery(),
            child: _getSelectImageSourceButton(
              buttonText: AppTexts.GALLERY,
            ),
          ),
          Divider(
            height: 5,
            thickness: 0.5,
            color: AppColors.vertical_divider.withOpacity(0.3),
          ),
          GestureDetector(
            onTap: ()=> _handleOpenCamera(),
            child: _getSelectImageSourceButton(
              buttonText: AppTexts.CAMERA,
            ),
          ),
          Divider(
            height: 5,
            thickness: .5,
            color: AppColors.vertical_divider.withOpacity(0.3),
          ),
          GestureDetector(
            onTap: () => _handleCancel(),
            child: _getSelectImageSourceButton(
              buttonText: AppTexts.CANCEL,
              isCancel: true,
            ),
          )
        ],
      ),
    );
  }

  _handleCancel(){
    print("Navigation Back");
    Navigation.back(context);
  }

  _handleOpenCamera(){
    print("Open camera");
  }

  _handleOpenGallery(){
    print("open gallery");
  }
}
