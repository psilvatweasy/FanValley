//
//  Helpers.m
//  FanValley
//
//  Created by Pedro Silva on 19/09/12.
//  Copyright (c) 2012 _to_be_named_. All rights reserved.
//

#import "Helpers.h"
#include <math.h>


@implementation Helpers

+ (NSData *)sha256:(NSData *)data {
    unsigned char hash[CC_SHA256_DIGEST_LENGTH];
    if ( CC_SHA256([data bytes], [data length], hash) ) {
        NSData *sha256 = [NSData dataWithBytes:hash length:CC_SHA256_DIGEST_LENGTH];
        return sha256;
    }
    return nil;
}

+ (NSString *) hmac256WithKey:(NSString *) key AndData:(NSString *)data{
    
//    const char *cKey  = [key cStringUsingEncoding:NSASCIIStringEncoding];
//    const char *cData = [data cStringUsingEncoding:NSASCIIStringEncoding];
    const char *cKey  = [key cStringUsingEncoding:NSUTF8StringEncoding];
    const char *cData = [data cStringUsingEncoding:NSUTF8StringEncoding];

    unsigned char cHMAC[CC_SHA256_DIGEST_LENGTH];
    CCHmac(kCCHmacAlgSHA256, cKey, strlen(cKey), cData, strlen(cData), cHMAC);
    
    NSData *hashedData;
    hashedData = [[NSData alloc] initWithBytes:cHMAC length:sizeof(cHMAC)];

    NSString *someString = [NSString stringWithFormat:@"%@", hashedData];
    [LogManager Log_General_Level_4_Messages:@"%@", someString];
    someString = [someString stringByReplacingOccurrencesOfString:@" " withString:@""];
    someString = [someString stringByReplacingOccurrencesOfString:@">" withString:@""];
    someString = [someString stringByReplacingOccurrencesOfString:@"<" withString:@""];
    return someString;
}

+ (NSString *) hmac256WithData:(NSString *)data{
    
    NSData *dataIn = [data dataUsingEncoding:NSUTF8StringEncoding];
    NSMutableData *macOut = [NSMutableData dataWithLength:CC_SHA256_DIGEST_LENGTH];
    
    CC_SHA256(dataIn.bytes, dataIn.length,  macOut.mutableBytes);
    

    NSString *someString = [NSString stringWithFormat:@"%@", macOut];

    someString = [someString stringByReplacingOccurrencesOfString:@" " withString:@""];
    someString = [someString stringByReplacingOccurrencesOfString:@">" withString:@""];
    someString = [someString stringByReplacingOccurrencesOfString:@"<" withString:@""];
    return someString;
}

+ (NSString *)localUuid {
    NSString *ident = [[NSUserDefaults standardUserDefaults] objectForKey:@"unique identifier stored for app"];
    if (!ident) {
        CFUUIDRef uuidRef = CFUUIDCreate(NULL);
        CFStringRef uuidStringRef = CFUUIDCreateString(NULL, uuidRef);
        CFRelease(uuidRef);
        ident = [NSString stringWithString:(__bridge NSString *)uuidStringRef];
        ident = [ident stringByReplacingOccurrencesOfString:@"-" withString:@""];
        ident = [NSString stringWithFormat:@"SER_%@",ident];
        CFRelease(uuidStringRef);
        [[NSUserDefaults standardUserDefaults] setObject:ident forKey:@"unique identifier stored for app"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    return ident;
}

+ (NSString *) getUUID {
    NSString *ident;
    CFUUIDRef uuidRef = CFUUIDCreate(NULL);
    CFStringRef uuidStringRef = CFUUIDCreateString(NULL, uuidRef);
    CFRelease(uuidRef);
    ident = [NSString stringWithString:(__bridge NSString *)uuidStringRef];
    ident = [ident stringByReplacingOccurrencesOfString:@"-" withString:@""];
    CFRelease(uuidStringRef);
    return ident;
}


/* SORT */

+ (NSString *) getOrderListPost:(int) n{
    switch (n) {
        case 0:
            return @"";
            break;
        default:
            return @"";
            break;
    }
    
}

+ (NSMutableArray *) orderArrayofCampaignsByPriority:(NSMutableArray *) array ascendingOrder:(BOOL) asc{
    

    NSSortDescriptor *sortDescriptor;
    sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"priority_favorite" ascending:asc];
    
    NSArray *sortDescriptors = @[sortDescriptor];
    
    
    return [NSMutableArray arrayWithArray:[array sortedArrayUsingDescriptors:sortDescriptors]];
    
}

+ (NSMutableArray *) orderArrayofCompaniesByName:(NSMutableArray *) array ascendingOrder:(BOOL) asc{
    
    
    NSSortDescriptor *sortDescriptor;
    sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:asc];
    
    NSArray *sortDescriptors = @[sortDescriptor];
    
    
    return [NSMutableArray arrayWithArray:[array sortedArrayUsingDescriptors:sortDescriptors]];
    
}

