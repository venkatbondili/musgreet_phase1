import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mus_greet/core/utils/size_config.dart';

class Constants{
  static const APP_NAME= "Mus-Greet";
}

///All Colors used in app
class AppColors{
  static const Color GREY_KIND = Color(0xffcecece);
  static const Color GREY_KIND_40 = Color(0x40cecece);
  static const Color white = Color(0xffF6F6FF);
  static const Color black = Color(0xff1d1d1d);
  static const Color green = Colors.green;
  static const Color vertical_divider=Color(0xff707070);
  static const Color comment_wall_color=Color(0xffE8E8E8);
  static const Color background_color=Color(0xff278034);
  static const Color light_grey = Color(0xffcecece);
  static const Color black_50 = Color(0x50000000);
  static const Color green_light = Color(0x40278034);
  static const Color header_black= Color(0xff1d1d1d);
  static const Color white_shade= Color(0xfff2f2f2);
  static const Color red_shade =Color(0xFFEF9A9A);

}
const kPrimaryColor = Color(0xFFFF7643);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);
const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);
// Form Error
final RegExp emailValidatorRegExp =
RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

final otpInputDecoration = InputDecoration(
  contentPadding:
  EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}

///Hard Coded text
class AppTexts {
  static const String HOME_TEXT="Home";
  static const String MOSQUE_TEXT ="Mosque";
  static const String CREATE_TEXT="Create";
  static const String MESSAGE_TEXT="Messages";
  static const String PROFILE_TEXT="Profile";
  static const String SPONSORED_TEXT="Sponsored";
  static const String APPRECIATE_TEXT="Appreciate";
  static const String COMMENT_TEXT="Comment";
  static const String SHARE_TEXT="Shares";

  static const String TEMP_TIME_AGO_1 ="W14 - 1h ago";
  static const String TEMP_TIME_AGO_2 ="EC3 - 2w ago";

