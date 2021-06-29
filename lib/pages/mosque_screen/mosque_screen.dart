import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mus_greet/core/config/navigation.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/utils/routes.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';
import 'package:mus_greet/core/widgets/following_mosque_list_grid.dart';
import 'package:mus_greet/models/ModelProvider.dart';
import 'package:mus_greet/models/ModelProvider.dart';
import 'package:mus_greet/models/MosqueFollowers.dart';
import 'package:mus_greet/models/MosqueFollowers.dart';
import 'package:mus_greet/models/MosqueFollowers.dart';
import 'package:mus_greet/models/MosqueFollowers.dart';
import 'package:mus_greet/pages/mosque_screen/mosque_details/mosques_detail_screen.dart';
import 'package:mus_greet/pages/mosque_screen/mosque_search_list_view/mosque_search_list_view.dart';
import 'package:mus_greet/core/widgets/bottom_navigation_widget.dart';


class MosqueScreen extends StatefulWidget {
  //final Function MosqueFollowers;
  final Function callBack;
  final Function navigateToMosqueSearch;
  final Users loginUser;
  final String CallingScreen;
  const MosqueScreen({Key key, this.callBack,this.navigateToMosqueSearch, this.loginUser, this.CallingScreen}) : super(key: key);
  @override
  _MosqueScreenState createState() => _MosqueScreenState();
}

class _MosqueScreenState extends State<MosqueScreen> {
  bool _navigateToSearch = false;
 // String UserID = "61b35418-9426-4652-9e59-a65ad173117c";
  String UserID;
  List<MosqueFollowers> MosqueFollowerss =[];
  @override
  Widget build(BuildContext context) {
    UserID = widget.loginUser.id;
    print(UserID);
    return FutureBuilder<List<MosqueFollowers>>(
      future: listMosqueFollowers(),
      builder: (ctx, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            MosqueFollowerss = snapshot.data;
            return _getUI(MosqueFollowerss);
          default:
            return _buildLoadingScreen();
        }
      },
    );
  }

  Widget _getUI(List<MosqueFollowers> MosqueFollowerss) {
    return Scaffold(
      backgroundColor: AppColors.white_shade,
      appBar: _getAppBar(),
      body: _getBody(),
      bottomNavigationBar: _getBottomNavigation(),

    );
  }
  _getBottomNavigation() {
    // if(widget.CallingScreen != "Home") {
    //   return BottomNavigationWidget(
    //     //CallingFunction: _navigateback(),
    //     CallingScreen: "MosqueScreen",
    //     index: 1,
    //   );
    // }
    return BottomNavigationWidget(
      //CallingFunction: _navigateback(),
      sessionUser: widget.loginUser,
      CallingScreen: "MosqueScreen",
      index: 1,
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
    print("inside mosque Screen get body going for grid widget");
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
            GridView.builder(
              padding: EdgeInsets.only(left: 8,right: 8,bottom: 10,),
              shrinkWrap: true,
              itemCount: MosqueFollowerss.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //crossAxisCount: 3,
                //crossAxisSpacing: 5.0,
                //mainAxisSpacing: 5.0,
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 15,
                  childAspectRatio: .82
              ),
              itemBuilder: (BuildContext context, int index) {
                //return FollowingMosqueGrid(callBack: ()=> widget.callBack(),);
                return FollowingMosqueGrid(MosqueFollowerObject: MosqueFollowerss[index], UserID: widget.loginUser.id, sessionUser: widget.loginUser,);
              },
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
    //widget.navigateToMosqueSearch();
    Navigator.push(context,
       MaterialPageRoute(
          builder: (context) => MosqueSearchListView(CallingScreen: "MosqueScreen",sessionUser: widget.loginUser,)
        )
    );
  }

  Future<List<MosqueFollowers>> listMosqueFollowers() async{
    print(UserID);
    try {
      //MosqueFollowerss = await Amplify.DataStore.query(MosqueFollowers.classType, where:MosqueFollowers.USERSID.eq(UserID));
      MosqueFollowerss = await Amplify.DataStore.query(MosqueFollowers.classType, where:MosqueFollowers.USERSID.eq(UserID)
           );
      print(MosqueFollowerss);
      return MosqueFollowerss;
    } catch (e) {
      print("Could not query DataStore: " + e);
    }
  }

  _loadCommentScreen() {
    setState(() {
      _navigateToSearch = true;
    });
  }



}