+ (NSMutableArray *) orderArrayOfFacebookByInstalledAPP:(NSMutableArray *) array ascendingOrder:(BOOL) asc{
    
    
    NSSortDescriptor *sortDescriptor;
    sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"installed" ascending:asc];
    
    NSArray *sortDescriptors = @[sortDescriptor];
    
    
    return [NSMutableArray arrayWithArray:[array sortedArrayUsingDescriptors:sortDescriptors]];

}



/* DISTANCE */

+ (NSNumber*) computeDistanceTo:(CLLocation *)point WithMyLocation:(CLLocation *) myLoc {
    if (!myLoc) {
        return [NSNumber numberWithInt:-1];
    }
	
    return [NSNumber numberWithFloat:[myLoc distanceFromLocation: point] / 1000];
}

+ (NSString*) convertDistanceToString:(float) distance {
    //distance = 0.008;
    //return [NSString stringWithFormat:@"%f km", roundf(distance)];
    if (distance < 1 && distance > 0)
        return [NSString stringWithFormat:@"%g m", roundf(distance*1000)];
    else if (distance > 1)
        return [NSString stringWithFormat:@"%g km", roundf(distance)];
    else
        return @"";
}

/* DATE */

+ (NSString *)dateAgo:(NSDate *)date {
    if (!date) {
        return @"";
    }
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"dd.MM.yyyy_HH:mm:ss"];
    
    NSString *origDate = [dateFormatter stringFromDate:date];
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setFormatterBehavior:NSDateFormatterBehavior10_4];
    [df setDateFormat:@"dd.MM.yyyy_HH:mm:ss"];
    NSDate *convertedDate = [df dateFromString:origDate];
    NSDate *todayDate = [NSDate date];
    double ti = [convertedDate timeIntervalSinceDate:todayDate];
    ti = ti * -1;
    float val;
    if(ti < 1) {
        return [NSString stringWithFormat:@""];
    } else if (ti < 60) {
        //        [LogManager Log_General_Level_4_Messages:@"seconds"];
        val = ti;
        if (ti < 2) {
            
            return [NSString stringWithFormat:@"%@",[NSString stringWithFormat:NSLocalizedString(@"ago", @"ago"),(int)val,NSLocalizedString(@"second", @"second")]];
        }
        return [NSString stringWithFormat:@"%@",[NSString stringWithFormat:NSLocalizedString(@"ago", @"ago"),(int)val,NSLocalizedString(@"seconds", @"seconds")]];
    } else if (ti < 3600) {
        //        [LogManager Log_General_Level_4_Messages:@"minutes"];
        val = ti / 60;
        
        if (val < 2) {
            return [NSString stringWithFormat:@"%@",[NSString stringWithFormat:NSLocalizedString(@"ago", @"ago"),(int)val,NSLocalizedString(@"minute", @"minute")]];
        }
        return [NSString stringWithFormat:@"%@",[NSString stringWithFormat:NSLocalizedString(@"ago", @"ago"),(int)val,NSLocalizedString(@"minutes", @"minutes")]];
    } else if (ti < 86400) {
        //        [LogManager Log_General_Level_4_Messages:@"horas"];
        val= ti / (60 * 60);
        
        if (val < 2) {
            return [NSString stringWithFormat:@"%@",[NSString stringWithFormat:NSLocalizedString(@"ago", @"ago"),(int)val,NSLocalizedString(@"hour", @"hour")]];
        }
        
        return [NSString stringWithFormat:@"%@",[NSString stringWithFormat:NSLocalizedString(@"ago", @"ago"),(int)val,NSLocalizedString(@"hours", @"hours")]];
    } else if (ti < 2629743) {
        //        [LogManager Log_General_Level_4_Messages:@"dias"];
        val= ti / (60 * 60 * 24);
        if (val < 2) {
            return [NSString stringWithFormat:@"%@",[NSString stringWithFormat:NSLocalizedString(@"ago", @"ago"),(int)val,NSLocalizedString(@"day", @"day")]];
        }
        
        return [NSString stringWithFormat:@"%@",[NSString stringWithFormat:NSLocalizedString(@"ago", @"ago"),(int)val,NSLocalizedString(@"days", @"days")]];
    } else {
        val= ti / (60 * 60 * 24 * 30);
        
        if (val < 2) {
            return [NSString stringWithFormat:@"%@",[NSString stringWithFormat:NSLocalizedString(@"ago", @"ago"),(int)val,NSLocalizedString(@"month", @"month")]];
        }
        return [NSString stringWithFormat:@"%@",[NSString stringWithFormat:NSLocalizedString(@"ago", @"ago"),(int)val,NSLocalizedString(@"months", @"months")]];
        ;
    }
}

