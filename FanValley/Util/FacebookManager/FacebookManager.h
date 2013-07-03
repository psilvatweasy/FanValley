//
//  FacebookManager.h
//  Tweasy
//
//  Created by Pedro Silva on 04/02/13.
//  Copyright (c) 2013 Tweasy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FacebookSDK/FacebookSDK.h>
#import "FacebookUser.h"

@interface FacebookManager : NSObject

extern NSString *const FBSessionStateChangedNotification;

@property (nonatomic) int requestType;
@property (strong, nonatomic) NSString *token_current;
@property (nonatomic) int       token_expiration;
@property (strong, nonatomic) NSString *userId_current;
@property (nonatomic) BOOL loggedIn;
@property (nonatomic) BOOL requestUserID;


- (BOOL) isSessionActive;
- (BOOL) isLoggedIn;

- (BOOL) openNewSession:(id) callback allowLoginUI:(BOOL)allowUI requestUserID:(BOOL) requestUserID_;
- (void) openReadSession:(id) callback;
- (void) openWriteSession:(id) callback;

- (FBSession *) getSession;
- (FBSessionState *) getSessionState;

- (BOOL) HavePublishPermissions;

- (void) handleDidBecomeActive;
- (void) closeSessionAndRemoveToken;
- (void) closeSession;

- (void) showDefaultDialogToPublish:(id)viewController withText:(NSString*) _text withImageName:(NSString *)_image withUrl:(NSString *) _url;
- (void) populateUserDetails:(id) callback;
- (void) populateAllUserDetails:(id) callback;
- (void) getListOfMyFriendsOrderByTweasyApp:(id) callback;

- (void) shareToTweasy:(id)callback Params:(NSMutableDictionary*) postParams;

- (void) dataReceived_GET_USER_DETAILS:(id) result callback:(id) callback;

@end


@protocol FacebookAPI

- (void) profileReceived:(FacebookUser *) user_;
- (void) sessionOpenedWithSuccess;
- (void) sessionOpenedWithNoSuccess;
- (void) writePermissionsAuthorized;

- (void) sharedWithSuccess;
- (void) sharedWithoutSuccess;

@end