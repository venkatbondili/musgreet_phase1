import 'dart:async';

import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:mus_greet/core/config/navigation.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/utils/routes.dart';
import 'package:mus_greet/core/widgets/action_button_widget.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';
import 'package:mus_greet/core/widgets/following_mosque_list_grid.dart';
import 'package:mus_greet/core/widgets/rounded_button_widget.dart';
import 'package:mus_greet/models/ModelProvider.dart';
import 'package:mus_greet/pages/mosque_screen/mosque_details/mosques_detail_screen.dart';

import 'custom_spacer_widget.dart';

class MosqueListCardWidget extends StatefulWidget {
  final int index;
  final Mosque mosqueObject;
  final String UserID;
  final Users sessionUser;
  //final List<MosqueFollowers> MosqueFollowersList;

  const MosqueListCardWidget({Key key, this.index, this.mosqueObject, this.UserID,this.sessionUser
    //this.MosqueFollowersList
      }) : super(key: key);

  @override
  _MosqueListCardWidgetState createState() => _MosqueListCardWidgetState();
}

class _MosqueListCardWidgetState extends State<MosqueListCardWidget> {
  List<MosqueFollowers> MosqueFollowerss = [];
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MosqueFollowers>>(
      future:UserMosqueFollowList(),
      builder: (ctx, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            MosqueFollowerss = snapshot.data;
            return buildUI();
        //Mosques = snapshot.data;
        //return _getMosqueUI(Mosques);
          default:
            return _buildLoadingScreen();
        }
      },
    );
  }

  buildUI(){
    _setStatus();
    return Material(
      elevation: 2,
      shadowColor: AppColors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        padding: EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: AppColors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _getMosqueDetails(),
            CustomSpacerWidget(
              width: 5,
            ),
            Flexible(
              child: status ?_getUnfollowButton():_getfollowButton(),
            ),
          ],
        ),
      ),
    );
  }

  /// This will check for the status of the current mosque for the login user
  _setStatus() {
    if(MosqueFollowerss.isNotEmpty){
      for(var mf in MosqueFollowerss){
        if(mf.mosqueID == widget.mosqueObject.id && mf.usersID == widget.UserID){
          status = true;
        }
      }
    }
    else{
      print("User is not following any mosque");
      status = false;
    }
  }

  _getMosqueDetails() {
    return GestureDetector(
      onTap: () => {
        _navigatetoMosqueDetailsScreen()
      //Navigation.intent(context, AppRoutes.MOSQUE_DETAILS_SCREEN)
      },
      child: Row(
        children: [
          _getMosqueImage(),
          CustomSpacerWidget(
            width: 5,
          ),
          _getMosqueNameAndLocation(),
        ],
      ),
    );
    return Row(
      children: [
        _getMosqueImage(),
        CustomSpacerWidget(
          width: 5,
        ),
        _getMosqueNameAndLocation(),
      ],
    );
  }

  _getMosqueImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: Image.asset(
        ImageConstants.IMG_MOSQUE,
        fit: BoxFit.cover,
        height: 70,
        width: 70,
      ),
    );
  }

  _getMosqueNameAndLocation() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          //AppTexts.MOSQUE_NAME,
          widget.mosqueObject.mosque_name,
          style: TextStyle(
            fontFamily: FontConstants.FONT,
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
        ),
        CustomSpacerWidget(
          height: 4,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AssetImageWidget(
              image: ImageConstants.TEMP_LOCATION,
              height: 15,
              width: 15,
              color: AppColors.black_50,
            ),
            CustomSpacerWidget(
              width: 4,
            ),
            Text(
             // AppTexts.MOSQUE_LOCATION,
              widget.mosqueObject.city,
              style: TextStyle(
                fontFamily: FontConstants.FONT,
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppColors.black_50,
              ),
            )
          ],
        ),
        CustomSpacerWidget(
          height: 4,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 15,
              width: 15,
            ),
            CustomSpacerWidget(
              width: 4,
            ),
            Text(
              //AppTexts.SHIA_TEXT,
              widget.mosqueObject.sect,
              style: TextStyle(
                fontFamily: FontConstants.FONT,
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppColors.black_50,
              ),
            )
          ],
        ),
      ],
    );
  }

  _getUnfollowButton(){
    return MosqueFollowButton(
      radius: 30,
      callBack: () {
        deleteMosqueFollower();
        //setState(() {
          //status = false;
        //});
        //_followUnfollowMosque();
        print("Handle CallBack");
      },
      // text: widget.index==0 ? AppTexts.UNFOLLOW_TEXT :AppTexts.FOLLOW_TEXT,
      // isFilled: widget.index==0 ? true : false,
      text: AppTexts.UNFOLLOW_TEXT,
      isFilled: true,
      //text: status ? AppTexts.UNFOLLOW_TEXT :AppTexts.FOLLOW_TEXT,
      //isFilled: status ? true : false,
    );
  }

  _getfollowButton() {
    return MosqueFollowButton(
      radius: 30,
      callBack: () {
        //listMosqueFollowers();
        createMosqueFollower();
        //setState(() {
          //status = true;
        //});
        //_followUnfollowMosque();
        print("Handle CallBack");
      },
      // text: widget.index==0 ? AppTexts.UNFOLLOW_TEXT :AppTexts.FOLLOW_TEXT,
      // isFilled: widget.index==0 ? true : false,
      text: AppTexts.FOLLOW_TEXT,
      isFilled: false,
      //text: status ? AppTexts.UNFOLLOW_TEXT :AppTexts.FOLLOW_TEXT,
      //isFilled: status ? true : false,
    );
  }

  void _followUnfollowMosque() {
    status = true;
    //_getRemoveButton();

  }