+ (NSString *) getWeekDay:(NSDate*) _date{
    
    int yourDOW = [[[NSCalendar currentCalendar] components:NSWeekdayCalendarUnit fromDate:_date] weekday];
    switch (yourDOW) {
        case 1:
            return NSLocalizedString(@"Sunday", @"sunday");
            break;
        case 2:
            return NSLocalizedString(@"Monday", @"monday");
            break;
        case 3:
            return NSLocalizedString(@"Tuesday", @"tuesday");
            break;
        case 4:
            return NSLocalizedString(@"Wednesday", @"wednesday");
            break;
        case 5:
            return NSLocalizedString(@"Thursday", @"thursday");
            break;
        case 6:
            return NSLocalizedString(@"Friday", @"friday");
            break;
        case 7:
            return NSLocalizedString(@"Saturday", @"saturday");
            break;
        default:
            return @"";
            break;
    }
    
    return @"";
}

+ (BOOL)dateMoreThanOneDay:(NSString *)origDate {
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setFormatterBehavior:NSDateFormatterBehavior10_4];
    [df setDateFormat:@"dd.MM.yyyy_HH:mm:ss"];
    NSDate *convertedDate = [df dateFromString:origDate];
    NSDate *todayDate = [NSDate date];
    double ti = [convertedDate timeIntervalSinceDate:todayDate];
    ti = ti * -1;
    if(ti < 1) {
        return NO;
    } else if (ti < 60) {
//        [LogManager Log_General_Level_4_Messages:@"seconds"];
        return NO;
    } else if (ti < 3600) {
//        [LogManager Log_General_Level_4_Messages:@"minutes"];
        return NO;
    } else if (ti < 86400) {
//        [LogManager Log_General_Level_4_Messages:@"horas"];
        return NO;
    } else if (ti < 2629743) {
//        [LogManager Log_General_Level_4_Messages:@"dias"];
        return YES;
    } else {
        return NO;
    }
}

