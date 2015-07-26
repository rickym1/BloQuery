//
//  InBoxTableViewController.h
//  bloQuery
//
//  Created by rick m on 7/22/15.
//  Copyright (c) 2015 Bloc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface InBoxTableViewController : UITableViewController
- (IBAction)logout:(id)sender;

@property (nonatomic, strong) NSString *selectedQuestion;

@end
