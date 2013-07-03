//
//  Constants.h
//  FanValley
//
//  Created by Pedro Silva on 17/09/12.
//  Copyright (c) 2012 _to_be_named_. All rights reserved.
//

#define VERSION 2.1.2

//#define DEBUG_FLAG 1
//#define USER @"test"
//#define SECRET_KEY @"secret4service"
//#define TWEASY_URL @"http://tweasy.unipix.ch/"
//#define BASE_URL @"http://tweasy.unipix.ch/sservice.php"
//#define BASE_URL_MEDIA @"http://tweasy.unipix.ch"
//#define TWEASY_COMPANY_ID @"c0117ac3b684acfeeb62d5ce8afa79f7"
//#define TWEASY_COMPANY_NAME @"Tweasy SA"
//#define TWEASY_COMPANY_IMAGE_URL @"/data/user/c0117ac3b684acfeeb62d5ce8afa79f7/enterprise_image/375dead8061f05a38d71e3a0cdb55f20"
//#define TWEASY_ADVERT_KEY @"71b480699845b75a214cacb0fab26967"

#define DEBUG_FLAG 0
#define USER @"tweasy_me"
#define SECRET_KEY @"Fh7Dna3Cu3A8ht"
#define TWEASY_URL @"http://ws.tweasy.com/"
#define BASE_URL @"http://ws.tweasy.com/sservice.php"
#define BASE_URL_MEDIA @"http://tweasy.com"
#define TWEASY_COMPANY_ID @"c97e092b15699497c33f780d60fbfe19"
#define TWEASY_COMPANY_NAME @"Tweasy SA"
#define TWEASY_COMPANY_IMAGE_URL @"/data/user/c0117ac3b684acfeeb62d5ce8afa79f7/enterprise_image/375dead8061f05a38d71e3a0cdb55f20"
#define TWEASY_ADVERT_KEY @"52dcfbdc67cd5a304f9461cafc7c4867"

#define BASE_URL_MEDIA_RESOLUTION @"_width_600_height_300_zoom_0"
#define BASE_URL_MEDIA_RESOLUTION_SHARE @"_width_150_height_150_zoom_0"

#define TWEASY_URL_USER_GUIDE_EN @"http://www.tweasy.ch/guide/en.php"
#define TWEASY_URL_USER_GUIDE_FR @"http://www.tweasy.ch/guide/fr.php"
#define TWEASY_URL_USER_GUIDE_DE @"http://www.tweasy.ch/guide/de.php"

#define TWEASY_FACEBOOK_SHARE_URL @"http://tweasy.ch/fb/"


#define HAS_LAUNCH_ONCE @"HasLaunchedOnce"

/*RESPONSE STATUS CODES*/
#define FV_DATABASE_NAME @"FVDataBase"
#define FV_DATABASE_NAME_SQLITE @"FVDataBase.sqlite"


/*RESPONSE STATUS CODES*/
#define HTTP_SUCCESS_OK 200
#define HTTP_SUCCESS_CREATED 201
#define HTTP_SUCCESS_ACCEPTED 202
#define HTTP_SUCCESS_PARTIAL_INFORMATION 203
#define HTTP_SUCCESS_NO_RESPONSE 204

#define HTTP_ERROR_BAD_REQUEST 400
#define HTTP_ERROR_UNAUTHORIZED 401
#define HTTP_ERROR_PAYMENT_REQUEIRED 402
#define HTTP_ERROR_FORBIDDEN 403
#define HTTP_ERROR_NOT_FOUND 404

#define HTTP_SERVER_ERROR_INTERNAL_ERROR 500
#define HTTP_SERVER_ERROR_NOT_IMPLEMENTED 501


/*RESPONSE MACROS*/
#define HTTP_RESPONSE_OK @"ok"
#define HTTP_RESPONSE_ERROR @"error"

/*LOG MESSAGES*/
#define LOGGING_ALL 1