+ (BOOL)dateMoreThan15Minutes:(NSString *)origDate {
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setFormatterBehavior:NSDateFormatterBehavior10_4];
    [df setDateFormat:@"dd.MM.yyyy_HH:mm:ss"];
    NSDate *convertedDate = [df dateFromString:origDate];
    NSDate *todayDate = [NSDate date];
    double ti = [convertedDate timeIntervalSinceDate:todayDate];
    ti = ti * -1;
    if(ti < 1) {
        return YES;
    }
    
    if (ti > 900) {
        return YES;
    } else{
        return NO;
    }
}

+ (BOOL)dateMoreThan30Seconds:(NSString *)origDate{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setFormatterBehavior:NSDateFormatterBehavior10_4];
    [df setDateFormat:@"dd.MM.yyyy_HH:mm:ss"];
    NSDate *convertedDate = [df dateFromString:origDate];
    NSDate *todayDate = [NSDate date];
    double ti = [convertedDate timeIntervalSinceDate:todayDate];
    ti = ti * -1;
    if(ti < 1) {
        return YES;
    }

    if (ti > 30) {
        return YES;
    } else{
        return NO;
    }

}

+ (BOOL)date:(NSDate*)date isBetweenDate:(NSDate*)beginDate andDate:(NSDate*)endDate{
    if ([date compare:beginDate] == NSOrderedAscending)
    	return NO;
    
    if ([date compare:endDate] == NSOrderedDescending)
    	return NO;
    
    return YES;
}

+ (NSString *) convertMilisecondsToDatetimeFormattedToString:(NSTimeInterval) interval{
    NSTimeInterval time = interval;
    
    NSDate *epochNSDate = [[NSDate alloc] initWithTimeIntervalSince1970:time];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    return [dateFormatter stringFromDate:epochNSDate];
}

+ (NSDate *) convertMilisecondsToDatetime:(NSTimeInterval) interval{
    NSTimeInterval time = interval;
    
    NSDate *epochNSDate = [[NSDate alloc] initWithTimeIntervalSince1970:time];
    return epochNSDate;
}

+ (NSDate *) convertDayeStringToDatetime:(NSString *) interval{
    if (!interval) {
        return nil;
    }
    
    NSString *dateStr = interval;
    
    // Convert string to date object
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSDate *date = [dateFormat dateFromString:dateStr];
    
    return date;
}

+ (NSDate *) convertDateStringToDatetime:(NSString *) interval{
    if (!interval) {
        return nil;
    }
    
    NSString *dateStr = interval;
    
    // Convert string to date object
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [dateFormat dateFromString:dateStr];
    
    return date;
}

+ (NSString *) convertTimeStampToStringDateToSee:(NSString*) interval{
    @try {
        NSTimeInterval time = [interval doubleValue];
        if (time) {
            NSDate *epochNSDate = [NSDate dateWithTimeIntervalSince1970:time];
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            
            [dateFormatter setDateFormat:@"dd.MM.yyyy"];
            return [dateFormatter stringFromDate:epochNSDate];
        }else{
            [[NSUserDefaults standardUserDefaults] setValue:@"" forKey:@""];
            [[NSUserDefaults standardUserDefaults] synchronize];
            return @"";
        }
        
    }
    @catch (NSException *exception) {
        [[NSUserDefaults standardUserDefaults] setValue:@"" forKey:@""];
        [[NSUserDefaults standardUserDefaults] synchronize];
        return @"";
    }
    @finally {
        
    }
    
}

+ (NSString *) convertTimeStampToStringDateToServerFormat:(NSString*) interval{
    @try {
        NSTimeInterval time = [interval doubleValue];
        
        NSDate *epochNSDate = [NSDate dateWithTimeIntervalSince1970:time];
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        
        return [dateFormatter stringFromDate:epochNSDate];
    }
    @catch (NSException *exception) {
        
        [[NSUserDefaults standardUserDefaults] setValue:@"" forKey:@""];
        [[NSUserDefaults standardUserDefaults] synchronize];
        return @"";
    }
    @finally {
        
    }
    
}

