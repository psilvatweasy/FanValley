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
#import "FVFanCardViewController.h"
#import "FVAppDelegate.h"

@interface FVLeftMenuViewController ()

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
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated{
    [LogManager Log_Quick:@"A"];

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

    return YES;
}

- (void)viewWillLayoutSubviews{

}

- (void)viewDidLayoutSubviews{
    [LogManager Log_Quick:@"B"];
}

- (IBAction)LoginWithFacebook:(id)sender {
        [LogManager Log_Quick:@"C"];
}

- (IBAction)OpenFanZone:(id)sender {
    self.sidePanelController.centerPanel = [[UINavigationController alloc] initWithRootViewController:[[FVFanZoneViewController alloc] init]];
}

- (IBAction)OpenFanClub:(id)sender {
    
}

- (IBAction)OpenFanCard:(id)sender {
    self.sidePanelController.centerPanel = [[UINavigationController alloc] initWithRootViewController:[[FVFanCardViewController alloc] init]];

}
@end
