//
//  LogManager.m
//  FanValley
//
//  Created by Pedro Silva on 28/01/13.
//  Copyright (c) 2013 _to_be_named_. All rights reserved.
//

#import "LogManager.h"
#import "Constants.h"

#import "TestFlight.h"

#define PREFIX @"<LOG_TW -"
#define SUFIX_OF_PREFIX_REQUEST @" Request> "
#define SUFIX_OF_PREFIX_REQUEST_RAW @" Request_Raw> "

#define SUFIX_OF_PREFIX_WARNING_1 @" Warning_1> "
#define SUFIX_OF_PREFIX_WARNING_2 @" Warning_2> "
#define SUFIX_OF_PREFIX_WARNING_3 @" Warning_3> "

#define SUFIX_OF_PREFIX_ERROR_1 @" Error_1> "
#define SUFIX_OF_PREFIX_ERROR_2 @" Error_2> "
#define SUFIX_OF_PREFIX_ERROR_3 @" Error_3> "

#define SUFIX_OF_PREFIX_GENERAL_1 @" General_1> "
#define SUFIX_OF_PREFIX_GENERAL_2 @" General_2> "
#define SUFIX_OF_PREFIX_GENERAL_3 @" General_3> "
#define SUFIX_OF_PREFIX_GENERAL_4 @" General_4> "

#define SUFIX_OF_PREFIX_FACEBOOK @" Facebook> "
#define SUFIX_OF_PREFIX_FACEBOOK_ERROR @" Facebook_Error> "
#define SUFIX_OF_PREFIX_FACEBOOK_WARNING @" Facebook_Warning> "

#define SUFIX_OF_PREFIX_INFO @" Info> "
#define SUFIX_OF_PREFIX_GPS @" GPS> "
#define SUFIX_OF_PREFIX_LIBS @" LIBS> "
#define SUFIX_OF_PREFIX_QUICK @" Quick> "

#define SUFIX @"\n\n"

#define NSLog(__FORMAT__, ...) TFLog((@"%s [Line %d] " __FORMAT__), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)


@implementation LogManager

+ (void) Log_Request_Messages:(NSString*) message,...{
    va_list args = NULL;
    if (LOGGING_ALL) {
        if (LOGGING_REQUEST) {
            message = [PREFIX stringByAppendingString:[SUFIX_OF_PREFIX_REQUEST stringByAppendingString:[message stringByAppendingString:SUFIX]]];
            va_start(args, message);
            NSLogv(message, args);
            
        }
    }
    
    if (LOGGING_TESTFLIGHT_CHECKPOINTS) {
        if (LOGGING_REQUEST) {
            if (!args) {
                message = [PREFIX stringByAppendingString:[SUFIX_OF_PREFIX_REQUEST stringByAppendingString:[message stringByAppendingString:SUFIX]]];
                va_start(args, message);
            }
            TFLogv(message, args);
        }
    }
    
    va_end(args);
    
}
+ (void) Log_Request_Raw_Messages:(NSString*) message,...{
    va_list args = NULL;
    
    if (LOGGING_ALL) {
        if (LOGGING_REQUEST_RAW) {
            message = [PREFIX stringByAppendingString:[SUFIX_OF_PREFIX_REQUEST_RAW stringByAppendingString:[message stringByAppendingString:SUFIX]]];
            va_start(args, message);
            NSLogv(message, args);
        }
    }
    
    if (LOGGING_TESTFLIGHT_CHECKPOINTS) {
        if (LOGGING_REQUEST_RAW) {
            if (!args) {
                message = [PREFIX stringByAppendingString:[SUFIX_OF_PREFIX_REQUEST_RAW stringByAppendingString:[message stringByAppendingString:SUFIX]]];
                va_start(args, message);
            }
            TFLogv(message, args);
        }
    }
    
    
    va_end(args);
}