  static const String DUMMY_TEXT =
      "Lorem Ipsum is simply dummy text of the printing and types editing industry. Lorem Ipsum has been the industry";
  static const String TEMP_NAME1 = "Muhammad Rehan";
  static const String TEMP_NAME2 = "Hajj Special Travel Co";
  static const String TEMP_USER_NAME = "Muhammad Humza";
  static const String TEMP_LOCATION = "London.UK";
  static const String EDIT_PROFILE_TEXT = "Edit Profile";
  static const String VIEW_PROFILE_TEXT = "View profile as Visitor";
  static const String POST_TEXT = "Posts";
  static const String ABOUT_TEXT = "About";
  static const String INTEREST_TEXT = "Interests";
  static const String FRIENDS_TEXT = "Friends";
  static const String HINT_TEXT = "Whats on your mind ?";
  static const String MUS_TEXT = "Mus-";
  static const String GREET_TEXT = "Greet";
  static const String VIEW_ALL_COMMENT = "View all comments";
  static const String COMMENT_USER_NAME = "Alishba Mubeen";
  static const String COMMENT_SCREEN_TEXT =
      '"This looks amazing and a good Initiative to build a community". Keep it up!';
  static const String COMMENT_SCREEN_TEXT2 =
      '"This looks amazing and a good Initiative to build a community".';
  static const String TIME_AGO_COMMENT = "2m ago";
  static const String REPLAY_COMMENT = "Replay";
  static const String GALLERY = "Upload from Gallery";
  static const String CAMERA = "Open Camera";
  static const String CANCEL = "Cancel";
  static const String ADD_SKILLS = "Add Skills";
  static const String CHOOSE_SKILLS = "Choose your skills below";
  static const String ADD = "Add";
  static const String ADD_EDUCATION = "Add Education";
  static const String ADD_YOUR_SCHOOL_COLLEGE =
      "Add your School / College / University";
  static const String ADD_YOUR_DEGREE = "Add your Degree / Certificate";
  static const String ADD_FROM = "From";
  static const String ADD_TO = "To";
  static const String ADD_MORE = "Add more";
  static const String LABEL_SELECT = "Select";
  static const String SAVE = "Save";
  static const String BIO = "Bio";
  static const String DETAILS = "Details";
  static const String EDUCATION = "Education";
  static const String EMAIL = "Email";
  static const String PHONE = "phone";
  static const String CONTACT_INFORMATION = "Contact Information";
  static const String GENERAL_INFORMATION = "General Information";
  static const String JOINED_MUSGREET = "Joined Musgreet";
  static const String GENDAR = "Gendar";
  static const String AGE = "Age";
  static const String RELATION_SHIP = "Relationship";
  static const String LANGUAGE_SPOKEN = "Language Spoken";
  static const String ADDRESS = "Address";
  static const String FAITH = "Faith";
  static const String SECT = "Sect";
  static const String ARE_YOU_A_REVERT = "Are you a revert";
  static const String INTERESTED_IN_ISLAM = "Interested in Islam";
  static const String FAMILY_MEMBERS = "Family Members";
  static const String PROFILE_POLICY = "Profile Privacy";
  static const String PROFILE_VIEW = "Profile View";
  static const String COMMUNITY_INTEREST = "Community Interests";
  static const String INTEREST = "Interests - ";
  static const String SKILLS = "Skills - ";
  static const String RELIGIOUS_INTEREST = "Religious Interests - ";
  static const String MY_FAMILY="My Family";
  static const String ADD_A_FAMILY_MEMBER="Add a family member";
  static const String FAMILY_MEMBER_NAME="Whats their name";
  static const String WRITE_NAME="Write the name";
  static const String REMOVE="Remove";
  static const String INTEREST_TEXT_HEADER="Interest";
  static const String CHOOSE_INTEREST="Choose your interest below";
  static const String INTEREST_HOBBIES="Hobbies";
  static const String INTEREST_SPORTS_EXERCISE="Sports And Exercise";
  static const String INTEREST_FAMILY_OUTDOOR="Family And Outdoors";
  static const String INTEREST_VOLUNTEER="Volunteer";
  static const String INTEREST_COMMUNITY_INVOLVEMENT="Community Involvement";
  static const String BRAND_VALUE_TEXT="Own a business or are self employed, increase your brands awareness and let the community know with a business Profile!";
  static const String FRIENDS_TEXT_6 = "Friends - 6";
  static const String REQUEST_4 = "Request - 3";
  static const String SENT_4 = "Sent - 4";
  static const String UNFRIEND = "Unfriend";
  static const String SEARCH="Search";
  static const String ADVANCE_SEARCH ="Advance Search";
  static const String LABEL_CURRENT_LOCATION="Your Current Location";
  static const String HINT_LOCATION="e.g. SE1 2RE or 'London Bridge'";
  static const String MOSQUE_NAME="Madina Mosque Community";
  static const String MOSQUE_LOCATION ="London, UK";
  static const String SHIA_TEXT="Shia • 0.6 mi";
  static const String FOLLOW_TEXT="Follow";
  static const String UNFOLLOW_TEXT="Unfollow";
  static const String CURRENT_FOLLOWING="You are currently following :";
  static const String SEARCH_BASED_ON_FACILITIES="Search mosque based on facilities";
  static const String APPLY_TEXT="Apply";
  static const String DISTANCE="0.6 mi";
  static const String MEMBER_COUNT="• 7.5k Members";
  static const String ADD_FRIEND_TEXT="Add Friend";
  static const String REQUEST_SENT_TEXT="Request Sent";
  static const String FRIEND_NAME="Ahmed Ali Ansari";
  static const String FOUND_RESULT="We found 6 result";
  static const String TO_USER="To: ";
  static const String TO_USER_NAME="Ahmad Mumtaz Malik";
  static const String SEND_TEXT="Send";
  static const String SEARCH_BY="Search by";
  static const String BIO_TEXT =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris ";
  static const String CONTACT_TEXT="Contact";
  static const String FACILITIES_TEXT="Facilities";
  static const String DESCRIPTION = "Description";
  static const String DUMMY_TEXT_BIG = "Lorem Ipsum is simply dummy text of the printing and types editing industry. Lorem Ipsum has been the industry. Lorem Ipsum is simply dummy text of the printing and types editing industry. Lorem Ipsum has been the industry";
  static const String CREATE_POST="Create Post";
  static const String YOUR_THOUGHTS="Whats on your mind?";
  static const String CAMERA_TEXT="Camera";
  static const String GALLERY_TEXT="Gallery";
  static const String CHANGE_TEXT ="Change";
  static const String POST_VISIBILITY ="Post Visibility";
  static const String PUBLIC_TEXT ="Public";
  static const String POST_BUTTON_TEXT ="Post";
  static const String ADD_RELIGIONS = "Add Religious Interests";
  static const String CHOOSE_RELIGIONS = "Choose your religious interests below";
  static const String SELECT="Select";
  static const String SEARCH_EDUCATION = "Search Education";
  static const String SEARCH_INTERESTS = "Search Interests";
  static const String LANGUAGES = "Languages you have in common";
  static const String SEARCH_SKILLS = "Search Skills";
  static const String SEARCH_FAITH_INTERESTS = "Search Faith Interests";
  static const String REVERT = "Revert";
  static const String SELECT_LANGUAGES = "Select Languages";
  static const String CHOOSE_LANGUAGES = "Choose Languages you can speak";
  static const String FRIEND_REQUEST_MESSAGE = "Hello, I hope you are well. We both are in the same community and have similar interests. Let's connect and grow the community...";
  static const String ISLAM_INTREST="Islam Intrest";
  static const String LOGIN_TEXT="Login";
  static const String PASSWORD_TEXT="Password";
  static const String FORGOT_PASSWORD_TEXT="Forgot Password?";
  static const String DO_NOT_HAVE_ACCOUNT="Don't have an account?";
  static const String REGISTER_TEXT="Register";
  static const String SOCIAL_ACCOUNT_TO_LOGIN="Use social account to Login";
  static const String CONTINUE="Continue";
  static const String HAVE_AN_ACCOUNT="Already have an account?";
  static const String RE_ENTER_PASSWORD="Re-Type Password";
  static const String PASSWORD_DIRECTION="Password should be 8 characters in length, contain one uppercase and one special character";
  static const String REGISTRATION_TEXT="Registration";
  static const String FIRST_NAME="First Name";
  static const String LAST_NAME="Last Name";
  static const String CODE_EXPIRED_TEXT="Sorry your code has expired,\nplease click resend code";
  static const String RESEND_CODE_TEXT="Resend code";
  static const String VERIFY_TEXT="Verify";
  static const String VERIFY_EMAIL_TEXT="Verify your Email";
  static const String ENTER_CODE_HINT="Please enter the 6 digit code sent to";

