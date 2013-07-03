//
//  FVHttpClient.h
//  FanValley
//
//  Created by Pedro Silva on 23/05/13.
//  Copyright (c) 2013 _to_be_named_. All rights reserved.
//

#import "HttpClient.h"

@interface FVHttpClient : HttpClient

@property (nonatomic) id callback;

@property (nonatomic) int type_call;
@property (nonatomic) int type_call_exception;

@property (nonatomic, strong) NSString *args;


- (id)initWithtUrl:(NSString*) url Method:(NSString*) method CallBack:(id) callback;

- (void) RequestMe_Search:(id)callback withParameterName:(NSString *) searchText;


@end