+ (void) Log_Warning_Level_1_Messages:(NSString*) message,...{
    va_list args = NULL;
    
    if (LOGGING_ALL) {
        if (LOGGING_WARNING_LEVEL_1) {
            message = [PREFIX stringByAppendingString:[SUFIX_OF_PREFIX_WARNING_1 stringByAppendingString:[message stringByAppendingString:SUFIX]]];
            va_start(args, message);
            NSLogv(message, args);
            
        }
    }
    
    if (LOGGING_TESTFLIGHT_CHECKPOINTS) {
        if (LOGGING_WARNING_LEVEL_1) {
            if (!args) {
                message = [PREFIX stringByAppendingString:[SUFIX_OF_PREFIX_WARNING_1 stringByAppendingString:[message stringByAppendingString:SUFIX]]];
                va_start(args, message);
            }
            TFLogv(message, args);
        }
    }
    
    va_end(args);
    
}
+ (void) Log_Warning_Level_2_Messages:(NSString*) message,...{
    va_list args = NULL;
    
    if (LOGGING_ALL) {
        if (LOGGING_WARNING_LEVEL_2) {
            message = [PREFIX stringByAppendingString:[SUFIX_OF_PREFIX_WARNING_2 stringByAppendingString:[message stringByAppendingString:SUFIX]]];
            va_start(args, message);
            NSLogv(message, args);
            
            
        }
    }
    
    if (LOGGING_TESTFLIGHT_CHECKPOINTS) {
        if (LOGGING_WARNING_LEVEL_2) {
            if (!args) {
                message = [PREFIX stringByAppendingString:[SUFIX_OF_PREFIX_WARNING_2 stringByAppendingString:[message stringByAppendingString:SUFIX]]];
                va_start(args, message);
            }
            TFLogv(message, args);
        }
    }
    
    va_end(args);
}
+ (void) Log_Warning_Level_3_Messages:(NSString*) message,...{
    va_list args = NULL;
    
    if (LOGGING_ALL) {
        if (LOGGING_WARNING_LEVEL_3) {
            message = [PREFIX stringByAppendingString:[SUFIX_OF_PREFIX_WARNING_3 stringByAppendingString:[message stringByAppendingString:SUFIX]]];
            va_start(args, message);
            NSLogv(message, args);
            
            
        }
    }
    
    if (LOGGING_TESTFLIGHT_CHECKPOINTS) {
        if (LOGGING_WARNING_LEVEL_3) {
            if (!args) {
                message = [PREFIX stringByAppendingString:[SUFIX_OF_PREFIX_WARNING_3 stringByAppendingString:[message stringByAppendingString:SUFIX]]];
                va_start(args, message);
            }
            TFLogv(message, args);
        }
    }
    
    va_end(args);
    
}

+ (void) Log_Error_Level_1_Messages:(NSString*) message,...{
    
    va_list args = NULL;
    if (LOGGING_ALL) {
        if (LOGGING_ERROR_LEVEL_1) {
            message = [PREFIX stringByAppendingString:[SUFIX_OF_PREFIX_ERROR_1 stringByAppendingString:[message stringByAppendingString:SUFIX]]];
            va_start(args, message);
            NSLogv(message, args);
            
            
        }
    }
    
    if (LOGGING_TESTFLIGHT_CHECKPOINTS) {
        if (LOGGING_ERROR_LEVEL_1) {
            if (!args) {
                message = [PREFIX stringByAppendingString:[SUFIX_OF_PREFIX_ERROR_1 stringByAppendingString:[message stringByAppendingString:SUFIX]]];
                va_start(args, message);
            }
            TFLogv(message, args);
        }
    }
    
    va_end(args);
    
}
+ (void) Log_Error_Level_2_Messages:(NSString*) message,...{
    va_list args = NULL;
    
    if (LOGGING_ALL) {
        if (LOGGING_ERROR_LEVEL_2) {
            message = [PREFIX stringByAppendingString:[SUFIX_OF_PREFIX_ERROR_2 stringByAppendingString:[message stringByAppendingString:SUFIX]]];
            va_start(args, message);
            NSLogv(message, args);
            
            
        }
    }
    
    if (LOGGING_TESTFLIGHT_CHECKPOINTS) {
        if (LOGGING_ERROR_LEVEL_2) {
            if (!args) {
                message = [PREFIX stringByAppendingString:[SUFIX_OF_PREFIX_ERROR_2 stringByAppendingString:[message stringByAppendingString:SUFIX]]];
                va_start(args, message);
            }
            TFLogv(message, args);
        }
    }
    
    va_end(args);
    
}
+ (void) Log_Error_Level_3_Messages:(NSString*) message,...{
    va_list args = NULL;
    
    if (LOGGING_ALL) {
        if (LOGGING_ERROR_LEVEL_3) {
            message = [PREFIX stringByAppendingString:[SUFIX_OF_PREFIX_ERROR_3 stringByAppendingString:[message stringByAppendingString:SUFIX]]];
            va_start(args, message);
            NSLogv(message, args);
            
            
        }
    }
    
    if (LOGGING_TESTFLIGHT_CHECKPOINTS) {
        if (LOGGING_ERROR_LEVEL_3) {
            if (!args) {
                message = [PREFIX stringByAppendingString:[SUFIX_OF_PREFIX_ERROR_3 stringByAppendingString:[message stringByAppendingString:SUFIX]]];
                va_start(args, message);
            }
            TFLogv(message, args);
        }
    }
    
    va_end(args);
    
}

