//
//  FVCustomCell.m
//  FanValley
//
//  Created by Pedro Silva on 30/05/13.
//  Copyright (c) 2013 Named. All rights reserved.
//

#import "FVCustomCell.h"

@implementation FVCustomCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
