//
//  FVAppDelegate.h
//  FanValley
//
//  Created by Pedro Silva on 22/04/13.
//  Copyright (c) 2013 _to_be_named_. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FVDataBaseManager.h"
#import "FacebookManager.h"



@interface FVAppDelegate : UIResponder <UIApplicationDelegate>


@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) FacebookManager *fbManager;
@property (strong, nonatomic) FVDataBaseManager *db_manager;
//@property (strong, nonatomic) Locator *locator_manager;





@property (strong, nonatomic) JASidePanelController *mainViewController;

- (void) quitTourAndStartApp;

@end
