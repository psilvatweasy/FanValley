//
//  FVFanCardViewController.h
//  FanValley
//
//  Created by Pedro Silva on 03/05/13.
//  Copyright (c) 2013 _to_be_named_. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface FVFanClubViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) IBOutlet UITableView *table;
@property (strong, nonatomic) IBOutlet UICollectionView *grid;

@property (weak, nonatomic) IBOutlet UIView *v;
@property (weak, nonatomic) IBOutlet UIView *sponsorView;

@property (weak, nonatomic) IBOutlet UIView *flipView;

- (IBAction)change:(id)sender;
- (IBAction)change2:(id)sender;
- (IBAction)change3:(id)sender;

@end
