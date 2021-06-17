import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';
import 'package:mus_greet/core/widgets/footer_icon_text_widget.dart';
import 'package:mus_greet/models/ModelProvider.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_datastore_plugin_interface/src/types/temporal/temporal_time.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List<MosquePrayers> mosquePrayers;
  DateTime date = DateTime.now();
  int count=0;
  int countback=0;
  bool _isIcon =true;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MosquePrayers>>(
      future: getMosquePrayers(),
      builder: (ctx, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            mosquePrayers = snapshot.data;
            return buildUi(mosquePrayers);
          default:
            return _buildLoadingScreen();
        }
      },
    );
  }

  buildUi(List<MosquePrayers> mosquePrayers)
  {
    //getMosquePrayers();
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
                      DateFormat('d MMMM yyyy').format(date),
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
                      DateFormat('EEEE').format(date),
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

        _getTopPost()
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

  _getPrayerTable()
  {
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
                            '${DateFormat('hh:mm').format(mosquePrayers[index].begin_time.getDateTime())}',
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
                            '${DateFormat('hh:mm').format(mosquePrayers[index].end_time.getDateTime())}',
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


  Future<List<MosquePrayers>> getMosquePrayers() async
  {
    try {
     mosquePrayers = await Amplify.DataStore.query(MosquePrayers.classType , where: MosquePrayers.DATE.eq(DateFormat('yyyy-MM-dd').format(date)));

      print(mosquePrayers);
  return mosquePrayers;

    } catch (e) {
      print("Could not query DataStore: " + e.stacktrace);
    }
  }

}
