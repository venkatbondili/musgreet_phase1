import 'package:flutter/material.dart';
import 'package:mus_greet/core/config/navigation.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/widgets/advance_friend_search_context_widget.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';
import 'package:mus_greet/core/widgets/interests_list_widget.dart';
import 'package:mus_greet/models/MasterIntrests.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:mus_greet/models/ModelProvider.dart';

class AddSkillsImagesScreen extends StatefulWidget {
  @override
  _AddSkillsImagesScreenState createState() => _AddSkillsImagesScreenState();
}

class _AddSkillsImagesScreenState extends State<AddSkillsImagesScreen> {
  List<MasterIntrests> masterIntrest;
  List<UserProfile> userProfile;
  Map<String,String> SKILLS_CATEGORIES={};
  List<String> skills;


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
            Container(
              color: Colors.black12,
              margin: EdgeInsets.symmetric(vertical: 20.0),
              height: 90.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 39),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  //physics: NeverScrollableScrollPhysics(),
                  children: <Widget>[
                      InterestsListWidget(
                      contextName: "",
                      contextImage: "",
                    ),
                    //getInterestChild(),
                    //getInterestChild(),
                    //getInterestChild(),
                  ],
                ),
              )),
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return InterestsListWidget(
                  contextName: SKILLS_CATEGORIES.keys.elementAt(index),
                  contextImage: SKILLS_CATEGORIES.values.elementAt(index),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  height: 20,
                  color: Colors.transparent,
                );
              },
              itemCount: SKILLS_CATEGORIES.length,
            ),
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
          height: 70,
          child: Column(
            children: [
              Text(
                AppTexts.ADD_SKILLS,
                style: TextStyle(
                  fontFamily: FontConstants.FONT,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: AppColors.header_black,
                ),
              ),
              Text(
                AppTexts.CHOOSE_SKILLS,
                style: TextStyle(
                  fontFamily: FontConstants.FONT,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 0,
          top: 17,
          child:GestureDetector(
            onTap: (){
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

  Widget _buildLoadingScreen() {
    return Center(
      child: Container(
        width: 50,
        height: 50,
        child: CircularProgressIndicator(),
      ),
    );
  }

  Future<void> _userProfile() async
  {
    userProfile=await Amplify.DataStore.query(UserProfile.classType , where :UserProfile.ID.eq("ecced20a-90cc-4ef3-af2c-aa1fe9598f89"));
    print(userProfile[0].skills);
    print("Inside the User Profile data store skills");
    var a=userProfile[0].skills;
    var ab = (a.split(','));
    skills=ab;
    for(int i=0;i<skills.length;i++) {
      String skillList=skills[i];
      print("Inside the For loop skills");
      for(int i=0;i<masterIntrest.length;i++) {
        print(skillList);
        if (skillList == masterIntrest[i].id) {
          print("inside the master skilss");
          SKILLS_CATEGORIES.addAll({
            masterIntrest[i].intrest_name :masterIntrest[i].photo_path,
          });
        }
      }
    }
  }
  Future<void> _getSkills() async
  {
    try {
      masterIntrest = await Amplify.DataStore.query(MasterIntrests.classType);
      print(masterIntrest);
    }
    catch (e) {
      print("Could not query DataStore: " + e.stacktrace);
    }
  }

}