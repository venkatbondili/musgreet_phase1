import 'package:flutter/material.dart';
import 'package:mus_greet/core/config/navigation.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/utils/routes.dart';
import 'package:mus_greet/core/widgets/advance_search_widget.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';
import 'package:mus_greet/core/widgets/mosque_list_card_widget.dart';
import 'package:mus_greet/core/widgets/search_text_field_widget.dart';

class MosqueSearchListView extends StatefulWidget {
  final Function callBack;

  const MosqueSearchListView({Key key, this.callBack}) : super(key: key);

  @override
  _MosqueSearchListViewState createState() => _MosqueSearchListViewState();
}

class _MosqueSearchListViewState extends State<MosqueSearchListView> {
  @override
  Widget build(BuildContext context) {
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
          onTap: ()=> widget.callBack(),
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
        GestureDetector(
          onTap: ()=> Navigation.intent(context, AppRoutes.MOSQUE_FROM_MAP),
          child: Container(
            height: 30,
            width: 30,
            child: Image.asset(
              ImageConstants.IC_MAP,
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
    return AdvanceSearchWidget(
        callBack:() => _navigateToAdvanceSearchScreen()
    );
  }

  _getBody() {
    return Container(
      //padding: EdgeInsets.only(top: 20,left: 15,right: 15),
      color: AppColors.white_shade,
      child: ListView.separated(
        padding: EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 20),
        itemBuilder: (context, index) {
          return MosqueListCardWidget(index: index, );
        },
        separatorBuilder: (context, index) {
          return Divider(
            height: 20,
            color: Colors.transparent,
          );
        },
        itemCount: 10,
      ),
    );
  }


  _navigateToAdvanceSearchScreen(){
    Navigation.intent(context, AppRoutes.MOSQUE_ADVANCE_SEARCH);
  }
}
