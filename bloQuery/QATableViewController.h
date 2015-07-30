//
//  QATableViewController.h
//  bloQuery
//
//  Created by rick m on 7/29/15.
//  Copyright (c) 2015 Bloc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface QATableViewController : UITableViewController

@property (nonatomic, strong) PFObject *query;

@end
