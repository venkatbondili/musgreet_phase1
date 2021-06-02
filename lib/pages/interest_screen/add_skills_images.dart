import 'package:flutter/material.dart';
import 'package:mus_greet/core/config/navigation.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/widgets/advance_friend_search_context_widget.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';
import 'package:mus_greet/core/widgets/interests_list_widget.dart';

class AddSkillsImagesScreen extends StatefulWidget {
  @override
  _AddSkillsImagesScreenState createState() => _AddSkillsImagesScreenState();
}

class _AddSkillsImagesScreenState extends State<AddSkillsImagesScreen> {
  final List<String> iconList = [
    ImageConstants.IC_BUSINESS_AND_OFFICE,
    ImageConstants.IC_CHILDCARE,
    ImageConstants.IC_CLOTHING,
    ImageConstants.IC_COMPUTER_AND_MARKETING,
    ImageConstants.IC_ENTERTAINMENT,
    ImageConstants.IC_FINANCE_AND_LEGAL,
    ImageConstants.IC_GOODS_SUPPLIERS,
    ImageConstants.IC_HEALTH_AND_BEAUTY,
    ImageConstants.IC_MOTORING,
    ImageConstants.IC_PETS,
    ImageConstants.IC_ONLINE_SHOPPING,
    ImageConstants.IC_PROPERTY_AND_MAINTENANCE,
    ImageConstants.IC_TRADESMAN_AND_CONSTRUCTION,
    ImageConstants.IC_PUBLIC,
    ImageConstants.IC_TRANSPORT,
    ImageConstants.IC_TRAVEL_AND_TOURISM,
    ImageConstants.IC_TUITION_AND_CLASSES,
    ImageConstants.IC_WEDDINGS,
  ];

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
                      contextName: AppTexts.SKILLS_CATEGORIES[0],
                      contextImage: iconList[0],
                    ),
                      InterestsListWidget(
                      contextName: AppTexts.SKILLS_CATEGORIES[0],
                      contextImage: iconList[0],
                    ),
                      InterestsListWidget(
                      contextName: AppTexts.SKILLS_CATEGORIES[0],
                      contextImage: iconList[0],
                    ),
                      InterestsListWidget(
                      contextName: AppTexts.SKILLS_CATEGORIES[0],
                      contextImage: iconList[0],
                    ),
                      InterestsListWidget(
                      contextName: AppTexts.SKILLS_CATEGORIES[0],
                      contextImage: iconList[0],
                    ),
                    InterestsListWidget(
                      contextName: AppTexts.SKILLS_CATEGORIES[0],
                      contextImage: iconList[0],
                    ),
                    InterestsListWidget(
                      contextName: AppTexts.SKILLS_CATEGORIES[0],
                      contextImage: iconList[0],
                    ),
                    InterestsListWidget(
                      contextName: AppTexts.SKILLS_CATEGORIES[0],
                      contextImage: iconList[0],
                    ),
                    InterestsListWidget(
                      contextName: AppTexts.SKILLS_CATEGORIES[0],
                      contextImage: iconList[0],
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
                  contextName: AppTexts.SKILLS_CATEGORIES[index],
                  contextImage: iconList[index],
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  height: 20,
                  color: Colors.transparent,
                );
              },
              itemCount: AppTexts.SKILLS_CATEGORIES.length,
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

}