//
//  QATableViewCell.m
//  bloQuery
//
//  Created by rick m on 7/29/15.
//  Copyright (c) 2015 Bloc. All rights reserved.
//

#import "QATableViewCell.h"
#import <Parse/Parse.h>

@interface QATableViewCell ()



@property (weak, nonatomic) IBOutlet UIImageView *profileImage;


@end

@implementation QATableViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setUser:(PFUser *)user {
    
    PFFile *file = user[@"imageFile"];
    if (file) {
        [file getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
            UIImage *image = [UIImage imageWithData:data];
            self.profileImage.image = image;
        }];
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
