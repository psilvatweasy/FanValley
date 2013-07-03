//
//  FVFanClubListLoggedOutViewController.m
//  FanValley
//
//  Created by Pedro Silva on 03/07/13.
//  Copyright (c) 2013 Named. All rights reserved.
//

#import "FVFanClubListLoggedOutViewController.h"
#import "FVAppDelegate.h"

@interface FVFanClubListLoggedOutViewController ()
@property (nonatomic, strong) FVAppDelegate *delegate;
@end

@implementation FVFanClubListLoggedOutViewController

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
        self.delegate  = (FVAppDelegate *) [[UIApplication sharedApplication] delegate];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)LoginWithFacebook:(id)sender {
    [self.delegate.fbManager openNewSession:self allowLoginUI:YES requestUserID:YES];
}

- (IBAction)OpenSearchClubView:(id)sender {
}

#pragma mark -
#pragma mark Api FACEBOOK methods
- (void) profileReceived:(FacebookUser*) user_{

    
    
}

- (void) sessionOpenedWithNoSuccess{}

- (void) sessionOpenedWithSuccess{
    
    [self.delegate.fbManager populateAllUserDetails:self];
    
}

- (void) writePermissionsAuthorized{}

- (void) sharedWithSuccess{}

- (void) sharedWithoutSuccess{}
@end