  static const List<String> INTEREST_BASED_SEARCH=[
    "Interests...",
    "Skills...",
    "Faith...",
    "Education...",
    "Local mosque...",
    "Business services...",
  ];

  static const Map<String,String> SKILLS_CATEGORIES = const {
    "Business & Office" : "assets/images/business_owners.png",
    "ChildCare" : "assets/images/childcare.png",
    "Clothing" : "assets/images/clothing.png",
    "Computers & Marketing" : "assets/images/computers_and_marketing.png",
    "Entertainment" : "assets/images/entertainment.png",
    "Finance & Legal" : "assets/images/finance_and_legal.png",
    "Goods Suppliers & Retailers" : "assets/images/goods_suppliers_and_retailers.png",
    "Health-Beauty-Fitness" : "assets/images/health_beauty_fitness.png",
    "Motoring" : "assets/images/motoring.png",
    "Pets" : "assets/images/pets.png",
    "Online Shopping" : "assets/images/online_shopping.png",
    "Property & Maintenance" : "assets/images/property_and_maintenance.png",
    "Tradesman & Construction" : "assets/images/tradesman_and_construction.png",
    "Public" : "assets/images/public.png",
    "Transport" : "assets/images/transport.png",
    "Travel & Tourism" : "assets/images/travel_and_tourism.png",
    "Tuition & Classes" : "assets/images/tuition_and_classes.png",
    "Wedding" : "assets/images/weddings.png",
  };

