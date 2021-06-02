import 'package:flutter/material.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/widgets/advance_friend_search_context_widget.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';

class FriendAdvanceSearch extends StatefulWidget {
  @override
  _FriendAdvanceSearchState createState() => _FriendAdvanceSearchState();
}

class _FriendAdvanceSearchState extends State<FriendAdvanceSearch> {
  final List<String> iconList = [
    ImageConstants.IC_INTEREST_BASED,
    ImageConstants.IC_SKILLS_BASED,
    ImageConstants.IC_FAITH_BASED,
    ImageConstants.IC_EDUCATION_BASED,
    ImageConstants.IC_LOCAL_MOSQUE_BASED,
    ImageConstants.IC_BUSINESS_BASED,
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
            _getSearchByText(),
            CustomSpacerWidget(
              height: 15,
            ),
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return AdvanceFriendSearchContextWidget(
                  contextName: AppTexts.INTEREST_BASED_SEARCH[index],
                  contextImage: iconList[index],
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  height: 20,
                  color: Colors.transparent,
                );
              },
              itemCount: AppTexts.INTEREST_BASED_SEARCH.length,
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
          height: 50,
          child: Text(
            AppTexts.ADVANCE_SEARCH,
            style: TextStyle(
              fontFamily: FontConstants.FONT,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: AppColors.header_black,
            ),
          ),
        ),
        Positioned(
          left: 0,
          top: 17,
          child: AssetImageWidget(
            image: ImageConstants.IC_BACK,
            height: 15,
            width: 25,
          ),
        ),
      ],
    );
  }

  _getSearchByText() {
    return Container(
      child: Text(
        AppTexts.SEARCH_BY,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: AppColors.header_black,
            fontFamily: FontConstants.FONT),
      ),
    );
  }
}
