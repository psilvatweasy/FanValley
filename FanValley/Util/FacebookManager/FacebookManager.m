//
//  FacebookManager.m
//  Tweasy
//
//  Created by Pedro Silva on 04/02/13.
//  Copyright (c) 2013 Tweasy. All rights reserved.
//

#import "FacebookManager.h"
#import "FacebookUser.h"
#import "Helpers.h"


@interface FacebookManager()

@property (nonatomic, strong) NSArray *permissionsToConnect;
@property (nonatomic, strong) NSArray *permissionsToRead;
@property (nonatomic, strong) NSArray *permissionsToWrite;

@end

@implementation FacebookManager
@synthesize permissionsToConnect = _permissionsToConnect;
@synthesize permissionsToRead = _permissionsToRead;
@synthesize permissionsToWrite = _permissionsToWrite;
@synthesize token_current = _token_current;
@synthesize token_expiration = _token_expiration;
@synthesize userId_current = _userId_current;

NSString *const FBSessionStateChangedNotification = @"com.named.FanValley:FBSessionStateChangedNotification";


- (id)init{
    
    return [super init];
}

- (void) handleDidBecomeActive{
    [FBSession.activeSession handleDidBecomeActive];
}

- (void) closeSession{
    self.loggedIn = YES;
    self.token_current = @"";
    self.token_expiration = -1;
    self.userId_current = @"";
    [FBSession.activeSession close];
}

- (void) closeSessionAndRemoveToken{
    self.loggedIn = NO;
    self.token_current = @"";
    self.token_expiration = -1;
    self.userId_current = @"";
    [FBSession.activeSession closeAndClearTokenInformation];
}

- (BOOL) HavePublishPermissions{
    if ([FBSession.activeSession.permissions indexOfObject:@"publish_actions"] == NSNotFound) {
        return NO;
    }else{
        return YES;
    }
}

-(BOOL) isLoggedIn{
    return [self openNewSession:nil allowLoginUI:NO requestUserID:NO];
}

- (NSString *) token_current{
    
    if (_token_current) {
        return _token_current;
    }else{
        return _token_current = [[NSString alloc] initWithFormat:@""];
    }

}

- (int) token_expiration{
    
    if (_token_expiration) {
        return _token_expiration;
    }else{
        return _token_expiration = -1;
    }
    
}

- (NSString *) userId_current{
    
    if (_userId_current) {
        return _userId_current;
    }else{
        return _userId_current = [[NSString alloc] initWithFormat:@""];
    }
    
}

- (NSArray *) permissionsToConnect{
    if (_permissionsToConnect) {
        return _permissionsToConnect;
    }else{
        _permissionsToConnect = [NSArray arrayWithObjects:@"email",@"user_about_me",@"user_photos", @"friends_photos",@"read_friendlists",@"friends_subscriptions",@"user_subscriptions",@"friends_actions.news", nil];//,@"friends_actions:com.tweasy.Tweasy"
        return _permissionsToConnect;
    }
    
}

- (NSArray *) permissionsToRead{
    if (_permissionsToRead) {
        return _permissionsToRead;
    }else{
        _permissionsToRead = [NSArray arrayWithObjects:@"email",@"user_about_me",@"user_photos", @"friends_photos",@"read_friendlists",@"friends_subscriptions",@"user_subscriptions",@"friends_actions.news", nil];
        return _permissionsToRead;
    }
    
}

- (NSArray *) permissionsToWrite{
    if (_permissionsToWrite) {
        return _permissionsToWrite;
    }else{
        _permissionsToWrite = [NSArray arrayWithObjects:@"publish_actions", nil];
        return _permissionsToWrite;
    }
    
}

- (BOOL) isSessionActive{
    if (FBSession.activeSession.isOpen) {
        return YES;
    } else {
        //[FBSession.activeSession closeAndClearTokenInformation];
        return NO;
    }
}

- (FBSession *) getSession{

    return [FBSession activeSession];

}

- (FBSessionState *) getSessionState{
    
    return (FBSessionState *)[[FBSession activeSession] state];
    
}