#define LOGGING_REQUEST 0
#define LOGGING_REQUEST_RAW 0
#define LOGGING_INFO 1
#define LOGGING_LIBS 0
#define LOGGING_QUICK 1
#define LOGGING_GPS_LOCATION 0
#define LOGGING_FACEBOOK 0

#define LOGGING_WARNING_LEVEL_1 0
#define LOGGING_WARNING_LEVEL_2 0
#define LOGGING_WARNING_LEVEL_3 0

#define LOGGING_ERROR_LEVEL_1 1
#define LOGGING_ERROR_LEVEL_2 1
#define LOGGING_ERROR_LEVEL_3 1

#define LOGGING_GENERAL_LEVEL_1 0
#define LOGGING_GENERAL_LEVEL_2 0
#define LOGGING_GENERAL_LEVEL_3 0
#define LOGGING_GENERAL_LEVEL_4 0

#define LOGGING_TESTFLIGHT_CHECKPOINTS 0


/*TWEASY CAMPAIGN TYPES*/
#define TWEASY_CONTEST 1
#define TWEASY_COUPON 2
#define TWEASY_FEEDBACK 3
#define TWEASY_NEWS 4
#define TWEASY_DAY_MENU 5

/*TWEASY DETAIL COMPANY CELL TYPES*/
#define TYPE_ADDRESS 1
#define TYPE_PHONE 2
#define TYPE_EMAIL 3
#define TYPE_SITE 4


/*TWEASY CAMPAIGN TYPES FROM JSON*/
#define TWEASY_JSON_CONTEST @"me_contest"
#define TWEASY_JSON_COUPON @"me_coupon"
#define TWEASY_JSON_FEEDBACK @"me_feedback"
#define TWEASY_JSON_NEWS @"me_news"
#define TWEASY_JSON_DAY_MENU @"me_daily_menu"

#define TWEASY_DISTANCE_RADIUS @"distanceRadius"



/*TWEASY COUPON TYPES*/

#define TWEASY_COUPON_TYPE_PERCENTAGE @"percent"
#define TWEASY_COUPON_TYPE_MONEY @"money"
#define TWEASY_COUPON_TYPE_FREE @"free"
#define TWEASY_COUPON_TYPE_2_FOR_1 @"2_for_1"


/*TWEASY REQUEST TYPES*/

#define TWEASY_REQUEST_ME_REGISTER 0
#define TWEASY_REQUEST_ME_CONTEST 2
#define TWEASY_REQUEST_ME_COUPON 3
#define TWEASY_REQUEST_ME_FEEDBACK 4
#define TWEASY_REQUEST_ME_PASSBOOK 5
#define TWEASY_REQUEST_ME_VIEW 6
#define TWEASY_REQUEST_ME_FAVOUITE 7
#define TWEASY_REQUEST_ME_VIEW_USER 8
#define TWEASY_REQUEST_ERRO_OF_WRONG_TIME 9
#define TWEASY_REQUEST_RSS_FEED 10
#define TWEASY_REQUEST_ME_USER 12
#define TWEASY_REQUEST_ME_CAMPAIGN 13
#define TWEASY_REQUEST_ME_SEARCH_WITH_PARAMETER 14
#define TWEASY_REQUEST_ME_SEARCH_NOT_TO_DB 15
#define TWEASY_REQUEST_ME_SEARCH_NEXT_PAGE 16
#define TWEASY_REQUEST_ME_CATEGORIES 17
#define TWEASY_REQUEST_ME_FAVORITE_CAMPAIGNS 18
#define TWEASY_REQUEST_ME_FACEBOOK 19
#define TWEASY_REQUEST_ME_PROFILE 20
#define TWEASY_REQUEST_ME_SHARE 21
#define TWEASY_REQUEST_ME_SAVE_PROFILE 22

/*TWEASY REQUEST Exceptions */

