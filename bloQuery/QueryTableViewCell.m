//
//  QueryTableViewCell.m
//  bloQuery
//
//  Created by rick m on 7/23/15.
//  Copyright (c) 2015 Bloc. All rights reserved.
//

#import "QueryTableViewCell.h"
#import <Parse/Parse.h>

@interface PFTableViewCell ()

@property (nonatomic, assign) UITableViewCellStyle style;
@property (nonatomic, strong) UIImageView *customImageView;

@end

@implementation QueryTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.customImageView = [[UIImageView alloc] init];
        
        for (UIView *view in self.customImageView) {
            [self.contentView addSubview:view];
        }
    }
    
    return self;
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
