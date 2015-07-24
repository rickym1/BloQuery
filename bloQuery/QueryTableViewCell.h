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

@class Media;


@interface QueryTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *customImageView;


@property (nonatomic, strong) Media *mediaItem;

@end
