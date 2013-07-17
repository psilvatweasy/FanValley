//
//  FVFanZoneViewController.m
//  FanValley
//
//  Created by Pedro Silva on 05/06/13.
//  Copyright (c) 2013 Named. All rights reserved.
//

#import "FVFanZoneViewController.h"
#import "FVAppDelegate.h"
#import "FVFanClubListLoggedOutViewController.h"

@interface FVFanZoneViewController ()
@property (nonatomic, strong) FVAppDelegate *delegate;
@end

@implementation FVFanZoneViewController

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
    [self setTitle:@"Fan Zone"];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{

    //[req searchClubs:@"" Country:@"" Sport:@""];
}

-(void)viewDidAppear:(BOOL)animated{
//    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
//    [tracker sendView:@"Fan Zone"];
}

- (IBAction)OpenMyFanClubsList:(id)sender {
    if ([self.delegate.fbManager openNewSession:nil allowLoginUI:NO requestUserID:NO]) {
    
    }else{
    
        [self.navigationController pushViewController:[[FVFanClubListLoggedOutViewController alloc] init] animated:YES];
    }
    
}

- (IBAction)OpenSearchClubView:(id)sender {
    [self.navigationController pushViewController:[[FVFanClubListLoggedOutViewController alloc] init] animated:YES];
}

- (IBAction)OpenShareView:(id)sender {
}

#pragma mark -
#pragma mark HTTP RECEIVER Protocol methods
- (void) dataReceived:(NSString*)data callbackCode:(int) code{}
- (void) dataReceived:(NSString*)data withObject:(id)object callbackCode:(int) code{}
- (void) dataReceivedWithData:(NSData*)data callbackCode:(int) code{}
- (void) dataNotReceivedCauseWrongTime{}
- (void) dataFailed:(NSError*)error callbackCode:(int)code;{}

@end
