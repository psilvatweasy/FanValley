//
//  FVFanCardViewController.m
//  FanValley
//
//  Created by Pedro Silva on 03/07/13.
//  Copyright (c) 2013 Named. All rights reserved.
//

#import "FVFanCardViewController.h"

@interface FVFanCardViewController ()

@end

@implementation FVFanCardViewController

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
    [self setTitle:@"Fan Card"];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
//    self.navigationController.navigationBar.frame = CGRectMake(self.navigationController.navigationBar.frame.origin.x, 0, self.navigationController.navigationBar.frame.size.width, 64);
}

@end
