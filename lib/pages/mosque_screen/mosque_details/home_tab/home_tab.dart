//import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';
import 'package:mus_greet/core/widgets/footer_icon_text_widget.dart';
import 'package:mus_greet/core/widgets/post_card_widget.dart';
import 'package:mus_greet/models/ModelProvider.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_datastore_plugin_interface/src/types/temporal/temporal_time.dart';
import 'package:mus_greet/pages/mosque_screen/mosque_details/mosque_comment_screen/mosque_comment_screen.dart';

class HomeTab extends StatefulWidget {
  final List<Mosque> mosque;
  HomeTab({this.mosque});
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List<MosquePrayers> mosquePrayers;
  DateTime date = DateTime.now();
  int count=0;
  int countback=0;
  bool _isIcon =true;
  Mosque MosqueObject;
  List<Posts> Postss =[];

  @override
  Widget build(BuildContext context) {
    MosqueObject = widget.mosque[0];
    return FutureBuilder<List<MosquePrayers>>(
      future: getMosquePrayers(),
      builder: (ctx, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            mosquePrayers = snapshot.data;
            return buildGetPosts(mosquePrayers,MosqueObject);
          default:
            return _buildLoadingScreen();
        }
      },
    );
  }

  _getPrayerTable() {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
            flex: 1,

            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_sharp),
              color: AppColors.black,
                disabledColor: Colors.orange,
              onPressed: () {
                String backward="backward";
                _clickingiconButton(backward);
              }

            ),

          ),

          _horizontalList(),
          Flexible(
            flex: 1,
            child: IconButton(
              icon: const Icon(Icons.arrow_forward_ios_sharp),
              color: AppColors.black,
                disabledColor: Colors.orange,
              onPressed:  () async
              {
                String iconName="forward";
                   _clickingiconButton(iconName);
              },
            ),
            //),
          ),
        ],
      ),
    );
  }

  _clickingiconButton(String icon) {
      countback=0;
      count=0;
      DateTime sample=DateTime.now().add(Duration(days: 6));
      final diffrence=sample.difference(date).inDays;
      if(icon == "forward")
        {
       if(diffrence ==0 )
         {

           setState(() {
             _isIcon =false;
           });
           print("stopp");

         }else
           {
      setState(() {
        count++;
        date = date.add(Duration(days: count));
      });}}
       else
         {
           if(diffrence==6)
           {
             print("stopp backward");
           }else {
             setState(() {
               countback++;
               date = date.subtract(Duration(days: countback));
             });
           }
         }
  }


  _horizontalList() {
    return Flexible(
      flex: 11,
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 20.0),
          height: 130.0,
          child: new ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
           new ListView.builder(
               shrinkWrap: true,
               scrollDirection: Axis.horizontal,
               itemCount:mosquePrayers.length,
               itemBuilder: (context,index){
                return Container(
                  width: 55,
                  padding: EdgeInsets.only(left: 3, right: 3, top: 5, bottom: 3),
                  child: Card(
                    color: AppColors.white,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(width: 0.5, color: Colors.white),
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 2,
                    margin: EdgeInsets.zero,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0, left: 5),
                          child: Text(
                            'FAJIR',
                            style: TextStyle(
                                fontSize: 9,
                                fontFamily: FontConstants.FONT,
                                fontWeight: FontWeight.w500,
                                color: AppColors.green),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 3.0, left: 5),
                          child: Text(
                            'BEGINS',
                            style: TextStyle(
                                fontSize: 10,
                                fontFamily: FontConstants.FONT,
                                fontWeight: FontWeight.w500,
                                color: AppColors.light_grey),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 3.0, left: 5),
                          child: Text(
                            //'${DateFormat('hh:mm').format(mosquePrayers[index].begin_time.getDateTime())}',
                            "DateFormate",
                            style: TextStyle(
                                fontSize: 10,
                                fontFamily: FontConstants.FONT,
                                fontWeight: FontWeight.bold,
                                color: AppColors.black),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 3.0, left: 5),
                          child: Text(
                            '--',
                            style: TextStyle(
                                fontSize: 10,
                                fontFamily: FontConstants.FONT,
                                fontWeight: FontWeight.w500,
                                color: AppColors.green),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 3.0, left: 3),
                          child: Text(
                            'JAMAAT',
                            style: TextStyle(
                                fontSize: 9,
                                fontFamily: FontConstants.FONT,
                                fontWeight: FontWeight.bold,
                                color: AppColors.black_50),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 3.0, left: 5),
                          child: Text(
                            //'${DateFormat('hh:mm').format(mosquePrayers[index].end_time.getDateTime())}',
                            "Date Formate",
                            style: TextStyle(
                                fontSize: 10,
                                fontFamily: FontConstants.FONT,
                                fontWeight: FontWeight.bold,
                                color: AppColors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                );}),
              //_getPrayerItem(),
              //(),
              //_getPrayerItem(),
              // _getPrayerItem(),
              //_getPrayerItem(),
          ]),


      ),
    );
  }

  _getTopPost() {
    return Container(
      width: double.infinity,
      color: AppColors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 24.0, left: 25),
            child: Text(
              'Top Post',
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: FontConstants.FONT,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25,right: 25,top: 10,bottom: 15),
            child: Material(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  side: BorderSide(width: 0.5, color: Colors.white),
                  borderRadius: BorderRadius.circular(15)),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.white,
                ),

                child: Column(
                  children: [
                    _getTopMost(),
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 15.0, right: 15, top: 10),
                      child: Text(
                        AppTexts.DUMMY_TEXT,
                        style: TextStyle(
                          fontFamily: FontConstants.FONT,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:15,right:15,top:12),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(topLeft:Radius.circular(10),
                            topRight: Radius.circular(10)),

                        child: Image.asset(
                          ImageConstants.IMG_POST_2,
                          fit: BoxFit.cover,
                          height: 120,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    Padding(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Flexible(
                              flex: 1,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(bottomLeft:Radius.circular(10) ),

                                child: Image.asset(
                                  ImageConstants.IMG_POST1,
                                  fit: BoxFit.cover,
                                  height: 60,
                                ),
                              ),
                            ),
                            CustomSpacerWidget(width: 3,),
                            Flexible(
                              flex: 1,
                              child: ClipRRect(
                                child: Image.asset(
                                  ImageConstants.IMG_POST_2,
                                  fit: BoxFit.cover,
                                  height: 60,
                                ),
                              ),
                            ),
                            CustomSpacerWidget(width: 3,),
                            Flexible(
                              flex: 1,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(bottomRight:Radius.circular(10) ),
                                child: Image.asset(
                                  ImageConstants.IMG_POST1,
                                  fit: BoxFit.cover,
                                  height: 60,
                                ),
                              ),
                            )
                          ],
                        ),
                        padding: EdgeInsets.only(top:3,left:15,right:15)
                    ),
                    _getFooterForComment()
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _getTopMost() {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, top: 5.5, right: 15.0),
      child: Row(
        children: [
          _getTopMostImage(),
          CustomSpacerWidget(
            width: 10,
          ),
          _getTopMostTitle(),
          Spacer(),
          Image.asset(
            ImageConstants.IC_THREE_DOTS,
            width: 20,
            height: 20,
          )
        ],
      ),
    );
  }

  _getTopMostImage() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Image.asset(
          ImageConstants.IMG_MOSQUE,
          fit: BoxFit.cover,
          height: 46,
          width: 46,
        ),
      ),
    );
  }

  _getTopMostTitle() {
    return Padding(
      padding: const EdgeInsets.only(top: 11.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Muhammad Rehan',
            style: TextStyle(
              fontFamily: FontConstants.FONT,
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'W14 - 1h ago',
                style: TextStyle(
                  fontFamily: FontConstants.FONT,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black_50,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _getFooterForComment() {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FooterIconAndTextWidget(
            image: ImageConstants.IC_APPRECIATE,
            text: AppTexts.APPRECIATE_TEXT,
            count: "1.8k",
          ),
          Container(
            width: 1.5,
            height: 15,
            color: AppColors.vertical_divider,
          ),
          FooterIconAndTextWidget(
            image: ImageConstants.IC_COMMENT,
            text: AppTexts.COMMENT_TEXT,
            count: "55",
          ),
        ],
      ),
    );
  }


  Future<List<MosquePrayers>> getMosquePrayers() async {
    try {
     // mosquePrayers = await Amplify.DataStore.query(MosquePrayers.classType , where: MosquePrayers.DATE.eq(DateFormat('yyyy-MM-dd').format(date)));
      mosquePrayers = await Amplify.DataStore.query(MosquePrayers.classType , where: MosquePrayers.DATE.eq("2021-06-17"));
      print(mosquePrayers);
  return mosquePrayers;

    } catch (e) {
      print("Could not query DataStore: " + e.stacktrace);
    }
  }
  Future<List<Posts>> getMosquePosts(Mosque MosqueObject) async {
    try {
      //List<Posts>
      Postss = await Amplify.DataStore.query(Posts.classType, where: Posts.MOSQUESID.eq(MosqueObject.id));
      print(Postss);
      print("inside posts");
      return Postss;
    } catch (e) {
      print("Could not query DataStore: " + e);
    }
  }


  buildGetPosts(List<MosquePrayers> mosquePrayers, Mosque MosqueObject) {
    return FutureBuilder<List<Posts>>(
      future: getMosquePosts(MosqueObject),
      builder: (ctx, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            Postss = snapshot.data;
            return buildMosquePosts(mosquePrayers,MosqueObject, Postss);
          default:
            return _buildLoadingScreen();
        }
      },
    );;

  }

  buildMosquePosts(List<MosquePrayers> mosquePrayers, Mosque MosqueObject, List<Posts> posts){
    return Column(
      children: [
        Container(
          color: AppColors.white,
          margin: EdgeInsets.only(top: 4),
          padding: const EdgeInsets.only(top: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Row(
                  children: [
                    Text(
                      'Prayer Times',
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: FontConstants.FONT,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black),
                    ),
                    CustomSpacerWidget(
                      width: 3,
                    ),
                    Text(
                      '•',
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: FontConstants.FONT,
                          fontWeight: FontWeight.bold,
                          color: AppColors.green),
                    ),
                    CustomSpacerWidget(
                      width: 3,
                    ),
                    Text(
                      'View upto 7 days in advance',
                      style: TextStyle(
                          fontSize: 10,
                          fontFamily: FontConstants.FONT,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black_50),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Row(
                  children: [
                    Text(
                      //DateFormat('d MMMM yyyy').format(date),
                      //DateFormat('d MMM yyyy').format(date),
                      "Date format",
                      style: TextStyle(
                          fontSize: 10,
                          fontFamily: FontConstants.FONT,
                          fontWeight: FontWeight.bold,
                          color: AppColors.green),
                    ),
                    CustomSpacerWidget(
                      width: 3,
                    ),
                    Text(
                      '•',
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: FontConstants.FONT,
                          fontWeight: FontWeight.bold,
                          color: AppColors.green),
                    ),
                    CustomSpacerWidget(
                      width: 3,
                    ),
                    Text(
                      //DateFormat('EEEE').format(date),
                      "Date Format",
                      style: TextStyle(
                          fontSize: 10,
                          fontFamily: FontConstants.FONT,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black),

                    ),
                  ],
                ),
              ),
              _getPrayerTable(),

              CustomSpacerWidget(
                height: 10,
              ),
            ],
          ),
        ),

        CustomSpacerWidget(height: 5,),
        //_getTopPost()
        _getPosts(MosqueObject,posts)
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

  _getPosts(Mosque MosqueObject,List<Posts> posts) {
    return Container(
      width: double.infinity,
      color: AppColors.white,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 24.0, left: 25),
            child: Text(
              'Top Post',
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: FontConstants.FONT,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25,right: 25,top: 10,bottom: 15),
            child: Material(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: Colors.white),
                  borderRadius: BorderRadius.circular(0)),
              child: ListView.separated(
                //physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index){
                  print(index);
                  return getpostcardWidget(posts[index],MosqueObject);
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    height: 1,
                    color: Colors.transparent,
                  );
                },
                itemCount: posts.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getpostcardWidget(Posts postData, Mosque mosqueObject) {
    return FutureBuilder<int>(
      future: _countComments(postData.id),
      builder: (ctx, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            int CommentsCount = snapshot.data;
            return PostCardWidget(
              //profileImage: ImageConstants.IC_HOME_USER1,
              //profileImage: Image.network('https://picsum.photos/250?image=9'),
              //profileImage: "https://musgreetphase1images184452-staging.s3.eu-west-2.amazonaws.com/public/public.png",
              profileImage: MosqueObject.mosque_photos_list,
              //name: AppTexts.TEMP_NAME1,
              //name: Postss[index].usersID,
              //name: UserObject.first_name,
              //name: UserObjectList[0].first_name,
              //name: UserData.first_name + " "+ UserData.last_name,
              name: MosqueObject.mosque_name,
              isSponsored: false,
              //timeAgo: AppTexts.TEMP_TIME_AGO_1,
              timeAgo: MosqueObject.postcode,
              //image: ImageConstants.IMG_POST1,
              post:postData.post,
              image: postData.post_image_path,
              //image: "https://musgreetphase1images184452-staging.s3.eu-west-2.amazonaws.com/public/image_picker5824495182282881133.jpg",
              //image: "https://musgreetphase1images184452-staging.s3.eu-west-2.amazonaws.com/public/post_img_2.png",
              //callBack: () => _loadCommentScreen(),
              //callBack: () => _loadCommentScreen(Postss[index].id, User[0], Postss[index].post, Postss[index].post_image_path),
              callBack: () => _loadCommentScreen(postData, mosqueObject, CommentsCount.toString()),
              commentsCount:CommentsCount.toString(),
            );
          default:
            return _buildLoadingScreen();
        }
      },
    );
  }

  Future<int> _countComments(String PostID) async {
    int CommentsCount = 0;
    print(CommentsCount);
    try {
      List<PostComments> Comments = await Amplify.DataStore.query(PostComments.classType, where: PostComments.POSTSID.eq(PostID));
      print("Comments Length" + Comments.length.toString());
      if(Comments.isNotEmpty){
        for(var i in Comments){
          if(i.parent_id == ""){
            CommentsCount ++;
          }
        }
      }
      print("Comments Count" + CommentsCount.toString());
      //await Future.delayed(Duration(seconds: 2));
      return CommentsCount;
    } catch (e) {
      print("Could not query DataStore: " + e);
    }
  }

  _loadCommentScreen(Posts PostObject, Mosque MosqueObject, String CommentsCount) {
    //Navigation.intent(context, CommentScreen(PostID: PostID,UserName: UserName, Post: Post, Post_image_path: Post_Image_path));
    print(CommentsCount);
    Navigator.push(context,
        MaterialPageRoute(
          builder: (context) => MosqueCommentScreen(PostObject: PostObject, CommentsCount: CommentsCount, MosqueObject: MosqueObject),
        )
    );
    //CommentScreen(PostID: PostID,UserName: UserName, Post: Post, Post_image_path: Post_Image_path,);
    //print("Hello inside load comment screen");
    // print(PostID+ UserName+ Post+ Post_Image_path );
    setState(() {
      //_navigateToComment = true;
    });
  }

}
