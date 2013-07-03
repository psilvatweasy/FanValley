//
//  FVAppDelegate.m
//  FanValley
//
//  Created by Pedro Silva on 22/04/13.
//  Copyright (c) 2013 _to_be_named_. All rights reserved.
//

#import "FVAppDelegate.h"

#import "FVFanZoneViewController.h"
#import "FVLeftMenuViewController.h"
#import "FVRightMenuViewController.h"

#import "FVTourViewController.h"
#import "GAI.h"

@implementation FVAppDelegate

@synthesize fbManager = _fbManager;
@synthesize db_manager = _db_manager;

//@synthesize locator_manager = _locator_manager;


//- (Locator *) locator_manager{
//    if (_locator_manager) {
//        return _locator_manager;
//    }else{
//        _locator_manager = [[Locator alloc] init];
//        return _locator_manager;
//    }
//    
//}

- (FacebookManager *) fbManager{
    if (_fbManager) {
        return _fbManager;
    }else{
        _fbManager = [[FacebookManager alloc] init];
        
        return _fbManager;
    }
    
}

- (DataBaseManager *)db_manager{
    
    if (!_db_manager) {
        _db_manager = [[FVDataBaseManager alloc] init];
    }
    
    return _db_manager;
    
}

- (void) quitTourAndStartApp{
    UIView *v=self.window.rootViewController.view;
    v.frame = CGRectMake(0, 0, v.frame.size.width, v.frame.size.height);
    v.tag = 777;
    [self.mainViewController.view addSubview:v];
    self.window.rootViewController = self.mainViewController;
    
    [UIView beginAnimations:@"quitTour" context:nil];
    [UIView setAnimationDuration:1];


    v.alpha = 0;
    
    [UIView commitAnimations];

    
}

- (void) animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context{
    if ([animationID isEqualToString:@"quitTour"]) {
        [[self.window.rootViewController.view viewWithTag:777] removeFromSuperview];
    }
    

}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    
    [FBProfilePictureView class];
    
    // Optional: automatically send uncaught exceptions to Google Analytics.
    [GAI sharedInstance].trackUncaughtExceptions = YES;
    // Optional: set Google Analytics dispatch interval to e.g. 20 seconds.
    [GAI sharedInstance].dispatchInterval = 1;
    // Optional: set debug to YES for extra debugging information.
    [GAI sharedInstance].debug = NO;
    // Create tracker instance.
    id<GAITracker> tracker = [[GAI sharedInstance] trackerWithTrackingId:@"UA-42002190-1"];

    
    //[GAI sharedInstance].debug = YES;
    
    self.db_manager = [[FVDataBaseManager alloc] init];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor clearColor];

    self.mainViewController = [[JASidePanelController alloc] init];
    self.mainViewController.shouldDelegateAutorotateToVisiblePanel = NO;
    
	self.mainViewController.leftPanel = [[FVLeftMenuViewController alloc] init];
	self.mainViewController.centerPanel = [[UINavigationController alloc] initWithRootViewController:[[FVFanZoneViewController alloc] init]];
	self.mainViewController.rightPanel = [[FVRightMenuViewController alloc] init];
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:HAS_LAUNCH_ONCE])
    {
        // app already launched
        self.window.rootViewController = self.mainViewController;
    }
    else
    {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"HasLaunchedOnce"];

        FVTourViewController *tourView = [[FVTourViewController alloc] init];
        self.window.rootViewController = tourView;
        
    }
	
    
    
    [self.window makeKeyAndVisible];
    

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    
    [tracker close];
}

- (void)applicationWillEnterForeground:(UIApplication *)application{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application{
    // Saves changes in the application's managed object context before the application terminates.
    [self.db_manager saveContext];
    
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    
    [tracker close];
}

- (BOOL)application: (UIApplication *)application openURL: (NSURL *)url sourceApplication: (NSString *)sourceApplication annotation: (id)annotation {
    // ...
    
//    if ([self.GPshare handleURL:url sourceApplication:sourceApplication annotation:annotation]) {
//        return YES;
//    }else{
        return [FBSession.activeSession handleOpenURL:url];
//    }
    
    // ...
}

#pragma mark -
#pragma mark Api FACEBOOK methods
- (void) profileReceived:(NSDictionary<FBGraphUser>*) user_{}

- (void) sessionOpenedWithNoSuccess{}

- (void) sessionOpenedWithSuccess{}

- (void) writePermissionsAuthorized{}

- (void) sharedWithSuccess{
    
}

- (void) sharedWithoutSuccess{
    
}

@end
