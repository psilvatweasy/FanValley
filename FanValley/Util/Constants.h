//
//  Constants.h
//  FanValley
//
//  Created by Pedro Silva on 17/09/12.
//  Copyright (c) 2012 _to_be_named_. All rights reserved.
//

#define VERSION 1.0

//#define DEBUG_FLAG 1
//#define USER @"test"
//#define SECRET_KEY @"secret4service"
#define FANVALLEY_URL @"http://192.168.143.10:9000/"

//#define FANVALLEY_URL @"http://192.168.143.132:9000/"
//#define BASE_URL @"http://tweasy.unipix.ch/sservice.php"
//#define BASE_URL_MEDIA @"http://tweasy.unipix.ch"
//#define TWEASY_COMPANY_ID @"c0117ac3b684acfeeb62d5ce8afa79f7"
//#define TWEASY_COMPANY_NAME @"Tweasy SA"
//#define TWEASY_COMPANY_IMAGE_URL @"/data/user/c0117ac3b684acfeeb62d5ce8afa79f7/enterprise_image/375dead8061f05a38d71e3a0cdb55f20"
//#define TWEASY_ADVERT_KEY @"71b480699845b75a214cacb0fab26967"

//#define DEBUG_FLAG 0
//#define USER @"tweasy_me"
//#define SECRET_KEY @"Fh7Dna3Cu3A8ht"
//#define TWEASY_URL @"http://ws.tweasy.com/"
//#define BASE_URL @"http://ws.tweasy.com/sservice.php"
//#define BASE_URL_MEDIA @"http://tweasy.com"
//#define TWEASY_COMPANY_ID @"c97e092b15699497c33f780d60fbfe19"
//#define TWEASY_COMPANY_NAME @"Tweasy SA"
//#define TWEASY_COMPANY_IMAGE_URL @"/data/user/c0117ac3b684acfeeb62d5ce8afa79f7/enterprise_image/375dead8061f05a38d71e3a0cdb55f20"
//#define TWEASY_ADVERT_KEY @"52dcfbdc67cd5a304f9461cafc7c4867"

#define BASE_URL_MEDIA_RESOLUTION @"_width_600_height_300_zoom_0"
#define BASE_URL_MEDIA_RESOLUTION_SHARE @"_width_150_height_150_zoom_0"

//#define TWEASY_URL_USER_GUIDE_EN @"http://www.tweasy.ch/guide/en.php"
//#define TWEASY_URL_USER_GUIDE_FR @"http://www.tweasy.ch/guide/fr.php"
//#define TWEASY_URL_USER_GUIDE_DE @"http://www.tweasy.ch/guide/de.php"
//
//#define TWEASY_FACEBOOK_SHARE_URL @"http://tweasy.ch/fb/"


#define HAS_LAUNCH_ONCE @"HasLaunchedOnce"

/*RESPONSE STATUS CODES*/
#define FV_DATABASE_NAME @"FVDataBase"
#define FV_DATABASE_NAME_SQLITE @"FVDataBase.sqlite"

/* HTTP METHOD */
#define HTTP_METHOD_POST @"POST"
#define HTTP_METHOD_GET @"GET"
#define HTTP_METHOD_DELETE @"DELETE"
#define HTTP_METHOD_PUT @"PUT"

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

#define LOGGING_REQUEST 1
#define LOGGING_REQUEST_RAW 1
#define LOGGING_INFO 1
#define LOGGING_LIBS 1
#define LOGGING_QUICK 1
#define LOGGING_GPS_LOCATION 0
#define LOGGING_FACEBOOK 0

#define LOGGING_WARNING_LEVEL_1 1
#define LOGGING_WARNING_LEVEL_2 1
#define LOGGING_WARNING_LEVEL_3 1

#define LOGGING_ERROR_LEVEL_1 1
#define LOGGING_ERROR_LEVEL_2 1
#define LOGGING_ERROR_LEVEL_3 1

#define LOGGING_GENERAL_LEVEL_1 1
#define LOGGING_GENERAL_LEVEL_2 1
#define LOGGING_GENERAL_LEVEL_3 1
#define LOGGING_GENERAL_LEVEL_4 1

#define LOGGING_TESTFLIGHT_CHECKPOINTS 0

/*FANVALLEY HTTP SERVICE REQUEST*/

#define FANVALLEY_SERVICE_REGISTER @"register-device"
#define FANVALLEY_SERVICE_REGISTER_PUSH_NOTIFICATION @"register-push"
#define FANVALLEY_SERVICE_SEARCH_CLUBS @"search-clubs/"


/*FANVALLEY REQUEST TYPES*/

#define FANVALLEY_REQUEST_REGISTER 0
#define FANVALLEY_REQUEST_REGISTER_PUSH_NOTIFICATION 1
#define FANVALLEY_REQUEST_SEARCH_CLUBS 2

/*FANVALLEY RESPONSE CALLBACKS TYPES*/

#define FANVALLEY_RESPONSE_CALLBACK_REGISTER 0
#define FANVALLEY_RESPONSE_CALLBACK_REGISTER_PUSH_NOTIFICATION 1
#define FANVALLEY_RESPONSE_CALLBACK_SEARCH_CLUBS 2

/*FANVALLEY REQUEST Exceptions */

#define FANVALLEY_EXCEPTION_USER_DOES_NOT_EXIST @"User does not exists."

/*FANVALLEY PREFERENCES TYPES*/

#define ME_FACEBOOK_REQUESTED_ONCE @"me_facebook_requested_once"
#define OPTIONS_USE_LOCATION @"use_location"
#define OPTIONS_USE_PUSH_NOTIFICATIONS @"use_push_notifications"
#define OPTIONS_SHOW_LOGIN_VIEW_AT_FIRST_TIME @"show_login_view"


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
#define TWEASY_REQUEST_ERRO_OF_WRONG_TIME 9

/*TABLEVIEW MANAGEMENT*/

#define MARGIN_CELL 5
#define MAX_HEIGHT_MARGIN 8
#define CELL_HEIGHT_WITH_IMAGE 267
#define CELL_HEIGHT_WITHOUT_IMAGE 80
#define CELL_CONTENT_WIDTH 251
#define CELL_CONTENT_MARGIN 10
