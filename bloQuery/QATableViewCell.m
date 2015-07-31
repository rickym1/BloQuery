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

@property (weak, nonatomic) IBOutlet UILabel *infoLable;

@property (weak, nonatomic) IBOutlet UIImageView *profileImage;


@end

@implementation QATableViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setImage:(UIImage *)image {
    PFUser *user = [[PFUser currentUser];
    PFQuery *findImage = [PFQuery queryWithClassName:@"User"];
    [findImage getObjectInBackgroundWithId:user block:^(PFFile *superImage, NSError *error) {
        if (!error) {
            self.profileImage = superImage;
        }
    }]
                    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
