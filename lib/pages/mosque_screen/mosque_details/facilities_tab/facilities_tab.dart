import 'package:flutter/material.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/main.dart';
import 'package:mus_greet/models/Facilitiesmaster.dart';
import 'package:mus_greet/models/Mosque.dart';
import 'package:amplify_flutter/amplify.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;





class FacilitiesTab extends StatefulWidget {
  @override
  _FacilitiesTabState createState() => _FacilitiesTabState();
}

class _FacilitiesTabState extends State<FacilitiesTab> {

  List<Facilitiesmaster> facilities;
  List<Mosque> mosque;
  List<String> idStringString;
  Map<String,String> SAMPLE;


  String idString="50a1d745-b0b8-4e1a-b649-3141c3c1ea6a";

  @override
  Widget build(BuildContext context) {
    facility();
    //getList();
    getMosque();
    return Container(
      margin: EdgeInsets.only(top: 4),
      color: AppColors.white,
      padding: EdgeInsets.only(bottom: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 30),
            child: Text(
              AppTexts.FACILITIES_TEXT,
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: FontConstants.FONT,
                  fontWeight: FontWeight.bold,
                  color: AppColors.header_black),
            ),
          ),
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(left: 8, right: 8, bottom: 10, top: 5),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                childAspectRatio: 6),
            itemCount: SAMPLE.length,
            itemBuilder: (BuildContext context, int index) {
              final title =SAMPLE.keys.elementAt(index);
              print(title);
              final image =SAMPLE.values.elementAt(index);
              print(image);
              //get your item data here ...
              return Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, left: 30),
                    child: Image.asset(
                      image,
                      width: 15,
                      height: 15,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 12),
                      child: Text(
                        title,
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: FontConstants.FONT,
                            fontWeight: FontWeight.w600,
                            color: AppColors.header_black),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }


  Future<void> getMosque() async
  {
  try {
  mosque = await Amplify.DataStore.query(Mosque.classType , where:Mosque.ID.eq("c506d8a9-6eb7-4337-9e43-423a97d62455"));
  var a=mosque[0].mosque_facility_list;
  var ab = (a.split(','));
  idStringString=ab;

  for(int i=0;i<idStringString.length;i++) {
    if (idStringString[i] == facilities[i].id) {
      print(idStringString[i]);
      print("hiiiiii");
        SAMPLE ={
         for(int i=0;i<idStringString.length ;i++)
         facilities[i].facility_header : facilities[i].icon_path,

      };


      print(SAMPLE);
      print("Hello");

    }


  }

  //print(mosque[22]);
  } catch (e) {
  print("Could not query DataStore: " + e.StackTrace);
  }
  }




  Future<void> facility() async
  {
    try {
      facilities = await Amplify.DataStore.query(Facilitiesmaster.classType  );
      print(facilities);

    } catch (e) {
      print("Could not query DataStore: " + e);
    }
  }


}















