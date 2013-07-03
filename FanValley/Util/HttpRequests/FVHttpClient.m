//
//  FVHttpClient.m
//  FanValley
//
//  Created by Pedro Silva on 23/05/13.
//  Copyright (c) 2013 _to_be_named_. All rights reserved.
//

#import "FVHttpClient.h"
#import "FVAppDelegate.h"
#import "FVApiReceiver.h"

@interface FVHttpClient ()

@property (strong, nonatomic) NSMutableData *responseData;
@property (strong, nonatomic) NSString *responseStringData;
@property (nonatomic) int responseCode;

- (NSString *) ParseMethodArgsToJsonString;
- (NSString *) BuildHashWithKey:(NSString *) key WithDataString:(NSString*) dataString ToMethod:(NSString*) method;

- (void) addParameterToArgsWithKey:(NSString*)key AndValueWithString:(NSString*)value;

@end

@implementation FVHttpClient

- (id)initWithtUrl:(NSString*) url Method:(NSString*) method CallBack:(id) callback{
    self = [super initWithURL:url WithMethod:method];
    
    self.callback = callback;
    
    self.responseCode = -1;
    self.responseData = [[NSMutableData alloc] init];
    
    self.type_call = -1;
    self.type_call_exception = -1;
    
    self.args = @"";

    
    return self;
}

- (NSString *) ParseMethodArgsToJsonString{

    self.args = [NSString stringWithFormat:@"%@}",self.args];
    
    NSData *jsonData = [self.args dataUsingEncoding:NSUTF8StringEncoding];
    NSError *e;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:&e];
    NSData *data = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:NULL];

    
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

- (NSString *) BuildHashWithKey:(NSString *) key WithDataString:(NSString*) dataString ToMethod:(NSString*) method{

    int timestamp_ = [[NSDate date] timeIntervalSince1970];
    NSString *message = [NSString stringWithFormat: @"%@%@%@%d%@", TWEASY_REQUEST_CLASS, method, dataString, timestamp_, USER];

    
    return [Helpers hmac256WithKey:SECRET_KEY AndData:message];
}

- (void) addParameterToArgsWithKey:(NSString*)key AndValueWithString:(NSString*)value{
    if (self.args.length > 0) {
        self.args = [NSString stringWithFormat:@"%@,\"%@\":\"%@\"",self.args,key,value];
    }else{
    
        self.args = [NSString stringWithFormat:@"{\"%@\":\"%@\"",key,value];
    }

}

- (void) RequestMe_Search:(id)callback withParameterName:(NSString *) searchText{

    self.type_call = 10;
    
    [self addParameterToArgsWithKey:@"unique_application_id" AndValueWithString:[[NSUserDefaults standardUserDefaults] valueForKey:UNIQUE_APP_ID]];
    [self addParameterToArgsWithKey:@"longitude" AndValueWithString:@""];
    [self addParameterToArgsWithKey:@"latitude" AndValueWithString:@""];
    [self addParameterToArgsWithKey:@"text" AndValueWithString:searchText];
    [self addParameterToArgsWithKey:@"type" AndValueWithString:TWEASY_SEARCH_TYPE_ALL];
    
    NSString *dataString = [self ParseMethodArgsToJsonString];
    
    NSString *hash = [self BuildHashWithKey:SECRET_KEY WithDataString:dataString ToMethod:TWEASY_REQUEST_METHOD_SEARCH];
    
    dataString = [Helpers urlencode:dataString];
    
    [self addParameterToBodyWithKey:@"client_id" AndValueWithString:USER];
    [self addParameterToBodyWithKey:@"class" AndValueWithString:TWEASY_REQUEST_CLASS];
    [self addParameterToBodyWithKey:@"method" AndValueWithString:TWEASY_REQUEST_METHOD_SEARCH];
    [self addParameterToBodyWithKey:@"args" AndValueWithString:dataString];
    [self addParameterToBodyWithKey:@"time" AndValueWithInt:[[NSDate date] timeIntervalSince1970]];
    [self addParameterToBodyWithKey:@"hash" AndValueWithString:hash];
    
    [self setRequestZipped];
    [self sendRequest:self];
    
}

#pragma mark NSURLConnection Delegate Methods