#define TWEASY_EXCEPTION_USER_DOES_NOT_EXIST @"User does not exists."



/*TWEASY RESPONSE CALLBACKS TYPES*/

#define TWEASY_RESPONSE_CALLBACK_ME_REGISTER 1
#define TWEASY_RESPONSE_CALLBACK_COUPON 2
#define TWEASY_RESPONSE_CALLBACK_CONTEST 3
#define TWEASY_RESPONSE_CALLBACK_FEEDBACK 4
#define TWEASY_RESPONSE_CALLBACK_ME_FETCH 5
#define TWEASY_RESPONSE_CALLBACK_PASSBOOK 6
#define TWEASY_RESPONSE_CALLBACK_VIEW 7
#define TWEASY_RESPONSE_CALLBACK_FAVOURITE 8
#define TWEASY_RESPONSE_CALLBACK_DAY_MENU 9
#define TWEASY_RESPONSE_CALLBACK_VIEW_USER 10
#define TWEASY_RESPONSE_CALLBACK_RSS_FEED 11
#define TWEASY_RESPONSE_CALLBACK_ME_SEARCH 12
#define TWEASY_RESPONSE_CALLBACK_ME_USER 13
#define TWEASY_RESPONSE_CALLBACK_ME_CAMPAIGN 14
#define TWEASY_RESPONSE_CALLBACK_ME_SEARCH_WITH_PARAMETER 15
#define TWEASY_RESPONSE_CALLBACK_ME_SEARCH_NOT_TO_DB 16
#define TWEASY_RESPONSE_CALLBACK_ME_SEARCH_NEXT_PAGE 17
#define TWEASY_RESPONSE_CALLBACK_ME_CATEGORIES 18
#define TWEASY_RESPONSE_CALLBACK_ME_FAVORITE_CAMPAIGNS 19
#define TWEASY_RESPONSE_CALLBACK_ME_FACEBOOK 20
#define TWEASY_RESPONSE_CALLBACK_ME_PROFILE 21
#define TWEASY_RESPONSE_CALLBACK_ME_SHARE 22
#define TWEASY_RESPONSE_CALLBACK_ME_SAVE_PROFILE 23
#define TWEASY_EXCEPTION_USER_DOES_NOT_EXIST_CALLBACK 24

/*TWEASY PREFERENCES TYPES*/

#define ME_FACEBOOK_REQUESTED_ONCE @"me_facebook_requested_once"
#define OPTIONS_USE_LOCATION @"use_location"
#define OPTIONS_USE_PUSH_NOTIFICATIONS @"use_push_notifications"
#define OPTIONS_SHOW_LOGIN_VIEW_AT_FIRST_TIME @"show_login_view"
#define OPTIONS_MAX_VALUE_SLIDER @"max_value_slider"
#define UNIQUE_APP_ID @"unique_app_id"
#define SHORT_ME_ID @"short_me_id"
#define DEVICE_TOKEN @"device_token"
#define TWEASY_LAST_TIME_ME_FETCH_HAS_BEEN_REQUESTED @"last_time_me_fetch_been_requested"
#define TWEASY_LAST_TIME_ME_MANUAL_FETCH_HAS_BEEN_REQUESTED @"last_time_me_manual_fetch_been_requested"

#define TWEASY_REQUEST_CLASS @"me2"
#define TWEASY_REQUEST_METHOD_SEARCH @"search"
#define TWEASY_REQUEST_METHOD_REGISTER @"register"
#define TWEASY_REQUEST_METHOD_CAMPAIGN @"campaign"
#define TWEASY_REQUEST_METHOD_USER @"user"
#define TWEASY_REQUEST_METHOD_PASSBOOK @"passbook"
#define TWEASY_REQUEST_METHOD_CONTEST @"contest"
#define TWEASY_REQUEST_METHOD_FEEDBACK @"feedback"
#define TWEASY_REQUEST_METHOD_COUPON @"coupon"
#define TWEASY_REQUEST_METHOD_FAVORITE @"favorite"
#define TWEASY_REQUEST_METHOD_CATEGORIES @"categories"
#define TWEASY_REQUEST_METHOD_FAVORITE_CAMPAIGNS @"favorites_campaigns"
#define TWEASY_REQUEST_METHOD_FACEBOOK @"facebook"
#define TWEASY_REQUEST_METHOD_PROFILE @"profile"
#define TWEASY_REQUEST_METHOD_SHARE @"interaction"
#define TWEASY_REQUEST_METHOD_SAVE_PROFILE @"save_profile"

