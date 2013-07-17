//
//  FVLeftMenuViewController.m
//  FanValley
//
//  Created by Pedro Silva on 03/05/13.
//  Copyright (c) 2013 Tweasy. All rights reserved.
//

#import "FVLeftMenuViewController.h"
#import "UIViewController+JASidePanel.h"
#import "FVFanZoneViewController.h"
#import "FVFanClubViewController.h"
#import "FVFanCardViewController.h"
#import "FVAppDelegate.h"

@interface FVLeftMenuViewController ()
@property (nonatomic, strong) FVAppDelegate *delegate;
@end

@implementation FVLeftMenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.scrollView.contentSize= CGSizeMake(320, 1000);
    self.delegate  = (FVAppDelegate *) [[UIApplication sharedApplication] delegate];

    // Do any additional setup after loading the view from its nib.

}

-(void)viewDidAppear:(BOOL)animated{

}

- (void)viewWillAppear:(BOOL)animated{
    if ([self.delegate.fbManager openNewSession:self allowLoginUI:NO requestUserID:NO]) {
        
        [[self BTFacebookLogin] setHidden:YES];
        [self.delegate.fbManager populateAllUserDetails:self];
    }else{
        [[self ViewFanHeader] setHidden:YES];
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)isBeingDismissed{

    
    return YES;
}

-(BOOL)isBeingPresented{

    if ([self.delegate.fbManager openNewSession:self allowLoginUI:NO requestUserID:NO]) {
        
        [[self BTFacebookLogin] setHidden:YES];
        [[self ViewFanHeader] setHidden:NO];
        [self.delegate.fbManager populateAllUserDetails:self];
    }else{
                [[self BTFacebookLogin] setHidden:NO];
        [[self ViewFanHeader] setHidden:YES];
    }
    
    return YES;
}

- (void)viewWillLayoutSubviews{

}

- (void)viewDidLayoutSubviews{
    [LogManager Log_Quick:@"B"];
}

- (IBAction)LoginWithFacebook:(id)sender {
        [self.delegate.fbManager openNewSession:self allowLoginUI:YES requestUserID:YES];
}

- (IBAction)Logout:(id)sender {
    
    [self.delegate.fbManager closeSessionAndRemoveToken];

    self.profileImg.profileID = @"";
    self.lblName.text = @"";
    
    [self.sidePanelController toggleLeftPanel:self];
}

- (IBAction)OpenFanZone:(id)sender {
    self.sidePanelController.centerPanel = [[UINavigationController alloc] initWithRootViewController:[[FVFanZoneViewController alloc] init]];
}

- (IBAction)OpenFanClub:(id)sender {
    self.sidePanelController.centerPanel = [[UINavigationController alloc] initWithRootViewController:[[FVFanClubViewController alloc] init]];
}

- (IBAction)OpenFanCard:(id)sender {
   self.sidePanelController.centerPanel = [[UINavigationController alloc] initWithRootViewController:[[FVFanCardViewController alloc] init]];

}

#pragma mark -
#pragma mark Api FACEBOOK methods
- (void) profileReceived:(FacebookUser*) user_{
               [[self BTFacebookLogin] setHidden:YES];
    [[self ViewFanHeader]setHidden:NO];
    
    self.lblName.text = user_.name;
    self.profileImg.profileID = user_.id;

    
}

- (void) sessionOpenedWithNoSuccess{}

- (void) sessionOpenedWithSuccess{
    
    [self.delegate.fbManager populateAllUserDetails:self];
    
}

- (void) writePermissionsAuthorized{}

- (void) sharedWithSuccess{}

- (void) sharedWithoutSuccess{}
@end
