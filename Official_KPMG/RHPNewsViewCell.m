//
//  RHPEventsViewCell.m
//  KPMG
//
//  Created by Richard Phillips on 12/3/14.
//  Copyright (c) 2014 Richard Phillips. All rights reserved.
//

#import "RHPNewsViewCell.h"

@implementation RHPNewsViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
