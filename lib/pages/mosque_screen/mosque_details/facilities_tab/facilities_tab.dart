import 'package:flutter/material.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/main.dart';
import 'package:mus_greet/models/Facilitiesmaster.dart';
import 'package:mus_greet/models/Mosque.dart';
import 'package:amplify_flutter/amplify.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;





class FacilitiesTab extends StatefulWidget {
  final List<Mosque> mosque;
  //FacilitiesTab(List<Mosque> mosque);
  FacilitiesTab({this.mosque});
  @override
  _FacilitiesTabState createState() => _FacilitiesTabState();
}

class _FacilitiesTabState extends State<FacilitiesTab> {

 // List<Mosque> mosque;
  List<String> idStringString;
  Map<String,String> SAMPLE;
  List<Facilitiesmaster> facilities = [];



  @override
  Widget build(BuildContext context) {
    print(facilities);
    print(widget.mosque);
    print("inside the build");
    return FutureBuilder<List<Facilitiesmaster>>(
      future: facility(),
      builder: (ctx, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
              facilities = snapshot.data;
            return _buildUI(facilities);
          default:
            return _buildLoadingScreen();
        }
      },
    );
    //getList();
   // getMosque();

  }


  _buildUI(List<Facilitiesmaster> facilities)
  {
    _getList();
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

  _getList()
  {
    var a=widget.mosque[0].mosque_facility_list;
    print("mosque facility list");
    print(a);
    List<dynamic> mosqueFacilitiesList = jsonDecode(a);
    var jsonDecodeMosqueList = mosqueFacilitiesList.join(",");
    var idStringString = (jsonDecodeMosqueList.split(','));
    //idStringString=ab;
    for(int i=0;i<idStringString.length;i++) {
      if (idStringString[i] == facilities[i].id) {
        print(idStringString[i]);
        print("hiiiiii");
        SAMPLE ={
          for(int i=0;i<idStringString.length ;i++)
            facilities[i].facility_header : facilities[i].icon_path,

        };
      }

    }
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
  Future<List<Facilitiesmaster>> facility() async
  {
    try {
      facilities = await Amplify.DataStore.query(Facilitiesmaster.classType);
      print("inside the facilitiy tab");
      print(facilities);
    return facilities;
    } catch (e) {
      print("Could not query DataStore: " + e);
    }
  }

}















