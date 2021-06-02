import 'package:flutter/material.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';
import 'package:readmore/readmore.dart';

class MosqueAboutTab extends StatefulWidget {
  @override
  _MosqueAboutTabState createState() => _MosqueAboutTabState();
}

class _MosqueAboutTabState extends State<MosqueAboutTab> {
  @override
  Widget build(BuildContext context) {
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
              AppTexts.ABOUT_TEXT,
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
                  'Not Verified',
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
                      'Madhab • Sect',
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
                      'Sunni',
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
  _getFriendsDataList() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.only(top: 10)),
          _getFriendsDataListItem(),
          Padding(padding: EdgeInsets.only(top: 10)),
          _getFriendsDataListItem(),
          Padding(padding: EdgeInsets.only(top: 30)),
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
  _getFriendsDataListItem() {
    return Row(mainAxisSize: MainAxisSize.max, children: [
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
            Text(
              'Muhammad',
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
              'Chairman',
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
}
