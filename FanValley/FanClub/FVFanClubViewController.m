//
//  FVFanCardViewController.m
//  FanValley
//
//  Created by Pedro Silva on 03/05/13.
//  Copyright (c) 2013 _to_be_named_. All rights reserved.
//

#import "FVFanClubViewController.h"
#import "UIScrollView+APParallaxHeader.h"
#import "FVCustomCell.h"
#import "FVGridCustomCell.h"
#import "GAI.h"

@interface FVFanClubViewController ()

@property (nonatomic) int index;
@property (nonatomic) int sort;
@property (nonatomic) float lastOffsetY;


@end

@implementation FVFanClubViewController

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
    [self setTitle:@"Fan Club"];
    [self.grid registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"GridCell"];

    // Do any additional setup after loading the view from its nib.
    //[self.table addParallaxWithImage:[UIImage imageNamed:@"cenas.JPG"] andHeight:200];

    self.index = 100;
    self.sort = 0;

    [self.view addSubview:self.sponsorView];
    CGRect frame = self.sponsorView.frame;
    frame.origin.y = self.view.frame.size.height;
    self.sponsorView.frame = frame;
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setItemSize:CGSizeMake(50 ,50)];
    
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    [flowLayout setMinimumLineSpacing:10.0f];
    [flowLayout setMinimumInteritemSpacing:0.0f];
    [flowLayout setSectionInset:UIEdgeInsetsMake(15, 10, 15, 10)];
    
    self.grid = [[UICollectionView alloc] initWithFrame:CGRectMake(self.flipView.frame.origin.x, 0, self.flipView.frame.size.width, self.flipView.frame.size.height-44) collectionViewLayout:flowLayout];
    
    [self.grid setCollectionViewLayout:flowLayout];
    [self.grid registerClass:[FVGridCustomCell class] forCellWithReuseIdentifier:@"GridCell"];
    
    self.grid.backgroundColor = [UIColor clearColor];//UIColorFromRGB(0xd0e1ec);
    self.grid.delegate = self;
    self.grid.dataSource = self;
    
    self.grid.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;


}

-(void)viewWillAppear:(BOOL)animated{
    //[self.v setFrame:CGRectMake(0, 150, 320, 50)];
 //   self.navigationController.navigationBar.frame = CGRectMake(self.navigationController.navigationBar.frame.origin.x, 0, self.navigationController.navigationBar.frame.size.width, 64);
    
    [self.v setBackgroundColor: [UIColor redColor]];

    
    self.flipView.frame = CGRectMake( self.flipView.frame.origin.x,
                                  self.v.frame.origin.y+self.v.frame.size.height,
                                  self.flipView.frame.size.width,
                                  self.flipView.frame.size.height
                                  );

    self.table.frame = CGRectMake( self.table.frame.origin.x,
                                  0,
                                   self.table.frame.size.width,
                                  self.flipView.frame.size.height
                                  );
    [self.flipView addSubview:self.table];
    self.sponsorView.frame = CGRectMake( self.sponsorView.frame.origin.x,
                                  self.view.frame.size.height-self.sponsorView.frame.size.height,
                                  self.sponsorView.frame.size.width,
                                  self.sponsorView.frame.size.height
                                  );
    

}

-(void)viewDidAppear:(BOOL)animated{
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker sendView:@"Fan Card"];
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

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    self.lastOffsetY = scrollView.contentOffset.y;

}



