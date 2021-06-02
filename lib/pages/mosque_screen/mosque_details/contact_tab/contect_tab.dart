import 'package:flutter/material.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:readmore/readmore.dart';

class ContactTab extends StatefulWidget {
  @override
  _ContactTabState createState() => _ContactTabState();
}

class _ContactTabState extends State<ContactTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 4),
      color: AppColors.white,
      height: MediaQuery.of(context).size.height/4*3,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 30),
            child: Text(
              AppTexts.DESCRIPTION,
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
              )),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 30),
                child: Image.asset(
                  ImageConstants.IC_PHONE,
                  width: 20,
                  height: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 12),
                child: Text(
                  '020 8690 5090',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: FontConstants.FONT,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 30),
                child: Image.asset(
                  ImageConstants.IC_MAIL,
                  width: 20,
                  height: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 12),
                child: Text(
                  'info@lewisham.com.uk',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: FontConstants.FONT,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 30),
                child: Image.asset(
                  ImageConstants.IC_GLOBE,
                  width: 20,
                  height: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 12),
                child: Text(
                  'www.lewisham.com.uk',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: FontConstants.FONT,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 30),
                child: Image.asset(
                  ImageConstants.IC_LOCATION_ROUND,
                  width: 20,
                  height: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 12),
                child: Text(
                  '363 - 365 Lewisham High street, SE13 6NZ',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: FontConstants.FONT,
                      fontWeight: FontWeight.w500,
                      color: AppColors.green),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 10),
                child: Image.asset(
                  ImageConstants.IC_DIRECTION_GREEN,
                  width: 20,
                  height: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );;
  }
}
