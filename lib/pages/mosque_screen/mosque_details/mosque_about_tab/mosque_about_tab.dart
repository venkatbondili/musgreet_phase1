import 'package:flutter/material.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';
import 'package:mus_greet/main.dart';
import 'package:mus_greet/models/ModelProvider.dart';
import 'package:mus_greet/models/Mosque.dart';
import 'package:readmore/readmore.dart';
import 'package:amplify_flutter/amplify.dart';

class MosqueAboutTab extends StatefulWidget {
  @override
  _MosqueAboutTabState createState() => _MosqueAboutTabState();
}

class _MosqueAboutTabState extends State<MosqueAboutTab> {
  var string="50a1d745-b0b8-4e1a-b649-3141c3c1ea6a";
  String  verfied;
  List<MosqueUsers> mosqueUsers;
  List<Mosque> mosque;
  @override
  Widget build(BuildContext context) {
    aboutMosque();
    gettingUsers();
    return Container(
      padding: EdgeInsets.only(bottom: 100),
      margin: EdgeInsets.only(top: 4),
      color: AppColors.white,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 30),
            child: Text(
              mosque[0].about,
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: FontConstants.FONT,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 30),
            child: ReadMoreText(
              AppTexts.DUMMY_TEXT_BIG,
              trimLines: 3,
              colorClickableText: Colors.green,
              trimMode: TrimMode.Line,
              trimCollapsedText: 'read more',
              trimExpandedText: 'read less',
              style: TextStyle(
                  fontSize: 13,
                  fontFamily: FontConstants.FONT,
                  fontWeight: FontWeight.w300,
                  color: AppColors.black),
              moreStyle: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 13,
                  fontFamily: FontConstants.FONT,
                  fontWeight: FontWeight.w300,
                  color: AppColors.green),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 30),
                child: Image.asset(
                  ImageConstants.IC_NOT_VERIFIED,
                  width: 20,
                  height: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 13),
                child: Text(
                  verfied,
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: FontConstants.FONT,
                      fontWeight: FontWeight.bold,
                      color: AppColors.header_black),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 30),
                child: Image.asset(
                  ImageConstants.IC_MAHAB,
                  width: 20,
                  height: 20,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0, left: 12),
                    child: Text(
                      'Madhab •Sect',
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: FontConstants.FONT,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0.0, left: 13),
                    child: Text(
                      mosque[0].sect,
                      style: TextStyle(
                          fontSize: 13,
                          fontFamily: FontConstants.FONT,
                          fontWeight: FontWeight.bold,
                          color: AppColors.GREY_KIND),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 30),
                child: Image.asset(
                  ImageConstants.IC_COMMUNITY,
                  width: 20,
                  height: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 13),
                child: Text(
                  'Community Managers',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: FontConstants.FONT,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black),
                ),
              ),
            ],
          ),
         _getFriendsDataList(),
        ],
      ),
    );
  }

  /// This will render all the friends list
  _getFriendsDataList1() {
    print(mosqueUsers.length);
    return Container(
    width: MediaQuery.of(context).size.width,
    child: Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget> [
    Padding(padding: EdgeInsets.only(top: 10)),
    //_getFriendsDataListItem(),
    Padding(padding: EdgeInsets.only(top: 10)),
    //_getFriendsDataListItem(),
    //Padding(padding: EdgeInsets.only(top: 30)),
    ],
    ),
    );

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

  /// This will render all the friends item
  _getFriendsDataListItem1() {
      return Row(
          mainAxisSize: MainAxisSize.max,
          children: [
        getCommonPadding(
            68,
            6,
            0,
            12,
            Center(
              child: AssetImageWidget(
                image: ImageConstants.IC_FATHER,
                height: 35,
                width: 35,
              ),
            )),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getCommonPadding(
              0,
              6,
              0,
              27,
              Text("Hello",
                //mosqueUsers[index].name,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black),
              ),
            ),

            getCommonPadding(
              0,
              3,
              0,
              27,
              Text("Hi",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: AppColors.GREY_KIND),
              ),
            ),
          ],
        ),
      ]);
  }
  Future<void> aboutMosque() async{

    try {
      mosque = await Amplify.DataStore.query(Mosque.classType ,where :Mosque.ID.eq(string));

      if(mosque[0].is_verified==true)
        {
          verfied ="Verified";
        }else{
        verfied ="Not Verified";
      }
      //print(mosque[0].house_number);
    } catch (e) {
      print("Could not query DataStore: " + e);
    }
  }

  Future<void> gettingUsers() async{
    try {
      mosqueUsers = await Amplify.DataStore.query(MosqueUsers.classType , where: MosqueUsers.MOSQUEID.eq(string));


      print(mosqueUsers);
      //print(mosquePrayers[0].time);
    } catch (e) {
      print("Could not query DataStore: " + e);
    }
  }

  _getFriendsDataList() {
    print(mosqueUsers.length);
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Padding(padding: EdgeInsets.only(top: 10)),
          ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount:mosqueUsers.length,
              itemBuilder: (context,index){
                print(index);
                return  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      getCommonPadding(
                          68,
                          6,
                          0,
                          12,
                          Center(
                            child: AssetImageWidget(
                              image: ImageConstants.IC_FATHER,
                              //image:mosqueUsers[index].photo_path,
                              height: 35,
                              width: 35,
                            ),
                          )),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          getCommonPadding(
                            0,
                            6,
                            0,
                            27,
                            Text(
                              mosqueUsers[index].name,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.black),
                            ),
                          ),

                          getCommonPadding(
                            0,
                            3,
                            0,
                            27,
                            Text(
                              mosqueUsers[index].role,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.GREY_KIND),
                            ),
                          ),
                        ],
                      ),
                    ]);
              })
          //Padding(padding: EdgeInsets.only(top: 10)),
          //_getFriendsDataListItem(),
          //Padding(padding: EdgeInsets.only(top: 30)),
        ],
      ),
    );

  }

}
