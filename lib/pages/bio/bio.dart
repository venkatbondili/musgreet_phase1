
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
import 'package:mus_greet/core/widgets/my_family_text_field_heading_widget.dart';
import 'package:mus_greet/models/ModelProvider.dart';
import 'package:mus_greet/models/UserProfile.dart';
import 'package:mus_greet/pages/create_post_screen/create_post_screen.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../main.dart';

class Bio extends StatefulWidget {
  Users sessionUser;
  Bio({this.sessionUser});
  @override
  _BioState createState() => _BioState();
}


class _BioState extends State<Bio> {
  final TextEditingController _controller = TextEditingController();

  List<UserProfile> userProfile;
  final _firstnameKey = GlobalKey<FormState>();
  String fieldVlidator;
  String fieldErrorMessage;

  @override
  Widget build(BuildContext context) {
    print(widget.sessionUser);
    print("inside the build of bio data");
    userProfileData();
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
                      key: _firstnameKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        children: [
                          _getTextSection(),
                        ],
                      ),
                    ),
                  ),
                  //_getTextSection(),
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
            AppTexts.BIO,
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


  _getTextSection() {
    return Container(
    decoration: BoxDecoration(
        border: Border.all(
        color: Colors.green)),
      height: 300,
      padding: EdgeInsets.only(top: 0, left: 20, right: 20),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: CreatePostTextFieldWidget(
              controller: _controller,
              hintText: "Write the text here",
            ),
          ),

          //Here the rest Text will come if there,
          Expanded(flex: 2, child: Container())
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
              //Navigation.back(context);
              // if (_controller.text.trim().length == 0) {
              //   print('email empty case');
              //   fieldErrorMessage= "First name field is required";
              // }

              // if (fieldErrorMessage.length > 0) {
              //   setState(() {
              //     fieldVlidator = fieldErrorMessage;
              //   });

                if (_firstnameKey.currentState.validate()) {
                  print(_controller.text);
                  print("updating the database");
                  updateUserProfile(userProfile);
                  Navigator.pop(context,true);
                }
              },

            text: AppTexts.SAVE,
            isFilled: true,
          ),
        ),
      ],
    );
  }

  Future<void> userProfileData() async {
   // try {
      userProfile = await Amplify.DataStore.query(UserProfile.classType,
          where: UserProfile.USERSID.eq(widget.sessionUser.id));
      print(userProfile);
      print("inside the user profile");
    //} catch (e) {
      ////print("Could not query DataStore: " + e);
    //}
  }


  updateUserProfile(List<UserProfile> userProfile) async
  {
    print("inside the updated method");
    final updatedItem = userProfile[0].copyWith(
        bio: _controller.text);

    await Amplify.DataStore.save(updatedItem);

  }

}
