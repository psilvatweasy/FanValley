//
//  FVTourViewController.h
//  FanValley
//
//  Created by Pedro Silva on 05/06/13.
//  Copyright (c) 2013 Named. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTScrollSlidingPagesController.h"

@interface FVTourViewController : UIViewController <TTSlidingPagesDataSource>

@property (nonatomic) id parentViewController;

@end
