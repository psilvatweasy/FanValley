//
//  FVLoginViewController.m
//  FanValley
//
//  Created by Pedro Silva on 16/07/13.
//  Copyright (c) 2013 Named. All rights reserved.
//

#import "FVLoginViewController.h"
#import "FVHttpClient.h"
#import "FVAppDelegate.h"
#import "FVTourViewController.h"

@interface FVLoginViewController ()
@property (nonatomic, strong) FVAppDelegate *delegate;
@property (nonatomic) bool showAppTour;

@end

@implementation FVLoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    [self.activityIndicator startAnimating];
    self.btLoginFacebook.hidden = YES;
    self.showAppTour = NO;
    
    self.delegate  = (FVAppDelegate *) [[UIApplication sharedApplication] delegate];

}

-(void) viewDidAppear:(BOOL)animated{
    FVHttpClient *req = [[FVHttpClient alloc] initWithCallback:self];
    [req registerDevice];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

- (IBAction)LoginWithFacebook:(id)sender {
    
     [self.delegate.fbManager openNewSession:self allowLoginUI:YES requestUserID:YES];
    
}

- (void) closeViewController{
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark -
#pragma mark HTTP RECEIVER Protocol methods
- (void) dataReceived:(NSString*)data callbackCode:(int) code{
    switch (code) {
        case FANVALLEY_RESPONSE_CALLBACK_REGISTER:
            
            if ([[NSUserDefaults standardUserDefaults] boolForKey:HAS_LAUNCH_ONCE])
            {
                self.showAppTour = NO;
            }
            else
            {
                [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"HasLaunchedOnce"];
                self.showAppTour = YES;
                
                
            }

            
            [self.activityIndicator stopAnimating];
            if ([self.delegate.fbManager openNewSession:nil allowLoginUI:NO requestUserID:NO]) {
                if (self.showAppTour) {
                    self.showAppTour = NO;
                    FVTourViewController *tour = [[FVTourViewController alloc] init];
                    tour.parentViewController = self;
                    [self.view addSubview:tour.view];
                    
                }else{
                    [self dismissViewControllerAnimated:YES completion:nil];
                }
            

            }else{
                self.btLoginFacebook.hidden = NO;
            }

            break;
            
        default:
            break;
    }

}
- (void) dataReceived:(NSString*)data withObject:(id)object callbackCode:(int) code{}
- (void) dataReceivedWithData:(NSData*)data callbackCode:(int) code{}
- (void) dataNotReceivedCauseWrongTime{}
- (void) dataFailed:(NSError*)error callbackCode:(int)code;{
    UIAlertView *alert;
    switch (code) {
        case FANVALLEY_RESPONSE_CALLBACK_REGISTER:
            alert = [[UIAlertView alloc]
                                  initWithTitle:NSLocalizedString(@"register_request_fail",@"register_request_fail")
                                  message:NSLocalizedString(@"register_request_fail",@"register_request_fail")
                                  delegate:self
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles:nil];
            [alert show];
            
            if ([[NSUserDefaults standardUserDefaults] boolForKey:HAS_LAUNCH_ONCE])
            {
                [self.activityIndicator stopAnimating];
                if ([self.delegate.fbManager openNewSession:nil allowLoginUI:NO requestUserID:NO]) {
                    [self dismissViewControllerAnimated:YES completion:nil];

                }else{
                    self.btLoginFacebook.hidden = NO;
                }
            }
            break;
            
        default:
            break;
    }

}


#pragma mark -
#pragma mark Api FACEBOOK methods
- (void) profileReceived:(FacebookUser*) user_{
    
}

- (void) sessionOpenedWithNoSuccess{}

- (void) sessionOpenedWithSuccess{
    
    if (self.showAppTour) {
        self.showAppTour = NO;
        FVTourViewController *tour = [[FVTourViewController alloc] init];
        tour.parentViewController = self;
        [self.view addSubview:tour.view];
        
    }else{
        [self dismissViewControllerAnimated:YES completion:nil];
    }

    
}

- (void) writePermissionsAuthorized{}

- (void) sharedWithSuccess{}

- (void) sharedWithoutSuccess{}
@end
