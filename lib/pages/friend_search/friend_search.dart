import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mus_greet/core/config/navigation.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/utils/routes.dart';
import 'package:mus_greet/core/widgets/advance_search_widget.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';
import 'package:mus_greet/core/widgets/friend_search_list_widget.dart';
import 'package:mus_greet/core/widgets/sponsored_widget.dart';

class FriendSearch extends StatefulWidget {
  @override
  _FriendSearchState createState() => _FriendSearchState();
}

class _FriendSearchState extends State<FriendSearch> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white_shade,
        appBar: _getAppBar(context),
        body: _getBody(),
      ),
    );
  }

  _getAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.white,
      bottom: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 110),
        child: Container(
          padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomSpacerWidget(
                height: 30,
              ),
              _getSearchTextField(),
              CustomSpacerWidget(
                height: 10,
              ),
              _getAdvanceSearchField(),
            ],
          ),
        ),
      ),
    );
  }

  _getBody() {
    return SingleChildScrollView(
      child: Container(
        color: AppColors.white_shade,
        padding: EdgeInsets.only(
          top: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _currentlyFollowings(),
            ListView.separated(
              padding: EdgeInsets.only(left: 20, right: 20),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 7,
              separatorBuilder: (context, int index) {
                return Divider(
                  height: 10,
                  color: Colors.transparent,
                );
              },
              itemBuilder: (BuildContext context, int index) {
                if(index==3){
                  return _getSponsoredWidget();
                }else{
                  return FriendSearchListWidget(
                    index: index,
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }

  _getSearchTextField() {
    return Container(
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: 30),
            child: FriendSearchFieldWidget(),
          ),
          Positioned(
            top: 18,
            left: 0,
            child: _backButton(),
          ),
        ],
      ),
    );
  }

  _currentlyFollowings() {
    return Container(
      padding: EdgeInsets.only(left: 20, top: 5, bottom: 20),
      child: Text(
        AppTexts.FOUND_RESULT,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: AppColors.header_black,
            fontFamily: FontConstants.FONT),
      ),
    );
  }

  _getAdvanceSearchField() {
    return AdvanceSearchWidget(
        callBack: () => _navigateToAdvanceSearchScreen());
  }

  _backButton() {
    return GestureDetector(
      onTap: ()=> Navigation.intent(context, AppRoutes.HOME),
      child: AssetImageWidget(
        image: ImageConstants.IC_BACK,
        height: 18,
        width: 25,
      ),
    );
  }

  _navigateToAdvanceSearchScreen() {
    Navigation.intent(context, AppRoutes.FRIEND_ADVANCE_SEARCH);
  }


  _getSponsoredWidget(){
    return SponsoredWidget();
  }
}

///Friend search field

class FriendSearchFieldWidget extends StatefulWidget {
  @override
  _FriendSearchFieldWidgetState createState() =>
      _FriendSearchFieldWidgetState();
}

class _FriendSearchFieldWidgetState extends State<FriendSearchFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.green,
        ),
      ),
      child: TextField(
        //controller: widget.controller,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 16,
          color: AppColors.header_black,
        ),
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          //hintText: widget.hintText,
          /* hintStyle: TextStyle(
            fontFamily: FontConstants.FONT,
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: AppColors.black_50,
          ),
          labelText: AppTexts.LABEL_CURRENT_LOCATION,
          labelStyle: TextStyle(
            fontFamily: FontConstants.FONT,
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.header_black,
          ),
          hintText: AppTexts.HINT_LOCATION,*/
          suffix: Container(
            padding: EdgeInsets.only(right: 5, top: 0),
            child: Icon(
              Icons.clear,
              color: AppColors.vertical_divider,
            ),
          ),
          suffixIcon: Container(
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.green),
              color: AppColors.background_color,
            ),
            margin: EdgeInsets.only(top: 2, right: 4, bottom: 2, left: 4),
            alignment: Alignment.center,
            child: Image.asset(
              ImageConstants.IC_SEARCH,
              height: 20,
              width: 20,
            ),
          ),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          contentPadding:
              EdgeInsets.only(left: 20, bottom: 15, top: 10, right: 20),
        ),
      ),
    );
  }
}
