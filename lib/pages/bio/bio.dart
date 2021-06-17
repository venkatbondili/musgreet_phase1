
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
import 'package:mus_greet/models/UserProfile.dart';
import 'package:mus_greet/pages/create_post_screen/create_post_screen.dart';

import '../../main.dart';

class Bio extends StatefulWidget {
  @override
  _BioState createState() => _BioState();
}


class _BioState extends State<Bio> {
  final TextEditingController _controller = TextEditingController();

  List<UserProfile> userProfile;

  @override
  Widget build(BuildContext context) {
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
                  _getTextSection(),
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
              Navigation.back(context);
              print(_controller.text);
              print("updating the database");
              updateUserProfile();

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
          where: UserProfile.ID.eq("0263d01c-1250-4541-826d-8d63f96cf8c0"));
      print(userProfile);
      print("inside the user profile");
    } catch (e) {
      print("Could not query DataStore: " + e);
    }
  }


  updateUserProfile() async
  {
    final updatedItem = userProfile[0].copyWith(
        bio: _controller.text);

    await Amplify.DataStore.save(updatedItem);
  }

}