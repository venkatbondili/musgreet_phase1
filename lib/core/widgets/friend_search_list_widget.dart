import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';
import 'package:mus_greet/core/widgets/following_mosque_list_grid.dart';
import 'package:mus_greet/core/widgets/s3_bucket_image_widget.dart';
import 'package:mus_greet/core/widgets/send_request_dialog_widget.dart';
import 'package:mus_greet/models/ModelProvider.dart';

import 'asset_image_widget.dart';


class FriendSearchListWidget extends StatefulWidget {
  final int index;
  final Users UserObject;
  final String loginUserId;
  const FriendSearchListWidget({Key key, this.index,this.loginUserId, this.UserObject}) : super(key: key);
  @override
  _FriendSearchListWidgetState createState() => _FriendSearchListWidgetState();
}

class _FriendSearchListWidgetState extends State<FriendSearchListWidget> {
  bool status=false;
  List<FriendRequest> friendRequest=[];
  String firstname="";
  String lastname="";
  String city="";
  @override
  Widget build(BuildContext context) {
    //friendRequestList();

    return FutureBuilder<List<FriendRequest>>(
      future: friendRequestList(),
      builder: (ctx, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            friendRequest = snapshot.data;
            return buildUi(friendRequest);
          default:
            return _buildLoadingScreen();
        }
      },
    );
  }

   buildUi(List<FriendRequest> friendRequest)
   {
     _getStatus();
     print(status);
     return Material(
       elevation: 2,
       shadowColor: AppColors.black,
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(12.0),
       ),
       child: Container(
         padding: EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10),
         decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(10), color: AppColors.white),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             _getUserDetails(),
             CustomSpacerWidget(
               width: 5,
             ),
             Flexible(
               child: status ? _getRequestSent() :_getAddFriendButton(),
               //fit:0,

             ),
           ],
         ),
       ),
     );
   }
  _getUserDetails() {
    return Row(
      children: [
        _getUserImage(),
        CustomSpacerWidget(
          width: 10,
        ),
        //print("Inisde the Name and Relatioship ");
        _getNameAndLocation(),
      ],
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

  ///method to get profile image from s3 bucket
  _getUserImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: S3BucketImageWidget(
        image: "https://musgreetphase1images184452-staging.s3.eu-west-2.amazonaws.com/public/public.png",
        height: 70,
        width: 70,
        //fit: BoxFit.cover,
      ),
        //Image.network(widget.UserObject.User_Photos[0].photo_path),
    );
  }

  /// old function to get profile image from assets folder
  getUserImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: Image.asset(
        ImageConstants.IMG_POST_2,
        fit: BoxFit.cover,
        height: 70,
        width: 70,
      ),
    );
  }

  _getNameAndLocation() {
    getNameLocationCity();
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          firstname+ " " + lastname,
          //AppTexts.FRIEND_NAME,
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
              color: AppColors.vertical_divider,
            ),
            CustomSpacerWidget(
              width: 4,
            ),
            Text(
              city,
              //AppTexts.MOSQUE_LOCATION,
              style: TextStyle(
                fontFamily: FontConstants.FONT,
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppColors.vertical_divider,
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
            Text(
              AppTexts.DISTANCE,
              style: TextStyle(
                fontFamily: FontConstants.FONT,
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppColors.vertical_divider,
              ),
            )
          ],
        ),
      ],
    );
  }


  getNameLocationCity()
  {
    if( widget.UserObject.first_name == null ||  widget.UserObject.first_name == "")
      {
        firstname="Please enter the first name and last name";
        lastname="";
      }else{
      firstname=widget.UserObject.first_name;
      lastname=widget.UserObject.last_name;
    }

    if(widget.UserObject.city == null ||  widget.UserObject.city == "")
      {
        city="Please enter the city";
      }else
        {
          city=widget.UserObject.city;
        }
  }
  _getStatus(){
    print("Checking the REquest status");
    print(friendRequest.isNotEmpty);
    //if (friendRequest.isNotEmpty) {
      print("inside the friend request if condition");
      print(friendRequest);
      for (int i = 0; i < friendRequest.length; i++) {
        print("inside the list");
        if(widget.loginUserId == friendRequest[i].request_from_id  && widget.UserObject.id== friendRequest[i].request_to_id) {
          if (friendRequest[i].request_status == "Sent") {
            status = true;
          } else {
            status = false;
          }
        }
      }
   // }else {
         // status=false;
      //}
    print(status);
   }

  _getRequestSent(){
    return MosqueFollowButton(
      radius: 30,
      // callBack: () {
      //   print("inside the request sent");
      //   _handleSearch();
      // },
      text: AppTexts.REQUEST_SENT_TEXT,
      //text: widget.index==0 ? AppTexts.REQUEST_SENT_TEXT :AppTexts.ADD_FRIEND_TEXT,
      //isFilled: widget.index==0 ? true : false,
      isFilled: true,
    );
  }

  _getAddFriendButton() {
    return MosqueFollowButton(
              radius: 30,
              callBack: () {
                print("Handle CallBack");
                _handleSearch();
              },
              text: AppTexts.ADD_FRIEND_TEXT,
              //text: widget.index==0 ? AppTexts.REQUEST_SENT_TEXT :AppTexts.ADD_FRIEND_TEXT,
              //isFilled: widget.index==0 ? true : false,
              isFilled: false,
            );
  }

  _handleSearch() {
    print("Handle Search!!");
    showDialog(context: context, builder: (context){
      print(widget.UserObject);
      return SendRequestDialogWidget(userObject:widget.UserObject ,loginUserId:widget.loginUserId);
    });
  }

  Future<List<FriendRequest>> friendRequestList() async{
    try{
      friendRequest = await Amplify.DataStore.query(FriendRequest.classType);
      print(friendRequest);
      print("Inside the Friend Request");
      return friendRequest;
    }catch(e)
    {

    }
  }
}
