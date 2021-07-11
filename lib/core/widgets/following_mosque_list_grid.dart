import 'dart:async';

import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:mus_greet/core/config/navigation.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/utils/routes.dart';
import 'package:mus_greet/core/widgets/action_button_widget.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';
import 'package:mus_greet/models/ModelProvider.dart';
import 'package:mus_greet/pages/mosque_screen/mosque_details/mosques_detail_screen.dart';
import 'package:mus_greet/pages/mosque_screen/mosque_screen.dart';

class FollowingMosqueGrid extends StatefulWidget {
  //final Function callBack;

  //const FollowingMosqueGrid({Key key, this.callBack}) : super(key: key);
  final MosqueFollowers MosqueFollowerObject;
  final String UserID;
  final Users sessionUser;
  const FollowingMosqueGrid({this.MosqueFollowerObject, this.UserID, this.sessionUser});
  @override
  _FollowingMosqueGridState createState() => _FollowingMosqueGridState();
}

class _FollowingMosqueGridState extends State<FollowingMosqueGrid> {
  Mosque MosqueObject;
  bool status = true;
  @override
  Widget build(BuildContext context) {
    print("insde mosque grid list build");
    return FutureBuilder<Mosque>(
      future: listMosque(),
      builder: (ctx, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            MosqueObject = snapshot.data;
            return _buildUI(MosqueObject);
          default:
            return _buildLoadingScreen();
        }
      },
    );
  }

  Widget _buildUI(Mosque mosqueObject) {
    return InkResponse(
      onTap: (){
        //widget.callBack();
        _navigateToMosqueDetailsScreen();

      },
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          padding: EdgeInsets.all(6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _getMosqueImage(),
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
    );
  }

  _getMosqueImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        height: 140,
        width: double.infinity,
        child: Image.asset(
          ImageConstants.IMG_MOSQUE,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  _getNameOfMosque() {
    return Text(
      MosqueObject.mosque_name,
      //AppTexts.MOSQUE_NAME,
      maxLines: 1,
      overflow: TextOverflow.clip,
      style: TextStyle(
        fontFamily: FontConstants.FONT,
        fontSize: 11,
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
          MosqueObject.city,
          //AppTexts.MOSQUE_LOCATION,
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
          MosqueObject.sect,
          //AppTexts.SHIA_TEXT,
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
        //_getRemoveButton(),
        _getUnfollowButton(),
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

  _getRemoveButton() {
    return MosqueFollowButton(
      radius: 30,
      callBack: () {
        print("Handle CallBack");
      },
      text: AppTexts.UNFOLLOW_TEXT,
      isFilled: true,
    );
  }

  ///
  Future<Mosque> listMosque() async {
    try {
      List<Mosque> Mosques = await Amplify.DataStore.query(Mosque.classType, where:Mosque.ID.eq(widget.MosqueFollowerObject.mosqueID) );
      print(Mosques[0]);
      return(Mosques[0]);
    } catch (e) {
      print("Could not query DataStore: " + e);
    }
  }

  Future<void> deleteMosqueFollower() async{
    try {
      await Amplify.DataStore.delete(widget.MosqueFollowerObject);
      Timer(
          Duration(seconds: 1),
              () => _setStateFunction());
    } catch (e) {
      print("Could not query DataStore: " + e);
    }
  }

  _navigateToMosqueScreen(){
    // Navigator.push(context,MaterialPageRoute(
    //   builder: (context) => MosquesDetailsScreen(MosqueObject: MosqueObject,CallingScreen: "MosqueScreen", Status: status, MosqueFollowerObject: widget.MosqueFollowerObject , UserID: widget.UserID,),
    // ));
    Navigator.push(context,MaterialPageRoute(
      builder: (context) => MosqueScreen(loginUser: widget.sessionUser,),
    ));
  }

  _setStateFunction(){
    print("inside set State");
    setState((){
      print("inside set state");
      status = false;});
    _navigateToMosqueScreen();
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

  _navigateToMosqueDetailsScreen() {
    //MosquesDetailsScreen();
    //MosquesDetailsScreen(MosqueObject: MosqueObject,CallingScreen: "MosqueScreen", Status: status, MosqueFollowerObject: widget.MosqueFollowerObject , UserID: widget.UserID);
    //Navigator.of(context).push(new MaterialPageRoute(builder: (_) => new MosquesDetailsScreen(MosqueObject: MosqueObject,CallingScreen: "MosqueScreen", Status: status, MosqueFollowerObject: widget.MosqueFollowerObject , UserID: widget.UserID)),)
        //.then((value) => value? build(context):null);
   Navigator.push(context,MaterialPageRoute(
         builder: (context) => MosquesDetailsScreen(MosqueObject: MosqueObject,CallingScreen: "MosqueScreen", Status: status, MosqueFollowerObject: widget.MosqueFollowerObject , UserID: widget.UserID,sessionUser: widget.sessionUser,),
        ));
  }
}



class MosqueFollowButton extends StatefulWidget {
  final Function callBack;
  final String text;
  final bool isFilled;
  final double radius;

  MosqueFollowButton({ this.callBack, this.text, this.isFilled=false,this.radius=8}) ;

  @override
  _ActionButtonWidgetState createState() => _ActionButtonWidgetState();
}

class _ActionButtonWidgetState extends State<MosqueFollowButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> widget.callBack(),
      child: Container(
        padding: EdgeInsets.only(left: 5,right: 5,top: 5,bottom: 5),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.background_color),
          borderRadius: BorderRadius.circular(widget.radius),
          color: widget.isFilled ? AppColors.background_color : null,
        ),
        child: Text(
          widget.text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            fontFamily: FontConstants.FONT,
            color: widget.isFilled? AppColors.white : AppColors.background_color,
          ),
        ),
      ),
    );
  }
}
