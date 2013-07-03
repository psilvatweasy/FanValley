//
//  HttpClient.h
//  FanValley
//
//  Created by Pedro Silva on 23/05/13.
//  Copyright (c) 2013 _to_be_named_. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpClient : NSObject

@property (strong, nonatomic) NSString* method;
@property (strong, nonatomic) NSString* body;
@property (strong, nonatomic) NSString* header;

@property (strong, nonatomic) NSMutableURLRequest *request;

- (id)initWithURL:(NSString*)url WithMethod:(NSString*)method;

- (void) addParameterToBodyWithKey:(NSString*)key AndValueWithString:(NSString*)value;
- (void) addParameterToBodyWithKey:(NSString*)key AndValueWithInt:(int)value;

- (void) addParameterToHeaderWithKey:(NSString*)key AndValueWithString:(NSString*)value;
- (void) addParameterToHeaderWithKey:(NSString*)key AndValueWithInt:(int)value;

- (void) setRequestZipped;

- (void) sendRequest:(id) delegate;

@end
