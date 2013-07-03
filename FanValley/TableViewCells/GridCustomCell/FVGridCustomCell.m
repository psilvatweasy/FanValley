//
//  FVGridCustomCell.m
//  FanValley
//
//  Created by Pedro Silva on 04/06/13.
//  Copyright (c) 2013 Named. All rights reserved.
//

#import "FVGridCustomCell.h"

@implementation FVGridCustomCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        UILabel *label_address = [[UILabel alloc] init];
        _lblN = label_address;
        _lblN.textColor = [UIColor blackColor];
        [_lblN setFont:[UIFont systemFontOfSize:7]];
        _lblN.lineBreakMode = NSLineBreakByWordWrapping;
        _lblN.numberOfLines = 1;
        _lblN.textAlignment = NSTextAlignmentLeft;
        _lblN.backgroundColor = [UIColor clearColor];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