+ (NSString *) convertStringDateToTimeStamp:(NSString*) interval{
    
    NSString *dateStr = interval;
    
    // Convert string to date object
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"dd.MM.yyyy"];
    NSDate *date = [dateFormat dateFromString:dateStr];
    
    return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    
}

+ (NSString *) getDateFormattedHasStringOnlyDate:(NSDate *) date{
    if (!date) {
        return @"";
    }
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"dd.MM.yyyy"];
    
    if ([[dateFormatter stringFromDate:date] isEqualToString:@"01.01.1970"]) {
        return @"";
    }
    
    return [dateFormatter stringFromDate:date];
    
    
}

+ (NSString *) convertDateToServerFormat:(NSString *) _date{
    if (!_date) {
        return @"";
    }
    
    NSString *dateStr = _date;
    
    // Convert string to date object
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"dd.mm.yyyy"];
    NSDate *date = [dateFormat dateFromString:dateStr];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"yyyy-mm-dd"];
    
    if ([[dateFormatter stringFromDate:date] isEqualToString:@"01.01.1970"]) {
        return @"";
    }
    
    return [dateFormatter stringFromDate:date];
    
}

/* EMAIL */

+ (BOOL)validateEmail:(NSString *)emailStr {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:emailStr];
}

/* URL & JSON */

+ (NSString *)urlencode:(NSString *) val {
    NSMutableString *output = [NSMutableString string];
    const unsigned char *source = (const unsigned char *)[val UTF8String];
    int sourceLen = strlen((const char *)source);
    for (int i = 0; i < sourceLen; ++i) {
        const unsigned char thisChar = source[i];
        if (thisChar == ' '){
            [output appendString:@"+"];
        } else if (thisChar == '.' || thisChar == '-' || thisChar == '_' || thisChar == '~' ||
                   (thisChar >= 'a' && thisChar <= 'z') ||
                   (thisChar >= 'A' && thisChar <= 'Z') ||
                   (thisChar >= '0' && thisChar <= '9')) {
            [output appendFormat:@"%c", thisChar];
        } else {
            [output appendFormat:@"%%%02X", thisChar];
        }
    }
    return output;
}