+ (void) Log_General_Level_1_Messages:(NSString*) message,...{
    va_list args = NULL;
    
    if (LOGGING_ALL) {
        if (LOGGING_GENERAL_LEVEL_1) {
            message = [PREFIX stringByAppendingString:[SUFIX_OF_PREFIX_GENERAL_1 stringByAppendingString:[message stringByAppendingString:SUFIX]]];
            va_start(args, message);
            NSLogv(message, args);
            
            
        }
    }
    
    if (LOGGING_TESTFLIGHT_CHECKPOINTS) {
        if (LOGGING_GENERAL_LEVEL_1) {
            if (!args) {
                message = [PREFIX stringByAppendingString:[SUFIX_OF_PREFIX_GENERAL_1 stringByAppendingString:[message stringByAppendingString:SUFIX]]];
                va_start(args, message);
            }
            TFLogv(message, args);
        }
    }
    
    va_end(args);
    
}
+ (void) Log_General_Level_2_Messages:(NSString*) message,...{
    va_list args = NULL;
    
    if (LOGGING_ALL) {
        if (LOGGING_GENERAL_LEVEL_2) {
            message = [PREFIX stringByAppendingString:[SUFIX_OF_PREFIX_GENERAL_2 stringByAppendingString:[message stringByAppendingString:SUFIX]]];
            va_start(args, message);
            NSLogv(message, args);
            
            
        }
    }
    
    if (LOGGING_TESTFLIGHT_CHECKPOINTS) {
        if (LOGGING_GENERAL_LEVEL_2) {
            if (!args) {
                message = [PREFIX stringByAppendingString:[SUFIX_OF_PREFIX_GENERAL_2 stringByAppendingString:[message stringByAppendingString:SUFIX]]];
                va_start(args, message);
            }
            
            TFLogv(message, args);
        }
    }
    
    va_end(args);
    
}
+ (void) Log_General_Level_3_Messages:(NSString*) message,...{
    va_list args = NULL;
    
    if (LOGGING_ALL) {
        if (LOGGING_GENERAL_LEVEL_3) {
            message = [PREFIX stringByAppendingString:[SUFIX_OF_PREFIX_GENERAL_3 stringByAppendingString:[message stringByAppendingString:SUFIX]]];
            va_start(args, message);
            NSLogv(message, args);
            
            
        }
    }
    
    if (LOGGING_TESTFLIGHT_CHECKPOINTS) {
        if (LOGGING_GENERAL_LEVEL_3) {
            if (!args) {
                message = [PREFIX stringByAppendingString:[SUFIX_OF_PREFIX_GENERAL_3 stringByAppendingString:[message stringByAppendingString:SUFIX]]];
                va_start(args, message);
            }
            TFLogv(message, args);
        }
    }
    
    va_end(args);
    
}
+ (void) Log_General_Level_4_Messages:(NSString*) message,...{
    va_list args = NULL;
    
    if (LOGGING_ALL) {
        if (LOGGING_GENERAL_LEVEL_4) {
            message = [PREFIX stringByAppendingString:[SUFIX_OF_PREFIX_GENERAL_4 stringByAppendingString:[message stringByAppendingString:SUFIX]]];
            va_start(args, message);
            NSLogv(message, args);
            
            
        }
    }
    
    if (LOGGING_TESTFLIGHT_CHECKPOINTS) {
        if (LOGGING_GENERAL_LEVEL_4) {
            if (!args) {
                message = [PREFIX stringByAppendingString:[SUFIX_OF_PREFIX_GENERAL_4 stringByAppendingString:[message stringByAppendingString:SUFIX]]];
                va_start(args, message);
            }
            TFLogv(message, args);
        }
    }
    
    va_end(args);
    
}

