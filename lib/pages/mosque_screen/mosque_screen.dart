import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mus_greet/core/config/navigation.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/utils/routes.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';
import 'package:mus_greet/core/widgets/following_mosque_list_grid.dart';

class MosqueScreen extends StatefulWidget {
  final Function callBack;
  final Function navigateToMosqueSearch;

  const MosqueScreen({Key key, this.callBack,this.navigateToMosqueSearch}) : super(key: key);
  @override
  _MosqueScreenState createState() => _MosqueScreenState();
}

class _MosqueScreenState extends State<MosqueScreen> {
  bool _navigateToSearch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white_shade,
      appBar: _getAppBar(),
      body: _getBody(),
    );
  }



  /// This will return Appbar in widget tree
  _getAppBar() {
    return AppBar(
      toolbarHeight: 80,
      elevation: 0,
      backgroundColor: AppColors.white,
      leading: Padding(
        padding: EdgeInsets.only(top: 30, bottom: 15, left: 15, right: 15),
        child: AssetImageWidget(
          image: ImageConstants.IC_DRAWER,
          height: 15,
          width: 15,
        ),
      ),
      excludeHeaderSemantics: true,
      title: Container(
        padding: EdgeInsets.only(top: 30),
        child: Text(
          AppTexts.MOSQUE_TEXT,
          style: TextStyle(
            fontFamily: FontConstants.FONT,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.header_black,
          ),
        ),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 15, bottom: 15, top: 30),
          child: GestureDetector(
            onTap: () => _handleSearch(),
            child: AssetImageWidget(
              image: ImageConstants.IC_SEARCH,
              height: 23,
              width: 23,
            ),
          ),
        ),
      ],
    );
  }

  /// Body of the home screen
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
            GridView(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(left: 8,right: 8,bottom: 10,),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 15,
                  childAspectRatio: .82
              ),
              children: [
                FollowingMosqueGrid(callBack: ()=> widget.callBack(),),
                FollowingMosqueGrid(callBack: ()=> widget.callBack(),),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _currentlyFollowings() {
    return Container(
      padding: EdgeInsets.only(left: 20, top: 5, bottom: 20),
      child: Text(
        AppTexts.CURRENT_FOLLOWING,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: AppColors.header_black,
            fontFamily: FontConstants.FONT),
      ),
    );
  }

  _handleSearch() {
    widget.navigateToMosqueSearch();
  }

  _loadCommentScreen() {
    setState(() {
      _navigateToSearch = true;
    });
  }
}





