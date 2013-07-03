//
//  FVFanZoneViewController.m
//  FanValley
//
//  Created by Pedro Silva on 05/06/13.
//  Copyright (c) 2013 Named. All rights reserved.
//

#import "FVFanZoneViewController.h"

@interface FVFanZoneViewController ()

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{

    self.navigationController.navigationBar.frame = CGRectMake(self.navigationController.navigationBar.frame.origin.x, 0, self.navigationController.navigationBar.frame.size.width, 64);
}

-(void)viewDidAppear:(BOOL)animated{
    [LogManager Log_Quick:@"Y --> %f", self.navigationController.navigationBar.frame.origin.y];
    [LogManager Log_Quick:@"Height --> %f", self.navigationController.navigationBar.frame.size.height];
    [LogManager Log_Quick:@"-----\n"];
    
    
}

@end