- (BOOL) openNewSession:(id) callback allowLoginUI:(BOOL)allowUI requestUserID:(BOOL) requestUserID_{
    // If a user has *never* logged into your app, request one of
    // "email", "user_location", or "user_birthday". If you do not
    // pass in any permissions, "email" permissions will be automatically
    // requested for you. Other read permissions can also be included here.
    
    // See if we have a valid token for the current state.
//    if (FBSession.activeSession.isOpen) {
    //        self.loggedIn = YES;
    //        [self openReadSession:callback];
    //    } else{
    //        // No, display the login page.
    
    self.requestUserID = requestUserID_;
    
    return [FBSession openActiveSessionWithReadPermissions:self.permissionsToConnect allowLoginUI:allowUI completionHandler:^(FBSession *session, FBSessionState status, NSError *error) {
        
        [self sessionStateChanged:session state:status error:error callback:callback];
    }];
    //    }
    
}

- (void) openReadSession:(id) callback{

    [[FBSession activeSession] reauthorizeWithReadPermissions:self.permissionsToRead
                                            completionHandler:^(FBSession *session, NSError *error) {
                                                /* handle success + failure in block */
                                                if (!error) {
                                                    [callback sessionOpenedWithSuccess];
                                                }else{
                                                    [callback sessionOpenedWithNoSuccess];
                                                }
                                            }];
}

- (void) openWriteSession:(id) callback{
    [[FBSession activeSession] reauthorizeWithPublishPermissions:self.permissionsToWrite
                                                 defaultAudience:FBSessionDefaultAudienceFriends
                                               completionHandler:^(FBSession *session, NSError *error) {
                                                   if (!error) {
                                                       [callback writePermissionsAuthorized];
                                                   }else{
                                                       
                                                       NSString * message = NSLocalizedString(@"You need to enable Tweasy App on Facebook service in your phone settings.", @"facebook_share_error");
                                                       
                                                       UIAlertView *alertView = [[UIAlertView alloc]
                                                                                 initWithTitle:NSLocalizedString(@"Facebook Sharing", @"facebook_sharing")
                                                                                 message:message
                                                                                 delegate:nil
                                                                                 cancelButtonTitle:@"OK"
                                                                                 otherButtonTitles:nil];
                                                       [alertView show];

                                                   }
                                               }];
}

- (void) showDefaultDialogToPublish:(id)viewController withText:(NSString*) _text withImageName:(NSString *)_image withUrl:(NSString *) _url{
    
        BOOL displayedNativeDialog =
        [FBNativeDialogs
         presentShareDialogModallyFrom:viewController
         initialText:_text
         image:[UIImage imageNamed:_image]
         url:[NSURL URLWithString:_url]
         handler:^(FBNativeDialogResult result, NSError *error) {
             if (error) {
                 /* handle failure */
             } else {
                 if (result == FBNativeDialogResultSucceeded) {
                     /* handle success */
                 } else {
                     /* handle user cancel */
                 }
             }
         }];
        if (!displayedNativeDialog) {
            /*
             Fallback to web-based Feed Dialog:
             https://developers.facebook.com/docs/howtos/feed-dialog-using-ios-sdk/
             */
        }
}

- (void) populateUserDetails:(id) callback{
    FacebookUser *FBUser =[[FacebookUser alloc] init];
    if (FBSession.activeSession.isOpen) {

        [[FBRequest requestForMe] startWithCompletionHandler:
         ^(FBRequestConnection *connection,
           NSDictionary<FBGraphUser> *user,
           NSError *error) {
             if (!error) {
                 self.userId_current = user.id;
                 FBUser.name = user.name;
                 FBUser.id = user.id;
                 FBUser.location = user.location.name;
                 if (self.requestUserID) {
                     self.requestUserID = NO;
                     [callback sessionOpenedWithSuccess];

                 }else{
                     [callback profileReceived:FBUser];
                 }

             }
         }];
    }
}

- (void) populateAllUserDetails:(id) callback{
    self.requestType = FACEBOOK_REQUEST_GET_USER_DETAILS;
    [FBRequestConnection startWithGraphPath:@"me?fields=location,id,name,cover" completionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
        
        [self requestConnectionReceived:connection result:result error:error callback:callback];
        
        
    }];
    
    
}

- (void) getListOfMyFriendsOrderByTweasyApp:(id) callback{
    self.requestType = FACEBOOK_REQUEST_GET_FRIENDS_LIST;
    
    [FBRequestConnection startWithGraphPath:@"me/friends?fields=installed,name" completionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
        
        [self requestConnectionReceived:connection result:result error:error callback:callback];
        
    
        
    }];

}