+ (void) Log_Facebook_Messages:(NSString*) message,...{
    va_list args = NULL;
    
    if (LOGGING_ALL) {
        if (LOGGING_FACEBOOK) {
            message = [PREFIX stringByAppendingString:[SUFIX_OF_PREFIX_FACEBOOK stringByAppendingString:[message stringByAppendingString:SUFIX]]];
            va_start(args, message);
            NSLogv(message, args);
            
            
        }
    }
    
    if (LOGGING_TESTFLIGHT_CHECKPOINTS) {
        if (LOGGING_FACEBOOK) {
            if (!args) {
                message = [PREFIX stringByAppendingString:[SUFIX_OF_PREFIX_FACEBOOK stringByAppendingString:[message stringByAppendingString:SUFIX]]];
                va_start(args, message);
            }
            TFLogv(message, args);
        }
    }
    
    va_end(args);
}
+ (void) Log_Facebook_Warning_Messages:(NSString*) message,...{
    va_list args = NULL;
    
    if (LOGGING_ALL) {
        if (LOGGING_FACEBOOK) {
            message = [PREFIX stringByAppendingString:[SUFIX_OF_PREFIX_FACEBOOK_WARNING stringByAppendingString:[message stringByAppendingString:SUFIX]]];
            va_start(args, message);
            NSLogv(message, args);
            
            
        }
    }
    
    if (LOGGING_TESTFLIGHT_CHECKPOINTS) {
        if (LOGGING_FACEBOOK) {
            if (!args) {
                message = [PREFIX stringByAppendingString:[SUFIX_OF_PREFIX_FACEBOOK_WARNING stringByAppendingString:[message stringByAppendingString:SUFIX]]];
                va_start(args, message);
            }
            TFLogv(message, args);
        }
    }
    
    va_end(args);
    
}
+ (void) Log_Facebook_Error_Messages:(NSString*) message,...{
    va_list args = NULL;
    
    if (LOGGING_ALL) {
        if (LOGGING_FACEBOOK) {
            message = [PREFIX stringByAppendingString:[SUFIX_OF_PREFIX_FACEBOOK_ERROR stringByAppendingString:[message stringByAppendingString:SUFIX]]];
            va_start(args, message);
            NSLogv(message, args);
            
            
        }
    }
    
    if (LOGGING_TESTFLIGHT_CHECKPOINTS) {
        if (LOGGING_FACEBOOK) {
            if (!args) {
                message = [PREFIX stringByAppendingString:[SUFIX_OF_PREFIX_FACEBOOK_ERROR stringByAppendingString:[message stringByAppendingString:SUFIX]]];
                va_start(args, message);
            }
            TFLogv(message, args);
        }
    }
    
    va_end(args);
    
}

+ (void) Log_Info_Messages:(NSString*) message,...{
    va_list args = NULL;
    
    if (LOGGING_ALL) {
        if (LOGGING_INFO) {
            message = [PREFIX stringByAppendingString:[SUFIX_OF_PREFIX_INFO stringByAppendingString:[message stringByAppendingString:SUFIX]]];
            va_start(args, message);
            NSLogv(message, args);
            
            
        }
    }
    
    if (LOGGING_TESTFLIGHT_CHECKPOINTS) {
        if (LOGGING_INFO) {
            if (!args) {
                message = [PREFIX stringByAppendingString:[SUFIX_OF_PREFIX_INFO stringByAppendingString:[message stringByAppendingString:SUFIX]]];
                va_start(args, message);
            }
            TFLogv(message, args);
        }
    }
    
    va_end(args);
}

+ (void) Log_GPS_Location_Messages:(NSString*) message,...{
    va_list args = NULL;
    
    if (LOGGING_ALL) {
        if (LOGGING_GPS_LOCATION) {
            message = [PREFIX stringByAppendingString:[SUFIX_OF_PREFIX_GPS stringByAppendingString:[message stringByAppendingString:SUFIX]]];
            va_start(args, message);
            NSLogv(message, args);
            
            
        }
    }
    
    if (LOGGING_TESTFLIGHT_CHECKPOINTS) {
        if (LOGGING_GPS_LOCATION) {
            if (!args) {
                message = [PREFIX stringByAppendingString:[SUFIX_OF_PREFIX_GPS stringByAppendingString:[message stringByAppendingString:SUFIX]]];
                va_start(args, message);
            }
            TFLogv(message, args);
        }
    }
    
    va_end(args);
    
}

+ (void) Log_Libs_Messages:(NSString*) message,...{
    va_list args = NULL;
    
    if (LOGGING_ALL) {
        if (LOGGING_LIBS) {
            message = [PREFIX stringByAppendingString:[SUFIX_OF_PREFIX_LIBS stringByAppendingString:[message stringByAppendingString:SUFIX]]];
            va_start(args, message);
            NSLogv(message, args);
            
            
        }
    }
    
    if (LOGGING_TESTFLIGHT_CHECKPOINTS) {
        if (LOGGING_LIBS) {
            if (!args) {
                message = [PREFIX stringByAppendingString:[SUFIX_OF_PREFIX_LIBS stringByAppendingString:[message stringByAppendingString:SUFIX]]];
                va_start(args, message);
            }
            TFLogv(message, args);
        }
    }
    
    va_end(args);
    
}

+ (void) Log_Quick:(NSString *) message, ...{
    va_list args = NULL;
    
    if (LOGGING_ALL) {
        if (LOGGING_QUICK) {
            message = [PREFIX stringByAppendingString:[SUFIX_OF_PREFIX_QUICK stringByAppendingString:[message stringByAppendingString:SUFIX]]];
            va_start(args, message);
            NSLogv(message, args);
            
        }
    }
    
    if (LOGGING_TESTFLIGHT_CHECKPOINTS) {
        if (LOGGING_QUICK) {
            if (!args) {
                message = [PREFIX stringByAppendingString:[SUFIX_OF_PREFIX_QUICK stringByAppendingString:[message stringByAppendingString:SUFIX]]];
                va_start(args, message);
            }
            TFLogv(message, args);
        }
    }
    
    va_end(args);
}


@end