- (void)scrollViewDidScroll:(UIScrollView *)scrollView{

    float result = self.lastOffsetY - scrollView.contentOffset.y;
    
    if (result < 0) {
        if (self.sponsorView.frame.origin.y >=  self.view.frame.size.height) {
            
        }else{
        self.sponsorView.frame = CGRectMake(self.sponsorView.frame.origin.x,self.sponsorView.frame.origin.y+2 , self.sponsorView.frame.size.width, self.sponsorView.frame.size.height);
        }
    }else if(result > 50){
        if (((self.sponsorView.frame.origin.y)<=(self.view.frame.size.height-self.sponsorView.frame.size.height
                                                 ))) {
            
        }else{
            self.sponsorView.frame = CGRectMake(self.sponsorView.frame.origin.x,self.sponsorView.frame.origin.y-2 , self.sponsorView.frame.size.width, self.sponsorView.frame.size.height);
        }
        
    }
    //CGFloat stillViewDesiredOriginY = 100;
    
    // get the table and search bar bounds
    CGRect tableBounds;
    if (self.sort == 2) {
        tableBounds = self.grid.bounds;
    }else{
        tableBounds = self.table.bounds;
    }
    CGRect frameForStillView = self.v.bounds;
    
//    [LogManager Log_Quick:@"x - %f", tableBounds.origin.x];
//    [LogManager Log_Quick:@"y - %f", tableBounds.origin.y];
//
//
//    [LogManager Log_Quick:@"Height - %f", frameForStillView.size.height];
//    [LogManager Log_Quick:@"yy - %f", frameForStillView.origin.y];

    //frameForStillView.origin.y = tableBounds.origin.y + stillViewDesiredOriginY; // offsets the rects y origin by the content offset
    //self.v.frame = frameForStillView; // set the frame to the new calculation
    
    // make sure the search bar stays at the table's original x and y as the content moves
    
    if (tableBounds.origin.y > 100) {



    }else if(tableBounds.origin.y > 0){

        self.v.frame = CGRectMake(tableBounds.origin.x,
                                  frameForStillView.origin.y-tableBounds.origin.y,
                                  frameForStillView.size.width,
                                  frameForStillView.size.height
                                  );
//        self.table.frame = CGRectMake(tableBounds.origin.x,
//                                  self.v.frame.origin.y+self.v.frame.size.height,
//                                  tableBounds.size.width,
//                                  self.view.frame.size.height-self.v.frame.size.height+115
//                                  );

        self.flipView.frame = CGRectMake(self.flipView.frame.origin.x,
                                      self.v.frame.origin.y+self.v.frame.size.height,
                                      self.flipView.frame.size.width,
                                      self.view.frame.size.height-self.v.frame.size.height+115
                                      );
    }else{
//        self.v.frame = CGRectMake(tableBounds.origin.x,
//                                  frameForStillView.origin.y - tableBounds.origin.y-frameForStillView.size.height,
//                                  frameForStillView.size.width,
//                                  frameForStillView.size.height
//                                  );

    }
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    CGRect tableBounds;
    if (self.sort == 2) {
        tableBounds = self.grid.bounds;
    }else{
        tableBounds = self.table.bounds;
    }
    
    if(tableBounds.origin.y < 100){
    
        if (self.sponsorView.frame.origin.y == (self.view.frame.size.height - self.sponsorView.frame.size.height)) {

        }else{
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:0.75];
            
            self.sponsorView.frame = CGRectMake(self.sponsorView.frame.origin.x,
                                                self.view.frame.size.height - self.sponsorView.frame.size.height,
                                                self.sponsorView.frame.size.width,
                                                self.sponsorView.frame.size.height);
            
            
            [UIView commitAnimations];
        }
        
    }else if((self.view.frame.size.height - self.sponsorView.frame.origin.y) > (self.sponsorView.frame.size.height/2)){
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.75];
        
        self.sponsorView.frame = CGRectMake(self.sponsorView.frame.origin.x,
                                            self.view.frame.size.height - self.sponsorView.frame.size.height,
                                            self.sponsorView.frame.size.width,
                                            self.sponsorView.frame.size.height);
        
        
        [UIView commitAnimations];
        
    }else{
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.75];
        
        self.sponsorView.frame = CGRectMake(self.sponsorView.frame.origin.x,
                                            self.view.frame.size.height,
                                            self.sponsorView.frame.size.width,
                                            self.sponsorView.frame.size.height);
        
        
        [UIView commitAnimations];
        
        
    }
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{

    


    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{



    
}



#pragma mark - UICollectionView Datasource
// 1
- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {

    return 100;
}
// 2
- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
    return 1;
}
// 3
- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    FVGridCustomCell *cell = (FVGridCustomCell *)[cv dequeueReusableCellWithReuseIdentifier:@"GridCell" forIndexPath:indexPath];
    
    //cell.lblN.text = [NSString stringWithFormat:@"Row %i", indexPath.row+1];
    //cell.backgroundColor = [UIColor whiteColor];
    return cell;
}
// 4
/*- (UICollectionReusableView *)collectionView:
 (UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
 {
 return [[UICollectionReusableView alloc] init];
 }*/

#pragma mark – UICollectionViewDelegateFlowLayout

// 1
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGSize retval = CGSizeMake(100, 100);
    retval.height += 35; retval.width += 35; return retval;
}

// 3
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(50, 20, 50, 20);
}

- (IBAction)change:(id)sender {
//    if (self.index == 0) {
//        self.index = 10;
//    }else if (self.index == 10){
//        self.index = 100;
//    }else if (self.index == 100){
//        self.index = 200;
//    }else if (self.index == 200){
//        self.index = 1000;
//    }else{
//        self.index = 0;
//    }
//    [self.table reloadData];
    self.sort = 0;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.75];
    
    
    
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.flipView cache:YES];

    [self.flipView addSubview:self.table];
    [self.grid removeFromSuperview];
    
    
    [UIView commitAnimations];

}

- (IBAction)change2:(id)sender {
    self.sort = 1;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.75];
    
    
    
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.flipView cache:YES];
    [self.flipView addSubview:self.table];
    [self.grid removeFromSuperview];
    
    
    
    
    [UIView commitAnimations];
    
}

- (IBAction)change3:(id)sender {
//    self.sort = 2;
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration:0.75];
//
//    
//    
//    
//    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.flipView cache:YES];
//    [self.flipView addSubview:self.grid];
//    [self.table removeFromSuperview];
//    
//    [UIView commitAnimations];
    
    [self.navigationController pushViewController:[[FVFanClubViewController alloc] init] animated:YES];
}
@end