- (NSURLRequest *)connection:(NSURLConnection *)connection willSendRequest:(NSURLRequest *)request redirectResponse:(NSURLResponse *)redirectResponse{
	return request;
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    
    //    NSHTTPURLResponse* httpResponse = (NSHTTPURLResponse*)response;
    //    if ([response respondsToSelector:@selector(allHeaderFields)]) {
    //		NSDictionary *dictionary = [httpResponse allHeaderFields];
    //     [LogManager Log_General_Level_1_Messages:[dictionary description]];
    //	}
    //    int code = [httpResponse statusCode];
    //   	    [LogManager Log_General_Level_2_Messages:@"TESTE --> didReceiveResponse"];
    //        [LogManager Log_General_Level_2_Messages:@"DidReceiveResponse --> %d", code];
    //    self.responseCode = code;
    
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    NSDictionary* json;
    NSError* error;
    
    NSString *strData = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    self.type_call_exception = -1;
    
    [LogManager Log_Request_Raw_Messages:@"... %@", strData];
    
    if ([strData isEqualToString:@"Wrong time."]) {
        self.type_call = TWEASY_REQUEST_ERRO_OF_WRONG_TIME;
        return;
    }
    
    if ([[json objectForKey:@"status"] isEqualToString:@"exception"]) {
        if ([[json objectForKey:@"exception"] isEqualToString:TWEASY_EXCEPTION_USER_DOES_NOT_EXIST]) {
            self.type_call_exception = TWEASY_EXCEPTION_USER_DOES_NOT_EXIST_CALLBACK;
            [self connection:connection didFailWithError:nil];
            return;
        }else{
            [self connection:connection didFailWithError:nil];
            return;
        }
    }
    
    [self.responseData appendData:data];
    
}

