//
//  FVLoginViewController.h
//  FanValley
//
//  Created by Pedro Silva on 16/07/13.
//  Copyright (c) 2013 Named. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FVApiReceiver.h"

@interface FVLoginViewController : UIViewController <FVApiReceiver, FacebookAPI>

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UIButton *btLoginFacebook;

- (IBAction)LoginWithFacebook:(id)sender;

- (void) closeViewController;
@end