/// this will create MosqueFollower row in the database and User start following that mosque
  Future<void> createMosqueFollower() async{
    print("inside mosque followers");
    print(widget.mosqueObject.id);
    print(widget.UserID);
    try {
    final item = MosqueFollowers(
        mosqueID: widget.mosqueObject.id,
        usersID: widget.UserID);
        await Amplify.DataStore.save(item);
        print("going to set state");
        setState(() {
          status = true;
        });
    }catch (e) {
      print("Could not query DataStore: " + e);
    }
  }

  _deleteMosqueFollower(){
    return FutureBuilder<bool>(
      future:deleteMosqueFollower(),
      builder: (ctx, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            print("going to set status");
            setState(() {
              status = false;
            });
            return Container();
            //Mosques = snapshot.data;
            //return _getMosqueUI(Mosques);
          default:
            return _buildLoadingScreen();
        }
      },
    );
  }

  /// Loading screen when waiting for database data
  Widget _buildLoadingScreen() {
    return Center(
      child: Container(
        width: 50,
        height: 50,
        child: CircularProgressIndicator(),
      ),
    );
  }

  /// This will unfollow the mosque and remove the row in database form mosqueFollowers table
  Future<void> deleteMosqueFollower() async{
    try {
    for(var m in MosqueFollowerss){
      //for(var m in widget.MosqueFollowersList){
      if(m.mosqueID == widget.mosqueObject.id && m.usersID == widget.UserID){
        await Amplify.DataStore.delete(m);
        Timer(
            Duration(seconds: 1),
                () => _setStateFunction());
        //return false;
        //await Future.delayed(Duration(seconds: 1));
      }
    }
    //print("goin to set state in delete mosque");
    //setState(() {
      //status = false;
    //});

    } catch (e) {
      print("Could not query DataStore: " + e);
    }
  }

  _setStateFunction(){
    print("inside set State");
    setState((){
      print("inside set state");
      status = false;});
  }

  /// this will render the list of mosqueFollowers for the login user from Database
  Future<List<MosqueFollowers>> UserMosqueFollowList() async{
    try {
      MosqueFollowerss = await Amplify.DataStore.query(MosqueFollowers.classType, where:MosqueFollowers.USERSID.eq(widget.UserID));
      print(MosqueFollowerss);
      return MosqueFollowerss;
    } catch (e) {
      print("Could not query DataStore: " + e);
    }
  }

  _navigatetoMosqueDetailsScreen() {
    // Navigator.of(context).push(new MaterialPageRoute(builder: (_) => new MosquesDetailsScreen(MosqueObject: widget.mosqueObject,CallingScreen: "MosqueSearch", Status: status,UserID: widget.UserID)),)
    //     .then((value) => value? build(context):null);

    Navigator.push(context,
        MaterialPageRoute(
          builder: (context) => MosquesDetailsScreen(MosqueObject: widget.mosqueObject,CallingScreen: "MosqueSearch", Status: status,UserID: widget.UserID,sessionUser: widget.sessionUser,),
        )
    );

  }

}
