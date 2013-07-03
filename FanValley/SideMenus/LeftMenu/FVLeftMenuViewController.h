//
//  FVLeftMenuViewController.h
//  FanValley
//
//  Created by Pedro Silva on 03/05/13.
//  Copyright (c) 2013 Tweasy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GAITrackedViewController.h"

@interface FVLeftMenuViewController : GAITrackedViewController <FacebookAPI>

@property (weak, nonatomic) IBOutlet UIView *ViewFanHeader;
@property (weak, nonatomic) IBOutlet UIButton *BTFacebookLogin;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet FBProfilePictureView *profileImg;
@property (weak, nonatomic) IBOutlet UILabel *lblName;

@property (weak, nonatomic) IBOutlet UIButton *BTLogout;


- (IBAction)LoginWithFacebook:(id)sender;
- (IBAction)Logout:(id)sender;


- (IBAction)OpenFanZone:(id)sender;
- (IBAction)OpenFanClub:(id)sender;
- (IBAction)OpenFanCard:(id)sender;

@end