+ (NSString *)JSONString:(NSString *)aString {
	NSMutableString *s = [NSMutableString stringWithString:aString];
    [s replaceOccurrencesOfString:@"\\" withString:@"\\\\" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
	[s replaceOccurrencesOfString:@"\"" withString:@"\\\"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
	[s replaceOccurrencesOfString:@"/" withString:@"\\/" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
	[s replaceOccurrencesOfString:@"\n" withString:@"\\n" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
	[s replaceOccurrencesOfString:@"\b" withString:@"\\b" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
	[s replaceOccurrencesOfString:@"\f" withString:@"\\f" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
	[s replaceOccurrencesOfString:@"\r" withString:@"\\r" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
	[s replaceOccurrencesOfString:@"\t" withString:@"\\t" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];

	return [NSString stringWithString:s];
}

+ (BOOL) validateUrl: (NSString *) candidate {
    NSString *urlRegEx = @"(http|https)://((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+";
    NSPredicate *urlTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", urlRegEx];
    return [urlTest evaluateWithObject:candidate];
}

/* IMAGE */
+ (UIImage *) normalize:(UIImage *)image {
    
    CGColorSpaceRef genericColorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef thumbBitmapCtxt = CGBitmapContextCreate(NULL,
                                                         image.size.width,
                                                         image.size.height,
                                                         8, (4 * image.size.width),
                                                         genericColorSpace,
                                                         kCGImageAlphaPremultipliedFirst);
    CGColorSpaceRelease(genericColorSpace);
    CGContextSetInterpolationQuality(thumbBitmapCtxt, kCGInterpolationDefault);
    CGRect destRect = CGRectMake(0, 0, image.size.width, image.size.height);
    CGContextDrawImage(thumbBitmapCtxt, destRect, image.CGImage);
    CGImageRef tmpThumbImage = CGBitmapContextCreateImage(thumbBitmapCtxt);
    CGContextRelease(thumbBitmapCtxt);
    UIImage *result = [UIImage imageWithCGImage:tmpThumbImage];
    CGImageRelease(tmpThumbImage);
    
    return result;
}

+ (UIImage *)decodedImageWithImage:(UIImage *)image{
    CGImageRef imageRef = image.CGImage;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGImageAlphaInfo alphaInfo = CGImageGetAlphaInfo(imageRef);
    
    BOOL imageHasAlphaInfo = (alphaInfo != kCGImageAlphaNone);
    
    CGBitmapInfo bitmapInfo = imageHasAlphaInfo ? kCGImageAlphaPremultipliedLast : kCGImageAlphaNoneSkipLast;
    
    CGContextRef context = CGBitmapContextCreate(NULL,
                                                 CGImageGetWidth(imageRef),
                                                 CGImageGetHeight(imageRef),
                                                 8,
                                                 // Just always return width * bytesPerPixel will be enough
                                                 CGImageGetWidth(imageRef) * 4,
                                                 // System only supports RGB, set explicitly
                                                 colorSpace,
                                                 bitmapInfo);
    CGColorSpaceRelease(colorSpace);
    if (!context) return nil;
    
    CGRect rect = (CGRect){CGPointZero,{CGImageGetWidth(imageRef), CGImageGetHeight(imageRef)}};
    CGContextDrawImage(context, rect, imageRef);
    CGImageRef decompressedImageRef = CGBitmapContextCreateImage(context);
    CGContextRelease(context);
    
    UIImage *decompressedImage = [[UIImage alloc] initWithCGImage:decompressedImageRef scale:image.scale orientation:image.imageOrientation];
    CGImageRelease(decompressedImageRef);
    return decompressedImage;
}

+ (UIImage*) MTDContextCreateRoundedMask:(CGRect) rect :(CGFloat) radius_tl :(CGFloat) radius_tr :(CGFloat) radius_bl :(CGFloat) radius_br{
    
    CGContextRef context;
    CGColorSpaceRef colorSpace;
    
    colorSpace = CGColorSpaceCreateDeviceRGB();
    
    // create a bitmap graphics context the size of the image
    context = CGBitmapContextCreate( NULL, rect.size.width, rect.size.height, 8, 0, colorSpace, kCGImageAlphaPremultipliedLast );
    
    // free the rgb colorspace
    CGColorSpaceRelease(colorSpace);
    
    if ( context == NULL ) {
        return NULL;
    }
    
    // cerate mask
    
    CGFloat minx = CGRectGetMinX( rect ), midx = CGRectGetMidX( rect ), maxx = CGRectGetMaxX( rect );
    CGFloat miny = CGRectGetMinY( rect ), midy = CGRectGetMidY( rect ), maxy = CGRectGetMaxY( rect );
    
    CGContextBeginPath( context );
    CGContextSetGrayFillColor( context, 1.0, 0.0 );
    CGContextAddRect( context, rect );
    CGContextClosePath( context );
    CGContextDrawPath( context, kCGPathFill );
    
    CGContextSetGrayFillColor( context, 1.0, 1.0 );
    CGContextBeginPath( context );
    CGContextMoveToPoint( context, minx, midy );
    CGContextAddArcToPoint( context, minx, miny, midx, miny, radius_bl );
    CGContextAddArcToPoint( context, maxx, miny, maxx, midy, radius_br );
    CGContextAddArcToPoint( context, maxx, maxy, midx, maxy, radius_tr );
    CGContextAddArcToPoint( context, minx, maxy, minx, midy, radius_tl );
    CGContextClosePath( context );
    CGContextDrawPath( context, kCGPathFill );
    
    // Create CGImageRef of the main view bitmap content, and then
    // release that bitmap context
    CGImageRef bitmapContext = CGBitmapContextCreateImage( context );
    CGContextRelease( context );
    
    // convert the finished resized image to a UIImage
    UIImage *theImage = [UIImage imageWithCGImage:bitmapContext];
    // image is retained by the property setting above, so we can
    // release the original
    CGImageRelease(bitmapContext);
    
    // return the image
    return theImage;
}

/*
 
 + (int) getCampaignTypeFromJson:(NSString *) type_class{
 if ([type_class isEqualToString:TWEASY_JSON_COUPON]) {
 return TWEASY_COUPON;
 } else if ([type_class isEqualToString:TWEASY_JSON_CONTEST]) {
 return TWEASY_CONTEST;
 } else if ([type_class isEqualToString:TWEASY_JSON_FEEDBACK]) {
 return TWEASY_FEEDBACK;
 } else if ([type_class isEqualToString:TWEASY_JSON_NEWS]) {
 return TWEASY_NEWS;
 }else if ([type_class isEqualToString:TWEASY_JSON_DAY_MENU]) {
 return TWEASY_DAY_MENU;
 }
 return 0;
 }
 
 + (int) getCampaignType:(id) type_class{
 
 if ([type_class isKindOfClass:[Coupon class]]) {
 return TWEASY_COUPON;
 } else if ([type_class isKindOfClass:[Contest class]]) {
 return TWEASY_CONTEST;
 } else if ([type_class isKindOfClass:[Feedback class]]) {
 return TWEASY_FEEDBACK;
 } else if ([type_class isKindOfClass:[News class]]) {
 return TWEASY_NEWS;
 }else if ([type_class isKindOfClass:[DayMenu class]]) {
 return TWEASY_DAY_MENU;
 }
 return 0;
 }
 
 + (NSMutableArray *) orderArrayofCampaignsByDatePosted:(NSMutableArray *) array ascendingOrder:(BOOL) asc classType:(Class) cl{
 
 NSSortDescriptor *sortDescriptor;
 NSSortDescriptor *sortDescriptor2;
 NSArray *sortDescriptors;
 
 if (cl == [Company class]) {
 sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"distance" ascending:asc];
 sortDescriptors = @[sortDescriptor];
 }else if(cl == [Campaign class]){
 sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"company.distance" ascending:asc];
 sortDescriptor2 = [[NSSortDescriptor alloc] initWithKey:@"activated_at" ascending:NO];
 sortDescriptors = @[sortDescriptor2, sortDescriptor];
 }
 
 return [NSMutableArray arrayWithArray:[array sortedArrayUsingDescriptors:sortDescriptors]];
 
 }
 
 + (NSMutableArray *) orderArrayofCampaignsByDistance:(NSMutableArray *) array ascendingOrder:(BOOL) asc classType:(Class) cl{
 
 
 NSSortDescriptor *sortDescriptor;
 NSSortDescriptor *sortDescriptor2;
 NSArray *sortDescriptors;
 
 if (cl == [Company class]) {
 sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"distance" ascending:asc];
 sortDescriptors = @[sortDescriptor];
 }else if(cl == [Campaign class]){
 sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"company.distance" ascending:asc];
 sortDescriptor2 = [[NSSortDescriptor alloc] initWithKey:@"activated_at" ascending:NO];
 sortDescriptors = @[sortDescriptor, sortDescriptor2];
 }
 
 //[NSArray arrayWithObjects:sortDescriptor,sortDescriptor2,nil];
 
 return [NSMutableArray arrayWithArray:[array sortedArrayUsingDescriptors:sortDescriptors]];
 
 }
 
 + (NSMutableArray *) reOrderArrayofCampaignsByPriority:(NSMutableArray *) array ascendingOrder:(BOOL) asc{
 
 int i=1;
 for (Company *obj in array) {
 obj.priority_favorite = [NSNumber numberWithInteger:i];
 
 i++;
 }
 
 return [NSMutableArray arrayWithArray:array];
 
 }
 
 */

@end
