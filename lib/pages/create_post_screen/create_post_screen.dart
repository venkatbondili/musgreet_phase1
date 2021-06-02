import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mus_greet/core/config/navigation.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/utils/routes.dart';
import 'package:mus_greet/core/widgets/action_button_widget.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';
import 'package:mus_greet/core/widgets/media_source_widget.dart';
import 'package:mus_greet/core/widgets/rounded_button_widget.dart';

class CreatePostScreen extends StatefulWidget {
  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final TextEditingController _thoughtsController = TextEditingController();

  var pickedFile;
  var filepath = '';
  File _image;

  Future getImage(bool isCamera) async {

    final picker = ImagePicker();

    if (isCamera) {
      final pickedFile = await picker.getImage(source: ImageSource.camera);
    }
    else {
      final pickedFile = await picker.getImage(source: ImageSource.gallery);
    }

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        filepath = pickedFile.path;
      } else {
        filepath = 'assets/images/google.png';
        print('No image selected.');
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: _getAppBar(),
        body: _getBody(),
      ),
    );
  }

  _getBody() {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _getUserDataAndPost(),
            CustomSpacerWidget(
              height: 10,
            ),
            _getMediaPickerSection(),
            CustomSpacerWidget(
              height: 30,
            ),
            _getPrivacyOfUser(),
            CustomSpacerWidget(
              height: 80,
            ),
            _getAddAndCancelButton(),
          ],
        ),
      ),
    );
  }

  _getAppBar() {
    return AppBar(
      elevation: 2,
      backgroundColor: AppColors.white,
      toolbarHeight: 70,
      centerTitle: true,
      title: Container(
        padding: EdgeInsets.only(top: 15),
        child: Text(
          AppTexts.CREATE_POST,
          style: TextStyle(
              fontSize: 20,
              color: AppColors.black,
              fontFamily: FontConstants.FONT,
              fontWeight: FontWeight.bold),
        ),
      ),
      leading: Container(
        padding: EdgeInsets.only(top: 15, left: 20, right: 20),
        child:GestureDetector(
          onTap: ()=> Navigation.intent(context, AppRoutes.HOME),
          child: AssetImageWidget(
            image: ImageConstants.IC_BACK,
            height: 10,
            width: 10,
          ),
        ),
      ),
    );
  }

  _getUserDataAndPost() {
    return Material(
      elevation: 5,
      shadowColor: AppColors.white,
      color: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          _getHeader(),
          Divider(
            color: AppColors.light_grey,
            thickness: 1.5,
          ),
          _getTextSection(),
        ],
      ),
    );
  }

  _getHeader() {
    return Container(
      padding: EdgeInsets.only(top: 15,bottom: 5,left: 15,right: 15),
      child: Row(
        children: [
          _getProfileImage(),
          CustomSpacerWidget(
            width: 5,
          ),
          _getUserName(),
        ],
      ),
    );
  }

  /// This will return profile image.
  _getProfileImage() {
    return AssetImageWidget(
      image: ImageConstants.IC_HOME_USER1,
      height: 50,
      width: 50,
    );
  }

  _getUserName() {
    return Text(
      AppTexts.TEMP_USER_NAME,
      style: TextStyle(
        fontFamily: FontConstants.FONT,
        fontSize: 13,
        fontWeight: FontWeight.w800,
        color: AppColors.black,
      ),
    );
  }

  _getTextSection() {
    return Container(
      height: 300,
      padding: EdgeInsets.only(top: 0, left: 20, right: 20),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: CreatePostTextFieldWidget(
              controller: _thoughtsController,
              hintText: AppTexts.YOUR_THOUGHTS,
            ),
          ),

          //Here the rest Text will come if there,
          Expanded(flex: 2, child: Container())
        ],
      ),
    );
  }

  _getMediaPickerSection() {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.light_grey.withOpacity(0.5),
      ),
      child: Row(
        children: [
          Expanded(
            child: MediaSourceWidget(
              image: ImageConstants.IC_CAMERA,
              text: AppTexts.CAMERA_TEXT,
            ),
          ),
          CustomSpacerWidget(
            width: 8,
          ),
          Expanded(
            child: MediaSourceWidget(
              image: ImageConstants.IC_CAMERA,
              text: AppTexts.GALLERY_TEXT,
            ),
          ),
        ],
      ),
    );
  }

  _handleOpenCamera(){
    print("Open camera");
    getImage(true);
    //Navigator.of(context)
    //  .push(MaterialPageRoute(builder: (context) => PhoneGallery()));
  }

  _handleOpenGallery(){
    print("open gallery");
    getImage(false);
  }

  _getPrivacyOfUser() {
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
              borderRadius: BorderRadius.circular(12), color: AppColors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppTexts.POST_VISIBILITY,
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 12,
                      color: AppColors.black,
                    ),
                  ),
                  CustomSpacerWidget(height: 5,),
                  Text(
                    AppTexts.PUBLIC_TEXT,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      color: AppColors.light_grey,
                    ),
                  )
                ],
              ),
              Expanded(
                child: CustomSpacerWidget(
                  width: 5,
                ),
              ),
              _getChangeText(),
              CustomSpacerWidget(width: 5,),
              _getNextButton(),
            ],
          ),
        ),
      ),
    );
  }

  _getChangeText() {
    return Text(
      AppTexts.CHANGE_TEXT,
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 13,
        color: AppColors.light_grey,
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
              text: AppTexts.SAVE,
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

/// this will render text field on the screen
class CreatePostTextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;

  CreatePostTextFieldWidget({this.controller, this.hintText});

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<CreatePostTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5, top: 5),
      child: TextField(
        controller: widget.controller,
        maxLines: null,
        expands: true,
        style: TextStyle(
          fontWeight: FontWeight.w900,
          fontFamily: FontConstants.FONT,
          fontSize: 16,
          color: AppColors.black,
        ),
        decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextStyle(
              fontFamily: FontConstants.FONT,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.light_grey,
            ),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            contentPadding: EdgeInsets.only(bottom: 10)),
      ),
    );
  }
}