- (void)connection:(NSURLConnection *) connection didFailWithError:(NSError *)error{
	[LogManager Log_Error_Level_1_Messages:@"TESTE --> didFailWithError -->%@",error];
    
    if (self.type_call_exception == TWEASY_EXCEPTION_USER_DOES_NOT_EXIST_CALLBACK) {
        return;
    }
    
    switch (self.type_call) {
        case TWEASY_REQUEST_ME_REGISTER:
            [self.callback dataFailed:error callbackCode:TWEASY_RESPONSE_CALLBACK_ME_REGISTER];
            break;
        case TWEASY_REQUEST_ME_SEARCH_NOT_TO_DB:
            [self.callback dataFailed:error callbackCode:TWEASY_RESPONSE_CALLBACK_ME_SEARCH_NOT_TO_DB];
            break;
        case TWEASY_REQUEST_ME_FAVORITE_CAMPAIGNS:
            [self.callback dataFailed:error callbackCode:TWEASY_RESPONSE_CALLBACK_ME_FAVORITE_CAMPAIGNS];
            break;
        case TWEASY_REQUEST_ME_FACEBOOK:
            [self.callback dataFailed:error callbackCode:TWEASY_RESPONSE_CALLBACK_ME_FACEBOOK];
            break;
        case TWEASY_REQUEST_ME_PROFILE:
            [self.callback dataFailed:error callbackCode:TWEASY_RESPONSE_CALLBACK_ME_PROFILE];
            break;
        case TWEASY_REQUEST_ME_SAVE_PROFILE:
            [self.callback dataFailed:error callbackCode:TWEASY_RESPONSE_CALLBACK_ME_SAVE_PROFILE];
            break;
        case TWEASY_REQUEST_ME_SHARE:
            [self.callback dataFailed:error callbackCode:TWEASY_RESPONSE_CALLBACK_ME_SHARE];
            break;
        case TWEASY_REQUEST_ME_SEARCH_NEXT_PAGE:
            [self.callback dataFailed:error callbackCode:TWEASY_RESPONSE_CALLBACK_ME_SEARCH_NEXT_PAGE];
            break;
        case TWEASY_REQUEST_ME_CAMPAIGN:
            [self.callback dataFailed:error callbackCode:TWEASY_RESPONSE_CALLBACK_ME_CAMPAIGN];
            break;
        case TWEASY_REQUEST_ME_USER:
            [self.callback dataFailed:error callbackCode:TWEASY_RESPONSE_CALLBACK_ME_USER];
            break;
        case TWEASY_REQUEST_ME_CATEGORIES:
            [self.callback dataFailed:error callbackCode:TWEASY_RESPONSE_CALLBACK_ME_CATEGORIES];
            break;
        case TWEASY_REQUEST_ME_CONTEST:
            [self.callback dataFailed:error callbackCode:TWEASY_RESPONSE_CALLBACK_CONTEST];
            break;
        case TWEASY_REQUEST_ME_COUPON:
            [self.callback dataFailed:error callbackCode:TWEASY_RESPONSE_CALLBACK_COUPON];
            break;
        case TWEASY_REQUEST_ME_FEEDBACK:
            [self.callback dataFailed:error callbackCode:TWEASY_RESPONSE_CALLBACK_FEEDBACK];
            break;
        case TWEASY_REQUEST_ME_VIEW:
            [self.callback dataFailed:error callbackCode:TWEASY_RESPONSE_CALLBACK_VIEW];
            break;
        case TWEASY_REQUEST_ME_PASSBOOK:
            [self.callback dataFailed:error callbackCode:TWEASY_RESPONSE_CALLBACK_PASSBOOK];
            break;
        case TWEASY_REQUEST_ME_FAVOUITE:
            [self.callback dataFailed:error callbackCode:TWEASY_RESPONSE_CALLBACK_FAVOURITE];
            break;
            
        default:
            break;
    }
    
    
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSDictionary* json;
    NSError* error;
    
    NSString *short_id;
    NSString *strData = [[NSString alloc]initWithData:self.responseData encoding:NSUTF8StringEncoding];
    json = [NSJSONSerialization JSONObjectWithData:self.responseData options:kNilOptions error:&error];
    self.type_call_exception = -1;
    
    [LogManager Log_Request_Raw_Messages:@"... %@", strData];
    
    if ([strData isEqualToString:@"Wrong time."]) {
        self.type_call = TWEASY_REQUEST_ERRO_OF_WRONG_TIME;
        return;
    }
    
    if ([[json objectForKey:@"status"] isEqualToString:@"exception"]) {
        if ([[json objectForKey:@"exception"] isEqualToString:TWEASY_EXCEPTION_USER_DOES_NOT_EXIST]) {
            self.type_call_exception = TWEASY_EXCEPTION_USER_DOES_NOT_EXIST_CALLBACK;
            [self connection:connection didFailWithError:nil];
            return;
        }else{
            [self connection:connection didFailWithError:nil];
            return;
        }
    }
    
    switch (self.type_call) {
        case TWEASY_REQUEST_ME_REGISTER:
            json = [NSJSONSerialization JSONObjectWithData:self.responseData options:kNilOptions error:&error];
            
            if (self.responseCode != 200 && self.responseCode != -1) {
                [LogManager Log_Error_Level_1_Messages:@"Register Error--> %@  -- %@ ",json, error];
                [self connection:connection didFailWithError:nil];
                return;
            }
            
            
            
            json = [NSJSONSerialization JSONObjectWithData:self.responseData options:kNilOptions error:&error];
            short_id = [json objectForKey:@"data"];
            
            [[NSUserDefaults standardUserDefaults] setValue:short_id forKey:SHORT_ME_ID];
            [[NSUserDefaults standardUserDefaults] synchronize];
            break;
            
        case TWEASY_REQUEST_ME_CATEGORIES:
            if (self.responseCode != 200 && self.responseCode != -1) {
                [LogManager Log_Error_Level_1_Messages:@"Error--> %@  -- %@ ",json, error];
                [self connection:connection didFailWithError:nil];
                return;
            }
            //[self didReceiveData_TWEASY_REQUEST_ME_CATEGORIES];
            
            break;

            
        default:
            
            json = [NSJSONSerialization JSONObjectWithData:self.responseData options:kNilOptions error:&error];
            [LogManager Log_Warning_Level_1_Messages:@"Entrou no switch default linha 1555 (Requester.m) --> %@",json];
            
            break;
    }
    
    [self finishConnection];
}

- (void) finishConnection{
    switch (self.type_call) {
        case TWEASY_REQUEST_ME_REGISTER:
            [self.callback dataReceived:@"OK" callbackCode:TWEASY_RESPONSE_CALLBACK_ME_REGISTER];
            break;
        case TWEASY_REQUEST_ME_PROFILE:
            [self.callback dataReceived:@"OK" callbackCode:TWEASY_RESPONSE_CALLBACK_ME_PROFILE];

        default:
            break;
    }
}


@end
