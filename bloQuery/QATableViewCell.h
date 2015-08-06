//
//  QATableViewCell.h
//  bloQuery
//
//  Created by rick m on 7/29/15.
//  Copyright (c) 2015 Bloc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "QATableViewController.h"


@protocol MoveToStaticDelegate <NSObject>;

@optional
-(void)cell:(MoveToStaticDelegate *)static didSelectProfile:(NSString *)view;

@end

@interface QATableViewCell : UITableViewCell <UIGestureRecognizerDelegate, MoveToStaticDelegate>

@property (weak, nonatomic) id <MoveToStaticDelegate> delegate;

@property (weak, nonatomic) IBOutlet UILabel *infoLable;
@property (strong, nonatomic) PFUser *cellUser;


-(void)setUser:(PFUser *)user;





@end
