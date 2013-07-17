//
//  FVRightMenuViewController.m
//  FanValley
//
//  Created by Pedro Silva on 03/05/13.
//  Copyright (c) 2013 Tweasy. All rights reserved.
//

#import "FVRightMenuViewController.h"
#import "UIViewController+JASidePanel.h"
#import "FVCustomCell.h"
#import "FVNotificationViewController.h"
#import "FVAppDelegate.h"



@interface FVRightMenuViewController ()

@property (nonatomic, strong) FVAppDelegate *delegate;
@property (nonatomic, strong) FVNotificationViewController *notView;
@property (nonatomic) int index;

@end

@implementation FVRightMenuViewController

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
    self.index = 100;
    self.delegate  = (FVAppDelegate *) [[UIApplication sharedApplication] delegate];

    // Do any additional setup after loading the view from its nib.
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.index;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = (FVCustomCell *)[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        
        cell = (FVCustomCell *)[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle  reuseIdentifier:@"Cell"];
        
    }
    cell.textLabel.text = [NSString stringWithFormat:@"Row %i", indexPath.row+1];
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.notView = [[FVNotificationViewController alloc] init];
    self.notView .view.frame = CGRectMake(self.notView .view.frame.origin.x,self.view.frame.size.height , self.notView .view.frame.size.width, self.notView .view.frame.size.height);
    [self.delegate.window addSubview:self.notView .view];
    
    [UIView beginAnimations:@"OpenNotificationView" context:nil];
    [UIView setAnimationDuration:1];
    
    
    self.notView.view.frame = CGRectMake(self.notView .view.frame.origin.x, 0, self.notView .view.frame.size.width, self.notView .view.frame.size.height);
    
    [UIView commitAnimations];
    
    
//    [self.sidePanelController.centerPanel presentViewController:[[FVNotificationViewController alloc] init] animated:YES completion:^(void){}];

 //[self.sidePanelController toggleRightPanel:self];
    
    
}



@end
