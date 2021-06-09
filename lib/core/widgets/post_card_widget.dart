import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';
import 'package:mus_greet/core/widgets/footer_icon_text_widget.dart';
import 'package:mus_greet/core/widgets/s3_bucket_image_widget.dart';

/// User Submitted post card..where all data for single post will show on the screen
class PostCardWidget extends StatefulWidget {
  final String profileImage;
  final String name;
  final String image;
  final String timeAgo;
  final String post;
  final bool isSponsored;
  final bool isForComment;
  final Function callBack;
  final String commentsCount;

  PostCardWidget({
    this.profileImage,
    this.name,
    this.image,
    this.timeAgo,
    this.post,
    this.isSponsored,
    this.isForComment = false,
    this.callBack,
    this.commentsCount,
  });

  @override
  _PostCardWidgetState createState() => _PostCardWidgetState();
}

class _PostCardWidgetState extends State<PostCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 4, bottom: widget.isForComment ? 0 : 4),
      width: MediaQuery.of(context).size.width,
      color: AppColors.white,
      child: Column(
        children: [
          _getHeader(),
          _getCaption(),
          _getImageSection(),
          widget.isForComment ?_getFooterForComment() :  _getFooter() ,
        ],
      ),
    );
  }

  ///This is the header section, It will return user details with profile image
  _getHeader() {
    return Container(
      padding: EdgeInsets.only(left: 25, right: 20, top: 5, bottom: 5),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _getProfileImage(),
          CustomSpacerWidget(
            width: 5,
          ),
          Flexible(child: _getUserDetails(),),
        ],
      ),
    );
  }

  /// This will return profile image.
  _getProfileImage() {
    print(widget.profileImage);
    return S3BucketImageWidget(
      image: widget.profileImage,
      height: 50,
      width: 50,
    );
  }

  /// This will return User details like name and time of submission
  _getUserDetails() {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                widget.name,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
              ),
              Expanded(
                child: CustomSpacerWidget(
                  width: 5,
                ),
              ),
              GestureDetector(
                onTap: () => null,
                child: AssetImageWidget(
                  image: ImageConstants.IC_MENU,
                  height: 10,
                  width: 20,
                ),
              )
            ],
          ),
          CustomSpacerWidget(
            height: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.timeAgo,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.normal,
                  color: AppColors.black.withOpacity(.6),
                ),
              ),
              CustomSpacerWidget(
                width: 20,
              ),
              widget.isSponsored
                  ? Container(
                      padding: EdgeInsets.only(
                          top: 3, left: 10, right: 10, bottom: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.GREY_KIND,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        AppTexts.SPONSORED_TEXT,
                        style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.normal,
                          color: AppColors.green,
                        ),
                      ),
                    )
                  : Container(),
            ],
          )
        ],
      ),
    );
  }

  ///This will return caption for the post
  _getCaption() {
    return Container(
      padding: EdgeInsets.only(left: 30, right: 20, bottom: 10),
      child: Text(
        widget.post,
        //AppTexts.DUMMY_TEXT,
        style: TextStyle(
          fontFamily: FontConstants.FONT,
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
        ),
      ),
    );
  }

  /// This will return user submitted [PICTURE]
  _getImageSection() {
    return Image.network(
      widget.image,
      height: 190,
      width: double.infinity,
      fit: BoxFit.fitWidth,
    );
  }

  /// This will return all the Footer buttons
  _getFooter() {
    return Container(
      padding: EdgeInsets.only(top: 15, bottom: 15,left: 10,right: 10),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            padding: EdgeInsets.only(left: 10,right: 10),
            child: FooterIconAndTextWidget(
              image: ImageConstants.IC_APPRECIATE,
              text: AppTexts.APPRECIATE_TEXT,
              count: "1.8k",
            ),
          ),
          Container(
            width: 1.5,
            height: 15,
            color: AppColors.vertical_divider,
          ),
          GestureDetector(
            onTap: () {
              if (widget.callBack != null) {
                widget.callBack();
              }
            },
            child: Container(
              padding: EdgeInsets.only(left: 10,right: 10),
              child: FooterIconAndTextWidget(
                image: ImageConstants.IC_COMMENT,
                text: AppTexts.COMMENT_TEXT,
                //count: "55",
                count: widget.commentsCount,
              ),
            ),
          ),

        ],
      ),
    );
  }

  _getFooterForComment() {
    return Container(
      padding: EdgeInsets.only(top: 15, bottom: 15,left: 10,right: 10),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            padding: EdgeInsets.only(left: 10,right: 10),
            child: FooterIconAndTextWidget(
              image: ImageConstants.IC_APPRECIATE,
              text: AppTexts.APPRECIATE_TEXT,
              count: "1.8k",
            ),
          ),
          Container(
            width: 1.5,
            height: 15,
            color: AppColors.vertical_divider,
          ),
          Container(
            padding: EdgeInsets.only(left: 10,right: 10),
            child: FooterIconAndTextWidget(
              image: ImageConstants.IC_COMMENT,
              text: AppTexts.COMMENT_TEXT,
              //count: "55",
              count: widget.commentsCount,
            ),
          ),
        ],
      ),
    );
  }
}