  static const List<String> COLLEGE_CATEGORIES = [
    "London school of economics",
    "IIT Delhi",
    "IIM Delhi",
    "Kolkata University ",
    "Academy of Technology",
    "IIM Dhanbad",
    "IIIT Bhopal",
    "Duke University",
  ];

  static const List<String> DEGREE_CATEGORIES = [
    "Biomedical engineering",
    "Occupational therapy",
    "Structural engineering",
    "Web development",
    "Computer science and mathematics",
    "Aeronautical engineering",
  ];

  static const List<String> DATES_CATEGORIES = [
    "2022",
    "2021",
    "2020",
    "2019",
    "2018",
    "2017",
    "2016",
    "2015",
  ];

  static const List<String> FAMILY_CATEGORIES = [
    "Father",
    "Mother",
    "Brother",
    "Sister",
    "Daughter",
    "Son",
  ];

  static const Map<String,String> HOBIE_CATEGORIES = const{
    "Baking" : "assets/images/baking.png",
    "Business Owners" : "assets/images/business_owners.png",
    "Cooking/Food" : "assets/images/cooking_food.png",
    "Crafts" : "assets/images/crafts.png",
    "Creative Writing" : "assets/images/creative_writing.png",
    "Investing": "assets/images/investing.png",
    "Learning Language": "assets/images/learning_languages.png",
    "Video Games" : "assets/images/video_games.png",
    "Music": "assets/images/music.png",
    "Painting": "assets/images/painting.png",
    "Photography/Filmmaking": "assets/images/photography_filmmaking.png",
    "Radio Shows/Podcast": "assets/images/radio_shows_podcasts.png",
    "Reading" : "assets/images/reading.png",
    "Shopping" : "assets/images/online_shopping.png",
  };

  static const Map<String,String> SPORTS_EXERCISE_CATEGORIES = const {
    "Archery" : "assets/images/archery.png",
    "Badminton" :"assets/images/badminton.png",
    "Basketball" :"assets/images/basketball",
    "Boxing" :"assets/images/boxing",
    "Cricket" :"assets/images/cricket.png",
    "Cycling" :"assets/images/cycling.png",
    "Football" :"assets/images/football.png",
    "Hockey" : "assets/images/hockey.png",
    "Horse Riding" :"assets/images/horse_riding.png",
    "Martial Arts/MMA" : "assets/images/martail_arts.png",
    "Pilates/Yoga" : "assets/images/pilates_yoga.png",
    "Running/Athletics" :"assets/images/running_athletics.png",
    "Swimming" :"assets/images/swimming.png",
    "Rugby" : "assets/images/rugby.png",
    "Water Sports" :"assets/images/watersports.png",
    "Tennis" : "assets/images/tennis.png",
  };

