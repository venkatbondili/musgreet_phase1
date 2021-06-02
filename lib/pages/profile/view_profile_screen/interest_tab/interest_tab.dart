import 'package:flutter/material.dart';
import 'package:mus_greet/core/config/navigation.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/utils/routes.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';


class InterestTab extends StatefulWidget {
  @override
  _InterestTabState createState() => _InterestTabState();
}

class _InterestTabState extends State<InterestTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 4),
        width: MediaQuery.of(context).size.width,
        color: AppColors.white,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          getCommonPadding(
              26,
              7,
              0,
              27,
              Text(
                AppTexts.COMMUNITY_INTEREST,
                style: TextStyle(
                    fontFamily: FontConstants.FONT,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.header_black),
              )),
          getCommonPadding(
            39,
            7,
            0,
            27,
            Row(
              children: [
                Text(
                  AppTexts.INTEREST,
                  style: TextStyle(
                      fontFamily: FontConstants.FONT,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.header_black),
                ),
                Text(
                  '6',
                  style: TextStyle(
                      fontFamily: FontConstants.FONT,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.green),
                ),
                Expanded(
                  child: CustomSpacerWidget(
                    width: 4,
                  ),
                ),
                GestureDetector(
                  onTap: () => _navigateToInterestScreen(),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: AssetImageWidget(
                      image: ImageConstants.IC_EDIT,
                      height: 20,
                      width: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          getInterestList(),
          getCommonPadding(
            39,
            0,
            0,
            27,
            Row(
              children: [
                Text(
                  AppTexts.SKILLS,
                  style: TextStyle(
                      fontFamily: FontConstants.FONT,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black),
                ),
                Text(
                  '3',
                  style: TextStyle(
                      fontFamily: FontConstants.FONT,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.green),
                ),
                Expanded(
                  child: getCommonPadding(
                      10,
                      0,
                      0,
                      0,
                      Container(
                        height: 30,
                        decoration: BoxDecoration(
                          color: AppColors.green_light,
                          borderRadius: BorderRadius.all(
                            Radius.circular(40),
                          ),
                        ),
                        child: Center(
                          child: getCommonPadding(
                              15,
                              3,
                              3,
                              15,
                              Text(
                                'For more options, visit our business services',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontFamily: FontConstants.FONT,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.green),
                              )),
                        ),
                      )),
                ),
                CustomSpacerWidget(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () => _navigateToEditSkillsScreen(),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: AssetImageWidget(
                      image: ImageConstants.IC_EDIT,
                      height: 20,
                      width: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          getSkills(),
          getCommonPadding(
            39,
            0,
            0,
            27,
            Row(
              children: [
                Text(
                  AppTexts.RELIGIOUS_INTEREST,
                  style: TextStyle(
                      fontFamily: FontConstants.FONT,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black),
                ),
                Text(
                  '3',
                  style: TextStyle(
                      fontFamily: FontConstants.FONT,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.green),
                ),
                Expanded(
                  child: CustomSpacerWidget(
                    width: 5,
                  ),
                ),
                GestureDetector(
                  onTap: () => _navigateToEditSkillsScreen(),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: AssetImageWidget(
                      image: ImageConstants.IC_EDIT,
                      height: 20,
                      width: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          getReligiousInterest(),
          getCommonPadding(
              0,
              30,
              0,
              0,
              Center(
                child: AssetImageWidget(
                  image: ImageConstants.AMAZON_ADS,
                  width: MediaQuery.of(context).size.width,
                ),
              ))
        ]));
  }



  ///Create a common padding widget for the About Us View
  Widget getCommonPadding(
      double left, double top, double bottom, double right, Widget widget) {
    return Padding(
      padding:
      EdgeInsets.only(left: left, top: top, bottom: bottom, right: right),
      child: widget,
    );
  }


  getReligiousInterest() {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 100.0,
        child: Padding(
          padding: const EdgeInsets.only(left: 39),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              getInterestChild(),
              getInterestChild(),
              getInterestChild(),
            ],
          ),
        ));
  }



  getInterestChild() {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: Column(
        children: [
          AssetImageWidget(
            image: ImageConstants.IC_FATHER,
            height: 60,
            width: 60,
          ),
          getCommonPadding(
              0,
              10,
              0,
              0,
              Center(
                child: Text(
                  "Food",
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: FontConstants.FONT,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black),
                ),
              )),
        ],
      ),
    );
  }

  getInterestList() {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 90.0,
        child: Padding(
          padding: const EdgeInsets.only(left: 39),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              getInterestChild(),
              getInterestChild(),
              getInterestChild(),
              getInterestChild(),
              getInterestChild(),
              getInterestChild(),
            ],
          ),
        ));
  }


  getSkills() {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 90.0,
        child: Padding(
          padding: const EdgeInsets.only(left: 39),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              getInterestChild(),
              getInterestChild(),
              getInterestChild(),
            ],
          ),
        ));
  }

  ///This will edit the interest and navigate to add interest screen
  _navigateToInterestScreen() {
    Navigation.intent(context, AppRoutes.INTEREST_SCREEN);
  }

  ///This will edit the interest and navigate to add interest screen
  _navigateToEditSkillsScreen() {
    //Navigation.intent(context, AppRoutes.ADD_SKILLS_IMAGES);
    Navigation.intent(context, AppRoutes.ADD_SKILLS);
  }
}