- (void) shareToTweasy:(id)callback Params:(NSMutableDictionary*) postParams{
    [FBRequestConnection
     startWithGraphPath:@"me/feed"
     parameters:postParams
     HTTPMethod:@"POST"
     completionHandler:^(FBRequestConnection *connection,
                         id result,
                         NSError *error) {
         //NSString *alertText;
         if (error) {

             [callback sharedWithoutSuccess];
         } else {
             [callback sharedWithSuccess];
         }

         
     }];

}

/*
 * Callback for RequestConnection.
 */
- (void) requestConnectionReceived:(FBRequestConnection *)connection result:(id) result error:(NSError *)error callback:(id) callback {
    NSMutableArray* array;
    switch (self.requestType) {
        case FACEBOOK_REQUEST_GET_FRIENDS_LIST:
            array = [result objectForKey:@"data"];
            array = [Helpers orderArrayOfFacebookByInstalledAPP:array ascendingOrder:NO];
            self.requestType = -1;
            break;
            
        case FACEBOOK_REQUEST_GET_USER_DETAILS:
            [self dataReceived_GET_USER_DETAILS:result callback:callback];
            self.requestType = -1;
            
        default:
            break;
    }
    
}

/*
 * Callback for session changes.
 */
- (void) sessionStateChanged:(FBSession *)session state:(FBSessionState) state error:(NSError *)error callback:(id) callback {
    
    switch (state) {
        case FBSessionStateOpen: {
            self.token_current = session.accessToken;
            self.token_expiration = (int)[session.expirationDate timeIntervalSince1970];
            self.loggedIn = YES;
            [FBSession.activeSession handleDidBecomeActive];

            if (self.requestUserID) {
                [self populateUserDetails:callback];
            }else{
                [callback sessionOpenedWithSuccess];
            }
            
            

            

            
        }
            break;
        case FBSessionStateClosed:

            [callback sessionOpenedWithNoSuccess];
        case FBSessionStateClosedLoginFailed:
            // Once the user has logged in, we want them to
            // be looking at the root view.
            //[callback dismissModalViewControllerAnimated:YES];

            [callback sessionOpenedWithNoSuccess];
            
            break;
        default:
            break;
    }
    
    
    [[NSNotificationCenter defaultCenter] postNotificationName:FBSessionStateChangedNotification
                                                        object:session];
    
    if (error) {
        
        [LogManager Log_Facebook_Error_Messages:@"FACEBOOK ---> %@",error.localizedDescription];
        NSString * message = NSLocalizedString(@"You need to enable Tweasy App on Facebook service in your phone settings.", @"facebook_share_error");
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:NSLocalizedString(@"Facebook Sharing", @"facebook_sharing")
                                  message:message
                                  delegate:nil
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles:nil];
        [alertView show];
    }
}


- (void) dataReceived_GET_USER_DETAILS:(id) result callback:(id) callback{

    NSDictionary *dic = result;
    FacebookUser *FBUser = [[FacebookUser alloc] init];
    
    if (![[dic objectForKey:@"cover"] isKindOfClass:[NSNull class]]) {
        NSString* id_image_cover= [[dic objectForKey:@"cover"] objectForKey:@"source"];

        FBUser.id = [dic objectForKey:@"id"];
        FBUser.url_cover_photo = id_image_cover;
        FBUser.name = [dic objectForKey:@"name"];
        FBUser.location = [[dic objectForKey:@"location"] objectForKey:@"name"];

        [callback profileReceived:FBUser];
    }

}



@end



//  Read Permissions
//  user_about_me               friends_about_me            user_activities
//  friends_activities          user_birthday               friends_birthday
//  user_checkins               friends_checkins            user_education_history
//  friends_education_history	user_events                 friends_events
//  user_groups                 friends_groups              user_hometown
//  friends_hometown            user_interests              friends_interests
//  user_likes                  friends_likes               user_notes
//  friends_notes               user_online_presence        friends_online_presence
//  user_interests              friends_interests           user_likes
//  friends_likes               user_notes                  friends_notes
//  user_online_presence        friends_online_presence     user_religion_politics
//  friends_religion_politics   user_status                 friends_status
//  user_subscriptions          friends_subscriptions       user_videos
//  friends_videos              user_website                friends_website
//  user_work_history           friends_work_history        read_friendlists
//  read_mailbox                read_requests               read_stream
//  read_insights               xmpp_login
