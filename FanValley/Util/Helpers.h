//
//  Helpers.h
//  TweasyMe
//
//  Created by Pedro Silva on 19/09/12.
//  Copyright (c) 2012 Tweasy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonHMAC.h>
#import <CoreLocation/CoreLocation.h>

#import "Constants.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface Helpers : NSObject

+ (NSData *)sha256:(NSData *)data;
+ (NSString *) hmac256WithKey:(NSString *) key AndData:(NSString *)data;
+ (NSString *) hmac256WithData:(NSString *)data;
+ (NSString *)localUuid;
+ (NSString *) getUUID;


/* SORT */

+ (NSString *) getOrderListPost:(int) n;

+ (NSMutableArray *) orderArrayofCompaniesByName:(NSMutableArray *) array ascendingOrder:(BOOL) asc;
+ (NSMutableArray *) orderArrayOfFacebookByInstalledAPP:(NSMutableArray *) array ascendingOrder:(BOOL) asc;

/* DISTANCE */

+ (NSNumber*) computeDistanceTo:(CLLocation *)point WithMyLocation:(CLLocation *) myLoc;
+ (NSString*) convertDistanceToString:(float)distance;

/* DATE */

+ (BOOL) dateMoreThanOneDay:(NSString *)origDate;
+ (BOOL) dateMoreThan15Minutes:(NSString *)origDate;
+ (BOOL) dateMoreThan30Seconds:(NSString *)origDate;
+ (BOOL) date:(NSDate*)date isBetweenDate:(NSDate*)beginDate andDate:(NSDate*)endDate;

+ (NSString *) convertTimeStampToStringDateToServerFormat:(NSString*) interval;
+ (NSString *) convertTimeStampToStringDateToSee:(NSString*) interval;
+ (NSString *) convertStringDateToTimeStamp:(NSString*) interval;
+ (NSString *) convertMilisecondsToDatetimeFormattedToString:(NSTimeInterval) interval;
+ (NSString *) convertDateToServerFormat:(NSString *) _date;
+ (NSString *) getDateFormattedHasStringOnlyDate:(NSDate *) date;
+ (NSString *) getWeekDay:(NSDate*) _date;
+ (NSString *) dateAgo:(NSDate *)date;

+ (NSDate *) convertMilisecondsToDatetime:(NSTimeInterval) interval;
+ (NSDate *) convertDayeStringToDatetime:(NSString *) interval;
+ (NSDate *) convertDateStringToDatetime:(NSString *) interval;

/* EMAIL */

+ (BOOL)validateEmail:(NSString *)emailStr;

/* URL & JSON */

+ (BOOL) validateUrl: (NSString *) candidate;
+ (NSString *)urlencode:(NSString *) val;
+ (NSString *)JSONString:(NSString *)aString;

/* IMAGE */

+ (UIImage *) normalize:(UIImage *)image;
+ (UIImage *) decodedImageWithImage:(UIImage *)image;
+ (UIImage*) MTDContextCreateRoundedMask:(CGRect) rect :(CGFloat) radius_tl :(CGFloat) radius_tr :(CGFloat) radius_bl :(CGFloat) radius_br;

//+ (NSMutableArray *) orderArrayofCampaignsByDatePosted:(NSMutableArray *) array ascendingOrder:(BOOL) asc classType:(Class) cl;
//+ (NSMutableArray *) orderArrayofCampaignsByDistance:(NSMutableArray *) array ascendingOrder:(BOOL) asc classType:(Class) cl;
//+ (NSMutableArray *) orderArrayofCampaignsByPriority:(NSMutableArray *) array ascendingOrder:(BOOL) asc;

//+ (int) getCampaignType:(id) type_class;

//+ (int) getCampaignTypeFromJson:(NSString *) type_class;

//+ (NSMutableArray *) reOrderArrayofCampaignsByPriority:(NSMutableArray *) array ascendingOrder:(BOOL) asc;

@end
