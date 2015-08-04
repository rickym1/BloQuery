//
//  QueryTableViewCell.h
//  bloQuery
//
//  Created by rick m on 7/23/15.
//  Copyright (c) 2015 Bloc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <ParseUI/ParseUIConstants.h>
#import <ParseUI/PFTableViewCell.h>



@interface QueryTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *questionLabel;

@property (weak, nonatomic) IBOutlet UILabel *numberOfComments;
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;


@end