  static const Map<String,String> FACILITIES = const {
    "Female Prayer Corner":ImageConstants.IC_FEMALE_PRAYER,
    "Main Prayer Hall":ImageConstants.IC_MAIN_PRAYER_HALL,
    "Funeral Service":ImageConstants.IC_FUNERAL_SERVICE,
    "Nikaah Service":ImageConstants.IC_NIKAH_SERVICE,
    "New Muslim Service":ImageConstants.IC_NEW_MUSLIM,
    "Youth Facilities":ImageConstants.IC_YOUTH,
    "Special Needs Services":ImageConstants.IC_SPECIAL_NEEDS,
    "Madressah":ImageConstants.IC_MADRASSE,
    "Toilet & Ablution Area Male":ImageConstants.IC_TOILET_MALE,
    "Toilet & Ablution Area Female":ImageConstants.IC_TOILET_FEMALE,
    "Library":ImageConstants.IC_LIBRARY,
    "Parking":ImageConstants.IC_PARKING,
    "Information Corner":ImageConstants.IC_INFROMATION_CENTER,
    "Multi-Purpose Area":ImageConstants.IC_MULTIPURPOSE,
    "Kitchen Area":ImageConstants.IC_KITCHEN,
    "Community Services":ImageConstants.IC_COMMUNITY_AREA,
    "Rest & Relax Corner":ImageConstants.IC_REST_ROOM,
    "Imam Guest Room":ImageConstants.IC_IMAM_GUEST_ROOM,
    "Ruqayya Services":ImageConstants.IC_RUQYAYYA,

  };

  static const Map<String,String> FAMILY_OUTDOORS_CATEGORIES = const {
    "Camping" : "assets/images/camping.png",
    "Gardening" : "assets/images/gardening",
    "Horse Riding" : "assets/images/horse_riding.png",
    "Museums" : "assets/images/museums.png",
    "Park/PlayGrounds" : "assets/images/parks_playgrounds.png",
    "Walking" : "assets/images/walking.png",
    "Theme Parks/Zoos" : "assets/images/theme_parks_zoo.png",
    "Travel/Tourism/Backpacking" : "assets/images/travel.png" ,
  };

  static const Map<String,String> VOLUNTEER_CATEGORIES = const {
    "Children And Youth" : "assets/images/children_and_youth.png",
    "Community Centre" : "assets/images/community_center.png",
    "Education" : "assets/images/education.png",
    "Environment" : "assets/images/environment.png ",
    "Mental Health Groups": "assets/images/mental_health_groups.png",
    "Local Library" : "assets/images/local_library.png",
    "Men's Wellbeing" : "assets/images/men_s_wellbeing.png",
    "Health" : "assets/images/health.png",
    "Wildlife Conservation": "assets/images/wildlife_conservation.png",
    "Women's Wellbeing" : "assets/images/women_s_wellbeing.png",
  };

  static const Map<String,String> COMMUNITY_INVOLVEMENT_CATEGORIES = const {
    "Coaching" : "assets/images/coaching.png",
    "Collecting For Donations" : "assets/images/collecting_for_donations_e_g_school_supplies_food_items_hygiene_products.png",
    "Kids & Youth Development" : "assets/images/youth_development",
    "Mentoring" : "assets/images/mentoring.png",
    "Making/Sending Handmade Gifts" : "assets/images/making_or_sending_handmade_gifts_e_g_for_hospitals_care_homes_family_shelters_etc.png",
    "Teaching" : "assets/images/teaching_e_g_it_for_adults_cpr_etc",
    "Participating In Local Park Clean Up" : "assets/images/participating_in_local_park_clean_up",
  };

  static const List<String> RELIGION_CATEGORIES=[
    "Sunni",
    "Shia",
    "other"
  ];

  static const List<String> ISLAM_INTREST_SELECTION=[
    //"Male/Female",
    "True",
    "False",
  ];

  static const List<String> FACILITIES_CATEGORIES=[
    "Female Prayer Corner",
    "Main Prayer Hall",
    "Funeral Service",
    "Nikaah Services",
    "Madressah",
    "New Muslim Services",
    "Special Needs Services",
    "Youth Facilities",
    "Toilet & Ablution Area Male",
    "Toilet & Ablution Female Area",
    "Library",
    "Parking",
    "Information Corner",
    "Kitchen Area",
    "Multi-Purpose Area",
    "Community Services",
    "Rest & Relax Corner",
    "Imam Guest Room",
    "Ruqayya Services",
  ];

