//
//  FVRightMenuViewController.h
//  FanValley
//
//  Created by Pedro Silva on 03/05/13.
//  Copyright (c) 2013 Tweasy. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FVRightMenuViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end
