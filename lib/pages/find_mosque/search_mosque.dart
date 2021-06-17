import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mus_greet/core/config/navigation.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/utils/routes.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';
import 'package:mus_greet/core/widgets/following_mosque_list_grid.dart';
import 'package:mus_greet/core/widgets/mosque_advance_search.dart';
import 'package:mus_greet/core/widgets/search_text_field_widget.dart';
import 'package:mus_greet/models/Mosque.dart';

class MosuqueSearchFromMap extends StatefulWidget {
  @override
  _MosuqueSearchFromMapState createState() => _MosuqueSearchFromMapState();
}

class _MosuqueSearchFromMapState extends State<MosuqueSearchFromMap> {
  List<Mosque> Mosques = [];
  @override
  Widget build(BuildContext context) {
    listMosque();
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: _getAppBar(context),
        body: _getBody(),
      ),
    );
  }

  _getAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.white,
      automaticallyImplyLeading: false,
      bottom: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 150),
        child: Container(
            padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _getRowHeader(),
                CustomSpacerWidget(
                  height: 15,
                ),
                _getSearchTextField(),
                CustomSpacerWidget(
                  height: 10,
                ),
                _getAdvanceSearchField(),
              ],
            )),
      ),
    );
  }

  _getRowHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        GestureDetector(
          onTap: ()=> Navigation.back(context),
          child: AssetImageWidget(
            image: ImageConstants.IC_BACK,
            height: 18,
            width: 25,
          ),
        ),
        Container(
          child: Text(
            AppTexts.SEARCH,
            style: TextStyle(
              fontFamily: FontConstants.FONT,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: AppColors.header_black,
            ),
          ),
        ),
        Container(
          height: 20,
          width: 20,
          child: GestureDetector(
            onTap: ()=> Navigation.back(context),
            child: Image.asset(
              ImageConstants.IC_NON_BULLET,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }

  _getSearchTextField() {
    return SearchTextFieldWidget();
  }

  _getAdvanceSearchField() {
    return AdvanceSearchWidgetMosque(
        callBack: () => _navigateToAdvanceSearchScreen());
  }

  _getBody() {
    return Container(
      height: MediaQuery.of(context).size.height,
      //padding: EdgeInsets.only(top: 20,left: 15,right: 15),
      color: AppColors.white_shade,
      child: Stack(
        children: [
          Positioned(
            bottom: 20,
            left: 20,
            right: 10,
            child: SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: Container(
                height: 200,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(
                    bottom: 10,
                  ),
                  children: [
                    _getMosques(),
                    CustomSpacerWidget(
                      width: 20,
                    ),
                    _getMosques(),
                    CustomSpacerWidget(
                      width: 20,
                    ),
                    _getMosques(),
                    CustomSpacerWidget(
                      width: 20,
                    ),
                    _getMosques(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _getMosques() {
    return Stack(children: [
      ConstrainedBox(
        constraints: BoxConstraints.expand(width: 250, height: 200),
        child: Padding(
          padding: const EdgeInsets.only(top:30.0),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageConstants.IC_BG_MOSQUE_SEARCH),
                fit: BoxFit.fill,
              ),
            ),
            child: Stack(children: [
              _getRemoveButton(),
              Container(
                color: Colors.transparent,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding:
                      EdgeInsets.only(left: 22, right: 22, bottom: 10, top: 80),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomSpacerWidget(
                        height: 10,
                      ),
                      Flexible(
                        child: _getNameOfMosque(),
                      ),
                      CustomSpacerWidget(
                        height: 5,
                      ),
                      _getMosqueLocation(),
                      _getMosqueReligion(),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left:20.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            ImageConstants.IMG_POST1,
            fit: BoxFit.cover,
            height: 95,
            width: 85,
          ),
        ),
      ),
    ]);
  }

  _getNameOfMosque() {
    return Text(
      AppTexts.MOSQUE_NAME,
      maxLines: 1,
      overflow: TextOverflow.clip,
      style: TextStyle(
        fontFamily: FontConstants.FONT,
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: AppColors.black,
      ),
    );
  }

  _getMosqueLocation() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AssetImageWidget(
          image: ImageConstants.TEMP_LOCATION,
          height: 13,
          width: 13,
          color: AppColors.vertical_divider,
        ),
        CustomSpacerWidget(
          width: 4,
        ),
        Text(
          AppTexts.MOSQUE_LOCATION,
          maxLines: 1,
          overflow: TextOverflow.clip,
          style: TextStyle(
            fontFamily: FontConstants.FONT,
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.vertical_divider,
          ),
        )
      ],
    );
  }

  _getRemoveButton() {
    return Positioned(
      right: 15,
      top: 50,
      child: MosqueFollowButton(
        radius: 30,
        callBack: () {
          print("Handle CallBack");
        },
        text: AppTexts.FOLLOW_TEXT,
        isFilled: false,
      ),
    );
  }

  _getMosqueReligion() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 13,
          width: 13,
        ),
        CustomSpacerWidget(
          width: 4,
        ),
        Text(
          AppTexts.SHIA_TEXT,
          overflow: TextOverflow.clip,
          maxLines: 1,
          style: TextStyle(
            fontFamily: FontConstants.FONT,
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: AppColors.vertical_divider,
          ),
        ),
        Expanded(
          child: CustomSpacerWidget(
            width: 4,
          ),
        ),
      ],
    );
  }

  _navigateToAdvanceSearchScreen() {
    Navigation.intent(context, AppRoutes.MOSQUE_ADVANCE_SEARCH);
  }

  Future<void> listMosque() async {
    try {
      Mosques = await Amplify.DataStore.query(Mosque.classType);
      print(Mosques);
    } catch (e) {
      print("Could not query DataStore: " + e);
    }
  }


}
