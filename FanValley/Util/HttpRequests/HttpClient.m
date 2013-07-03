//
//  HttpClient.m
//  FanValley
//
//  Created by Pedro Silva on 23/05/13.
//  Copyright (c) 2013 _to_be_named_. All rights reserved.
//

#import "HttpClient.h"

@implementation HttpClient


- (id)initWithURL:(NSString*)url WithMethod:(NSString*)method{
    self = [super init];
    
    if (self) {
        url = [NSString stringWithFormat:@"%@&",url];
        self.request = [NSMutableURLRequest requestWithURL: [NSURL URLWithString:url]];
        [self.request setHTTPMethod:method];
        self.body = @"";
        self.header = @"";
    }
    
    return self;
}

- (void) addParameterToBodyWithKey:(NSString*)key AndValueWithString:(NSString*)value{
    if (self.body.length > 0) {
        self.body = [NSString stringWithFormat:@"%@&%@=%@",self.body,key,value];
    }else{
        self.body = [NSString stringWithFormat:@"%@=%@",key,value];
    }
}
- (void) addParameterToBodyWithKey:(NSString*)key AndValueWithInt:(int)value{
    if (self.body.length > 0) {
        self.body = [NSString stringWithFormat:@"%@&%@=%d",self.body,key,value];
    }else{
        self.body = [NSString stringWithFormat:@"%@=%d",key,value];
    }

}

- (void) addParameterToHeaderWithKey:(NSString*)key AndValueWithString:(NSString*)value{}
- (void) addParameterToHeaderWithKey:(NSString*)key AndValueWithInt:(int)value{}

- (void) setRequestZipped{
    [self.request addValue:@"gzip" forHTTPHeaderField:@"Accept-Encoding"];
}

- (void) sendRequest:(id) delegate{

    [self.request setHTTPBody:[self.body dataUsingEncoding:NSUTF8StringEncoding]];
    (void)[[NSURLConnection alloc] initWithRequest:self.request delegate:delegate];
}

@end
