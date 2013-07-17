//
//  FVFanZoneViewController.h
//  FanValley
//
//  Created by Pedro Silva on 05/06/13.
//  Copyright (c) 2013 Named. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FVHttpClient.h"
#import "FVApiReceiver.h"

@interface FVFanZoneViewController : UIViewController <FVApiReceiver>

- (IBAction)OpenMyFanClubsList:(id)sender;
- (IBAction)OpenSearchClubView:(id)sender;
- (IBAction)OpenShareView:(id)sender;


@end