  static const Map<String,String> RELIGIONS_INTEREST_CATEGORIES = const{
    "Attending Mosque" : "assets/images/attending_mosque.png",
    "Brothers Meetup" : "assets/images/brothers_meetup.png",
    "Charity Work" : "assets/images/charity_work.png",
    "Community Development" : "assets/images/community_development.png",
    "Developing Arabic" : "assets/images/developing_arabic.png",
    "Embracing Reverts" : "assets/images/embracing_reverts.png",
    "Family Meetup" : "assets/images/family_meetup.png",
    "Giving Dawah" : "assets/images/giving_dawah.png",
    "Sisters Meetup" : "assets/images/sisters_meetup.png",
    "Prayer Motivation" : "assets/images/prayer_motivation.png",
    //"Mosque Classes" : "assets/images/mosque_lectures.png",
    "Mosque Lectures" : "assets/images/mosque_lectures.png",
    "Quran Motivation" : "assets/images/quran_motivation.png",
    "Talks In The Community" : "assets/images/talks_in_the_community.png",
    "Tajweed Developmeny" : "assets/images/tajweed_development.png",
  };

  static const List<String> LANGUAGES_CATEGORIES = [
    "Arabic",
    "Bengali",
    "Bulgarian",
    "Catalan",
    "Chinese",
    "Croatian",
    "Czech",
    "Danish",
    "Dutch",
    "English",
    "Estonian",
    "French",
    "Hindi",
    "Gujarati",
    "German",
    "Italian",
    "Japanese",
    "Korean",
    "Marathi",
    "Polish",
    "Portuguese",
    "Punjabi",
    "Russian",
    "Sinhalese",
    "Spanish",
    "Tamil",
    "Telugu",
    "Urdu",
    "Welsh",
  ];
  static const List<String> GENDER=[
    //"Male/Female",
    "Male",
    "Female",
  ];

  static const List<String> SELECT_AGE=[
    //"Male/Female",
  ];

  static const List<String> REVERT_STATUS=[
    //"Male/Female",
    "Yes",
    "No",
  ];

  static const List<String> POST_VISIBILITY_CATEGORIES=[
    "Community",
    "Friends",
  ];


  static const List<String> PROFILE_PRIVACY=[
    "Community",
    "Friends",
  ];
}

