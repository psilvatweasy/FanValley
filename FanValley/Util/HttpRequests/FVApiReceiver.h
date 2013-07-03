//
//  FVApiReceiver.h
//  FanValley
//
//  Created by Pedro Silva on 23/05/13.
//  Copyright (c) 2013 _to_be_named_. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FVApiReceiver <NSObject>

- (void) dataReceived:(NSString*)data callbackCode:(int) code;
- (void) dataReceived:(NSString*)data withObject:(id)object callbackCode:(int) code;
- (void) dataReceivedWithData:(NSData*)data callbackCode:(int) code;

- (void) dataNotReceivedCauseWrongTime;
- (void) dataFailed:(NSError*)error callbackCode:(int)code;

@end
