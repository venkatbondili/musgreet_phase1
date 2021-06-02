import 'package:flutter/material.dart';
import 'package:mus_greet/core/utils/constants.dart';


class FacilitiesTab extends StatefulWidget {
  @override
  _FacilitiesTabState createState() => _FacilitiesTabState();
}

class _FacilitiesTabState extends State<FacilitiesTab> {

  final titleList = AppTexts.FACILITIES.keys;
  final imageList = AppTexts.FACILITIES.values;

  @override
  Widget build(BuildContext context) {
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
            itemCount: titleList.length,
            itemBuilder: (BuildContext context, int index) {
              final title = titleList.elementAt(index);
              final image = imageList.elementAt(index);
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
}
