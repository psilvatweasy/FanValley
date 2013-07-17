//
//  HttpClient.m
//  FanValley
//
//  Created by Pedro Silva on 23/05/13.
//  Copyright (c) 2013 _to_be_named_. All rights reserved.
//

#import "HttpClient.h"

@implementation HttpClient


- (id)init{
    self = [super init];
    
    if (self) {
        self.body = @"";
        self.header = @"";
    }
    
    return self;
}



- (void) addParameterToBodyWithKey:(NSString*)key AndValue:(id)value{

    if (self.body.length > 0) {
        self.body = [NSString stringWithFormat:@"%@,\"%@\":\"%@\"",self.body,key,value];
    }else{
        self.body = [NSString stringWithFormat:@"{\"%@\":\"%@\"",key,value];
    }
}

- (void) addParameterToHeaderWithKey:(NSString*)key AndValue:(id)value{
    if (self.header.length > 0) {
        self.header = [NSString stringWithFormat:@"%@&%@=%@",self.header,key,value];
    }else{
        self.header = [NSString stringWithFormat:@"?%@=%@",key,value];
    }
}



- (void) setRequestWithUrl:(NSString *)url UrlService:(NSString*)service HttpMethod:(NSString*)method{

   self.request = [NSMutableURLRequest requestWithURL: [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",url,service]]];
    

    [self.request setHTTPMethod:method];

}
- (void) setRequestZipped{
    [self.request addValue:@"gzip" forHTTPHeaderField:@"Accept-Encoding"];
}
- (void) sendRequest:(id) delegate{
    
    if (self.body.length > 0) {
        self.body = [NSString stringWithFormat:@"%@}",self.body];
        NSData *jsonData = [self.body dataUsingEncoding:NSUTF8StringEncoding];
        NSError *e;
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:&e];
        NSData *data = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:NULL];
        
        
        self.body = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        
        
        [self.request setHTTPBody:[self.body dataUsingEncoding:NSUTF8StringEncoding]];
    }
    
    if (self.header.length > 0) {
        [self.request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",self.request.URL,self.header]]];
    }
    [LogManager Log_Quick:@"%@",self.request.URL];
    
    [self.request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [self.request setValue:@"application/json" forHTTPHeaderField:@"Accept"];


    (void)[[NSURLConnection alloc] initWithRequest:self.request delegate:delegate];
}

@end