///Assets Images
class ImageConstants{
  static const String Splash = "assets/images/splash.png.";
  static const String IC_HOME="assets/images/ic_home_black.png";
  static const String IC_CHAT="assets/images/chat.png";
  static const String IC_CREATE="assets/images/create.png";
  static const String IC_MOSQUE="assets/images/mosque.png";
  static const String IC_PROFILE="assets/images/ic_profile.png";
  static const String IC_LOGO_TITLE="assets/images/logo_title.png";
  static const String IC_SEARCH="assets/images/search_icon.png";
  static const String IC_DRAWER="assets/images/hamburger.png";
  static const String IC_HOME_USER1="assets/images/home_user1.png";
  static const String IC_HOME_USER2="assets/images/home_user2.png";
  static const String IMG_POST1="assets/images/post_img.png";
  static const String IC_POST2="assets/images/home_use1.png";
  static const String IC_APPRECIATE="assets/images/appreciate.png";
  static const String IC_COMMENT="assets/images/comment.png";
  static const String IC_SHARE="assets/images/ic_share.png";
  static const String TEMP_IMG_ADD="assets/images/img_add.png";
  static const String IMG_COVER="assets/images/img_cover.png";
  static const String IMG_PROFILE="assets/images/ic_main_profile.png";
  static const String TEMP_LOCATION="assets/images/location.png";
  static const String IC_BACK="assets/images/back_arrow.png";
  static const String IC_SEND="assets/images/ic_send.png";
  static const String IC_CAMERA="assets/images/ic_camera.png";
  static const String IMG_POST_2="assets/images/post_img_2.png";
  static const String BRAND_VALUE_TEXT="assets/images/brand_value_text.png";
  static const String GREEN_ROUNDED_ARROW_UP="assets/images/green_rounded_arrow_up.png";
  static const String AMAZON_ADS ="assets/images/amazon_ads.png";
  static const String
  IC_FATHER = "assets/images/ic_father.png";
  static const String FAMILY_ONE ="assets/images/family_one.png";
  static const String FAMILY_TWO ="assets/images/family_two.png";
  static const String FAMILY_THREE ="assets/images/family_three.png";
  static const String FAMILY_FOUR ="assets/images/family_four.png";
  static const String FAMILY_FIVE ="assets/images/family_five.png";
  static const String FAMILY_SIX="assets/images/family_six.png";
  static const String IC_PERSON_GREEN_CIRCLE="assets/images/ic_green_cricle_tick.png";
  static const String IC_PERSON_CLOSE_CIRCLE="assets/images/ic_close_cirlce.png";
  static const String IC_MAP="assets/images/ic_gmap.png";
  static const String IC_CURRENT_LOCATION="assets/images/ic_current_location.svg";
  static const String IC_SEARCH_SV="assets/images/ic_search.svg";
  static const String IC_ADVANCE_SEARCH="assets/images/ic_advance_search.svg";
  static const String IMG_MOSQUE="assets/images/mosque_image.jpeg";
  static const String IC_ROLEX_LOGO="assets/images/rolex_logo.png";
  static const String IMG_ROLEX="assets/images/rolex_img.png";
  static const String IC_INTEREST_BASED="assets/images/ic_interest_based.png";
  static const String IC_SKILLS_BASED="assets/images/ic_skills_based.png";
  static const String IC_FAITH_BASED="assets/images/ic_faith_based.png";
  static const String IC_EDUCATION_BASED="assets/images/ic_education_based.png";
  static const String IC_LOCAL_MOSQUE_BASED="assets/images/ic_local_based.png";
  static const String IC_BUSINESS_BASED="assets/images/ic_business_based.png";
  static const String IC_FORWARD="assets/images/ic_forward.png";
  static const String IC_NOTIFICATION = "assets/images/ic_notification.png";
  static const String IC_MENU = "assets/images/ic_menu.png";
  static const String IC_DOWN = "assets/images/ic_down.png";
  static const String IC_EDIT = "assets/images/ic_edit.png";
  static const String IC_CAM = "assets/images/ic_cam.png";
  static const String IC_MOSQUE_BIG="assets/images/ic_mosque.png";
  static const String IC_SHARE_FILLED="assets/images/ic_share_filled.png";
  static const String IC_PHONE="assets/images/ic_phone.png";
  static const String IC_MAIL="assets/images/ic_email.png";
  static const String IC_GLOBE="assets/images/ic_globe.png";
  static const String IC_LOCATION_ROUND="assets/images/ic_locatin_round.png";
  static const String IC_DIRECTION_GREEN="assets/images/ic_direction_green.png";
  static const String IC_NOT_VERIFIED = "assets/images/ic_not_verified.png";
  static const String IC_MAHAB = "assets/images/ic_mahab.png";
  static const String IC_COMMUNITY = "assets/images/ic_community.png";

