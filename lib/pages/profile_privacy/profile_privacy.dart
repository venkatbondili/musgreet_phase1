
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mus_greet/core/config/navigation.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/widgets/action_button_widget.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';
import 'package:mus_greet/core/widgets/drop_down_text_field.dart';
import 'package:mus_greet/models/UserProfile.dart';
import 'package:mus_greet/models/Users.dart';

import '../../main.dart';

class ProfilePrivacy extends StatefulWidget {
  Users sessionUser;
  ProfilePrivacy({this.sessionUser});
  @override
  _ProfilePrivacyState createState() => _ProfilePrivacyState();
}


class _ProfilePrivacyState extends State<ProfilePrivacy> {


  List<UserProfile> userProfile;
  String member;
  String loggedInUser;
  final _profilePrivacy =GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    loggedInUser=widget.sessionUser.id;
    about();
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
            width: MediaQuery
                .of(context)
                .size
                .width,
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 30),
            child: Column(
                children: [
                  _getHeaderAndBack(),
                  CustomSpacerWidget(
                    height: 30,
                  ),
                  Container(
                    child: Form(
                      key: _profilePrivacy,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        children: [
                          _getProfilePolicy(),
                        ],
                      ),
                    ),
                  ),
                  //_getProfilePolicy(),
                  CustomSpacerWidget(
                    height: 30,
                  ),
                  _getSaveButton(),

                ]
            )
        )

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
            AppTexts.ISLAM_INTREST,
            style: TextStyle(
              fontFamily: FontConstants.FONT,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
        ),
        Positioned(
          left: 0,
          top: 17,
          child: GestureDetector(
            onTap: () {
              Navigation.back(context);
            },
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

  _getProfilePolicy() {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Container(
              padding: EdgeInsets.only(left: 5, right: 5),
              child: DropDownTextField(
                fieldName: AppTexts.PROFILE_POLICY,
                data: AppTexts.PROFILE_PRIVACY,
                callBack: (val) {
                  print(val);
                  member =val;
                  print("selecting the value");
                },
              ),
            ),
          ),
          CustomSpacerWidget(
            width: 15,
          ),
        ],
      ),
    );
  }

  _getSaveButton() {
    return Row(
      children: [
        Expanded(
          child: ActionButtonWidget(
            callBack: () {
              // Navigation.back(context);
              print("updating the database");
              if(_profilePrivacy.currentState.validate()) {
                updateUserProfile(member);
                Navigator.pop(context, true);
              }
            },
            text: AppTexts.SAVE,
            isFilled: true,
          ),
        ),
      ],
    );
  }

  Future<void> about() async {
    try {
      userProfile = await Amplify.DataStore.query(UserProfile.classType,
          where: UserProfile.USERSID.eq(loggedInUser));
      print(userProfile);
      print("inside the user profile");
    } catch (e) {
      print("Could not query DataStore: " + e);
    }
  }


  updateUserProfile(String policy) async
  {
    final updatedItem = userProfile[0].copyWith(

     profile_privacy: policy);

    await Amplify.DataStore.save(updatedItem);
  }

}
