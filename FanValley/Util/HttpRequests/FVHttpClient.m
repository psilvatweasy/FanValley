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

//- (void) addParameterToArgsWithKey:(NSString*)key AndValueWithString:(NSString*)value;

@end

@implementation FVHttpClient

- (id)initWithCallback:(id) callback{
    self = [super init];
    
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

//    int timestamp_ = [[NSDate date] timeIntervalSince1970];
//    NSString *message = [NSString stringWithFormat: @"%@%@%@%d%@", TWEASY_REQUEST_CLASS, method, dataString, timestamp_, USER];
//
//    
//    return [Helpers hmac256WithKey:SECRET_KEY AndData:message];
    return @"";
}

- (void) registerDevice{
    /*
     /register-device
     
     - uniqueId *
     - os : android|ios *
     - os_version : 4.04 *
     - application_version *
     - latitude
     - longitude
     - macAddress
     - timezone
     
     */

    self.type_call = FANVALLEY_REQUEST_REGISTER;
    [self setRequestWithUrl:FANVALLEY_URL UrlService:FANVALLEY_SERVICE_REGISTER HttpMethod:HTTP_METHOD_POST];

    [self addParameterToBodyWithKey:@"uniqueId" AndValue:[Helpers getUUID]];
    [self addParameterToBodyWithKey:@"os" AndValue:@"ios"];
    [self addParameterToBodyWithKey:@"os_version" AndValue:[[UIDevice currentDevice] systemVersion]];
    [self addParameterToBodyWithKey:@"application_version" AndValue:[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"]];

    [self addParameterToBodyWithKey:@"longitude" AndValue:@""];
    [self addParameterToBodyWithKey:@"latitude" AndValue:@""];
    
    [self addParameterToBodyWithKey:@"timezone" AndValue:[NSString stringWithFormat:@"%f",[[NSDate date] timeIntervalSince1970]]];
    
    [self sendRequest:self];
}

- (void) registerPushNotifications:(NSString*) pushId{
    /*
     /register-push
     
     - uniqueId*
     - pushId*
     
     */
    
    self.type_call = FANVALLEY_REQUEST_REGISTER_PUSH_NOTIFICATION;
    [self setRequestWithUrl:FANVALLEY_URL UrlService:FANVALLEY_SERVICE_REGISTER_PUSH_NOTIFICATION HttpMethod:HTTP_METHOD_POST];
    
    [self addParameterToBodyWithKey:@"uniqueId" AndValue:[Helpers getUUID]];
    [self addParameterToBodyWithKey:@"pushId" AndValue:pushId];

    
    [self sendRequest:self];
}

- (void) searchClubs:(NSString*) name Country:(NSString*)country Sport:(NSString*) sport{
    /*
      /search-clubs/
     
     - name
     - country
     - sport
     
     */
    
    self.type_call = FANVALLEY_REQUEST_SEARCH_CLUBS;
    [self setRequestWithUrl:FANVALLEY_URL UrlService:FANVALLEY_SERVICE_SEARCH_CLUBS HttpMethod:HTTP_METHOD_GET];
    
    [self addParameterToHeaderWithKey:@"name" AndValue:name];
    [self addParameterToHeaderWithKey:@"country" AndValue:country];
    [self addParameterToHeaderWithKey:@"sport" AndValue:sport];
    
    
    [self sendRequest:self];
}

#pragma mark NSURLConnection Delegate Methods

- (NSURLRequest *)connection:(NSURLConnection *)connection willSendRequest:(NSURLRequest *)request redirectResponse:(NSURLResponse *)redirectResponse{
	return request;
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    
    NSHTTPURLResponse* httpResponse = (NSHTTPURLResponse*)response;
    if ([response respondsToSelector:@selector(allHeaderFields)]) {
        NSDictionary *dictionary = [httpResponse allHeaderFields];
        [LogManager Log_General_Level_1_Messages:[dictionary description]];
    }
    int code = [httpResponse statusCode];
    //[LogManager Log_General_Level_2_Messages:@"TESTE --> didReceiveResponse"];
    [LogManager Log_General_Level_2_Messages:@"DidReceiveResponse --> %d", code];
    self.responseCode = code;
    
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
    

    
    [self.responseData appendData:data];
    
}

- (void)connection:(NSURLConnection *) connection didFailWithError:(NSError *)error{
	[LogManager Log_Error_Level_1_Messages:@"TESTE --> didFailWithError -->%@",error];
    
    
    switch (self.type_call) {
        case FANVALLEY_REQUEST_REGISTER:
            [self.callback dataFailed:error callbackCode:FANVALLEY_RESPONSE_CALLBACK_REGISTER];
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
    
       
    switch (self.type_call) {
        case FANVALLEY_REQUEST_REGISTER:
            json = [NSJSONSerialization JSONObjectWithData:self.responseData options:kNilOptions error:&error];
            
            if (self.responseCode != 200 && self.responseCode != -1) {
                [LogManager Log_Error_Level_1_Messages:@"Register Error--> %@  -- %@ ",json, error];
                [self connection:connection didFailWithError:nil];
                return;
            }
            short_id = [json objectForKey:@"data"];
            
            [self didReceiveData_FANVALLEY_REQUEST_REGISTER];



            
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
        case FANVALLEY_REQUEST_REGISTER:
            [self.callback dataReceived:@"OK" callbackCode:FANVALLEY_RESPONSE_CALLBACK_REGISTER];
            break;

        default:
            break;
    }
}

-(void) didReceiveData_FANVALLEY_REQUEST_REGISTER{

}


@end
