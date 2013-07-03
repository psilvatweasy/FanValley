//
//  FVLeftMenuViewController.h
//  FanValley
//
//  Created by Pedro Silva on 03/05/13.
//  Copyright (c) 2013 Tweasy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FVLeftMenuViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *ViewFanHeader;
@property (weak, nonatomic) IBOutlet UIButton *BTFacebookLogin;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;


- (IBAction)LoginWithFacebook:(id)sender;

- (IBAction)OpenFanZone:(id)sender;
- (IBAction)OpenFanClub:(id)sender;
- (IBAction)OpenFanCard:(id)sender;

@end
