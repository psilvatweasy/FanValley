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


- (void) addParameterToBodyWithKey:(NSString*)key AndValue:(id)value;

- (void) addParameterToHeaderWithKey:(NSString*)key AndValue:(id)value;

- (void) setRequestWithUrl:(NSString *)url UrlService:(NSString*)service HttpMethod:(NSString*)method;
- (void) setRequestZipped;

- (void) sendRequest:(id) delegate;

@end