/*TWEASY SEARCH TYPE PARAMETERS*/
#define TWEASY_SEARCH_TYPE_ALL @"all"
#define TWEASY_SEARCH_TYPE_COMPANIES @"users"
#define TWEASY_SEARCH_TYPE_CAMPAIGNS @"campaigns"

#define TWEASY_SEARCH_TYPE_COMPANIES_VALUE 0
#define TWEASY_SEARCH_TYPE_CAMPAIGNS_VALUE 1

#define TWEASY_REQUEST_ORDER_CLOSER @"closer"
#define TWEASY_REQUEST_ORDER_RECENT @"recent"

/*TWEASY FORMS TYPES*/
#define TWESY_FORM_FIRST_NAME @"form_first_name"
#define TWESY_FORM_LAST_NAME @"form_last_name"
#define TWESY_FORM_EMAIL @"form_email"
#define TWESY_FORM_BIRTHDAY @"form_birthday"
#define TWESY_FORM_COMMENT @"form_comment"
#define TWESY_FORM_FEEDBACK @"form_feedback"

#define TWEASY_SHARE_BODY_1 NSLocalizedString(@"Hi,\n\nI would like to let you in on a great deal: ", @"share_body_1")
#define TWEASY_SHARE_BODY_2 NSLocalizedString(@" from the company ", @"share_body_2")
#define TWEASY_SHARE_BODY_3 NSLocalizedString(@".\n\nTo find out about it, set up the “Tweasy” application on your smartphone and look up the latest news.\n\nI hope you enjoy reading about it!", @"share_body_3")


#define TWEASY_SHARE_COMPANY_BODY_1 NSLocalizedString(@"Hi,\n\nI would like to inform you about the great offers from ", @"share_company_body_1")
#define TWEASY_SHARE_COMPANY_BODY_2 NSLocalizedString(@" so that you can benefit from them.\n\nTo find out about it, set up the “Tweasy” application on your smartphone and look up the latest news.\n\nI hope you enjoy reading about it!", @"share_company_body_2")


static const CGFloat KEYBOARD_ANIMATION_DURATION = 0.3;
static const CGFloat MINIMUM_SCROLL_FRACTION = 0.2;
static const CGFloat MAXIMUM_SCROLL_FRACTION = 0.8;
static const CGFloat PORTRAIT_KEYBOARD_HEIGHT = 216;
static const CGFloat LANDSCAPE_KEYBOARD_HEIGHT = 140;

#define IS_IPHONE_5 ([UIScreen mainScreen].bounds.size.height == 568.0)

#ifdef IS_IPHONE_5
#define SCREEN_HEIGHT 568
#else
#define SCREEN_HEIGHT 480
#endif

/*FACEBOOK REQUESTS*/

#define FACEBOOK_REQUEST_GET_FRIENDS_LIST 0
#define FACEBOOK_REQUEST_GET_USER_DETAILS 1

/*TABLEVIEW MANAGEMENT*/

#define MARGIN_CELL 5
#define MAX_HEIGHT_MARGIN 8
#define CELL_HEIGHT_WITH_IMAGE 267
#define CELL_HEIGHT_WITHOUT_IMAGE 80
#define CELL_CONTENT_WIDTH 251
#define CELL_CONTENT_MARGIN 10