  static const String IC_FEMALE_PRAYER = "assets/images/ic_female_prayer.png";
  static const String IC_MAIN_PRAYER_HALL = "assets/images/ic_main_prayer_hall.png";
  static const String IC_FUNERAL_SERVICE = "assets/images/ic_funeral.png";
  static const String IC_NIKAH_SERVICE = "assets/images/ic_nicak.png";
  static const String IC_NEW_MUSLIM = "assets/images/ic_new_muslim.png";
  static const String IC_YOUTH = "assets/images/ic_youth_facilities.png";
  static const String IC_SPECIAL_NEEDS = "assets/images/ic_special_need_services.png";
  static const String IC_MADRASSE = "assets/images/ic_madrassa.png";
  static const String IC_TOILET_MALE = "assets/images/ic_toilet_male.png";
  static const String IC_TOILET_FEMALE = "assets/images/ic_toilet_female.png";
  static const String IC_LIBRARY = "assets/images/ic_library.png";
  static const String IC_PARKING = "assets/images/ic_parking.png";
  static const String IC_INFROMATION_CENTER = "assets/images/ic_information_center.png";
  static const String IC_MULTIPURPOSE = "assets/images/ic_multipurpose_area.png";
  static const String IC_KITCHEN = "assets/images/ic_kitchen_area.png";
  static const String IC_COMMUNITY_AREA = "assets/images/ic_community_services.png";
  static const String IC_REST_ROOM = "assets/images/ic_rest_and_relax_corner.png";
  static const String IC_IMAM_GUEST_ROOM = "assets/images/ic_imam_guest_room.png";
  static const String IC_RUQYAYYA = "assets/images/ic_roqyay_service.png";
  static const String IC_THREE_DOTS = "assets/images/ic_three_dot.png";
  static const String IC_NON_BULLET = "assets/images/ic_non_bullet.png";
  static const String IC_BG_MOSQUE_SEARCH = "assets/images/ic_bg_mosque_search.png";
  static const String IC_BUSINESS_AND_OFFICE = "assets/images/business_and_office.png";
  static const String IC_CHILDCARE = "assets/images/childcare.png";
  static const String IC_CLOTHING = "assets/images/clothing.png";
  static const String IC_COMPUTER_AND_MARKETING = "assets/images/computers_and_marketing.png";
  static const String IC_ENTERTAINMENT = "assets/images/entertainment.png";
  static const String IC_FINANCE_AND_LEGAL = "assets/images/finance_and_legal.png";
  static const String IC_GOODS_SUPPLIERS = "assets/images/goods_suppliers_and_retailers.png";
  static const String IC_HEALTH_AND_BEAUTY = "assets/images/health_beauty_fitness.png";
  static const String IC_MOTORING = "assets/images/motoring.png";
  static const String IC_ONLINE_SHOPPING = "assets/images/online_shopping.png";
  static const String IC_PETS = "assets/images/pets.png";
  static const String IC_PROPERTY_AND_MAINTENANCE = "assets/images/property_and_maintenance.png";
  static const String IC_PUBLIC = "assets/images/public.png";
  static const String IC_TRADESMAN_AND_CONSTRUCTION = "assets/images/tradesman_and_construction.png";
  static const String IC_TRANSPORT = "assets/images/transport.png";
  static const String IC_TRAVEL_AND_TOURISM = "assets/images/travel_and_tourism.png";
  static const String IC_TUITION_AND_CLASSES = "assets/images/tuition_and_classes.png";
  static const String IC_WEDDINGS = "assets/images/weddings.png";
  static const String IC_CHECK = "assets/images/ic_check.png";
  static const String IC_INVISIBLE = "assets/images/ic_invisible.png";
  static const String IC_VISIBLE = "assets/images/ic_visible.png";
  static const String IC_LOGIN_LOGO = "assets/images/ic_login_logo.png";
  //static const String IC_LOCK = "assets/images/ic_lock.png";
  static const String IC_LOGIN_EMAIL = "assets/images/ic_login_email.png";
  static const String IC_LOCK="assets/images/IC_LOCK.png";
  static const String IC_VERIFY_EMAIL = "assets/images/ic_verify_email.png";
  static const String IC_FACEBOOK = "assets/images/ic_facebook.png";
  static const String IC_GOOGLE = "assets/images/ic_google.png";
  static const String IC_VERIFIED = "assets/images/ic_verified.png";
  static const String IC_EYE="assets/images/eye.png";

}

class FontConstants {
  static const String FONT = "Avenir";
}
