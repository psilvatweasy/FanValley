//
//  FVTourViewController.m
//  FanValley
//
//  Created by Pedro Silva on 05/06/13.
//  Copyright (c) 2013 Named. All rights reserved.
//

#import "FVTourViewController.h"
#import "TTSlidingPage.h"
#import "TTSlidingPageTitle.h"

#import "FVAppDelegate.h"

@interface FVTourViewController ()

@end

@implementation FVTourViewController

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
    
    TTScrollSlidingPagesController *slider = [[TTScrollSlidingPagesController alloc] init];
    [slider setTitleScrollerHidden:YES];
    slider.dataSource = self; /*the current view controller (self) conforms to the TTSlidingPagesDataSource protocol)*/
    //slider.view.frame = self.view.frame; //I'm setting up the view to be fullscreen in the current view
    [self.view addSubview:slider.view];
    [self addChildViewController:slider];
    
//    UIButton *bt = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [bt addTarget:self
//           action:@selector(exitTour:)
// forControlEvents:UIControlEventTouchDown];
//    [bt setTitle:@"Exit" forState:UIControlStateNormal];
//    
//    bt.frame = CGRectMake(50.0, 50.0, 100.0, 100.0);
//    
//    [self.view addSubview:bt];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(int)numberOfPagesForSlidingPagesViewController:(TTScrollSlidingPagesController *)source{
    return 5;
    
}

-(TTSlidingPage *)pageForSlidingPagesViewController:(TTScrollSlidingPagesController *)source atIndex:(int)index{
    UIViewController *viewController = [[UIViewController alloc] init];
    UIImageView *img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cenas.JPG"]];
    img.frame = CGRectMake(0, 0, viewController.view.frame.size.width, viewController.view.frame.size.height);

    [viewController.view addSubview:img];
    if (index == 4) {
        UIButton *bt = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [bt addTarget:self
                   action:@selector(exitTour:)
         forControlEvents:UIControlEventTouchDown];
        [bt setTitle:@"Exit" forState:UIControlStateNormal];
        bt.frame = CGRectMake(50.0, 50.0, 100.0, 100.0);

        [viewController.view addSubview:bt];
    }
    return [[TTSlidingPage alloc] initWithContentViewController:viewController];
}

-(TTSlidingPageTitle *)titleForSlidingPagesViewController:(TTScrollSlidingPagesController *)source atIndex:(int)index{
    TTSlidingPageTitle *title;
    if (index == 0){ //for the first page, have an image, for all other pages use text
        //use a image as the header for the first page
        title= [[TTSlidingPageTitle alloc] initWithHeaderImage:[UIImage imageNamed:@"randomImage.png"]];
    } else {
        //all other pages just use a simple text header
        title = [[TTSlidingPageTitle alloc] initWithHeaderText:@"A page"]; //in reality you would have the correct header text for your page number given by "index"
    }
    return title;
}


- (void) exitTour:(UIButton *)sender{
    FVAppDelegate *delegate = (FVAppDelegate *) [[UIApplication sharedApplication] delegate];
    [delegate quitTourAndStartApp];

}


@end
