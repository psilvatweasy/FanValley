//
//  LogManager.h
//  FanValley
//
//  Created by Pedro Silva on 28/01/13.
//  Copyright (c) 2013 _to_be_named_. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LogManager : NSObject

+ (void) Log_Warning_Level_1_Messages:(NSString*) message,...;
+ (void) Log_Warning_Level_2_Messages:(NSString*) message,...;
+ (void) Log_Warning_Level_3_Messages:(NSString*) message,...;

+ (void) Log_Error_Level_1_Messages:(NSString*) message,...;
+ (void) Log_Error_Level_2_Messages:(NSString*) message,...;
+ (void) Log_Error_Level_3_Messages:(NSString*) message,...;

+ (void) Log_General_Level_1_Messages:(NSString*) message,...;
+ (void) Log_General_Level_2_Messages:(NSString*) message,...;
+ (void) Log_General_Level_3_Messages:(NSString*) message,...;
+ (void) Log_General_Level_4_Messages:(NSString*) message,...;

+ (void) Log_Request_Messages:(NSString*) message,...;
+ (void) Log_Request_Raw_Messages:(NSString*) message,...;

+ (void) Log_Info_Messages:(NSString*) message,...;

+ (void) Log_GPS_Location_Messages:(NSString*) message,...;

+ (void) Log_Libs_Messages:(NSString*) message,...;

+ (void) Log_Quick:(NSString *) message, ...;

+ (void) Log_Facebook_Messages:(NSString*) message,...;
+ (void) Log_Facebook_Warning_Messages:(NSString*) message,...;
+ (void) Log_Facebook_Error_Messages:(NSString*) message,...;

@end
