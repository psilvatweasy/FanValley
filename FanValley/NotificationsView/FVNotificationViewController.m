//
//  FVNotificationViewController.m
//  FanValley
//
//  Created by Pedro Silva on 04/07/13.
//  Copyright (c) 2013 Named. All rights reserved.
//

#import "FVNotificationViewController.h"

@interface FVNotificationViewController ()

@end

@implementation FVNotificationViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context{
    if ([animationID isEqualToString:@"CloseNotificationView"]) {
        [self.view removeFromSuperview];
        [self removeFromParentViewController];
    }
    
    
}

- (IBAction)CloseViewController:(id)sender {

    
    [UIView beginAnimations:@"CloseNotificationView" context:nil];
    [UIView setAnimationDuration:1];
    
    
    self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height);
    
    [UIView commitAnimations];
}
@end
