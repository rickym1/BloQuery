//
//  StaticProfileViewController.h
//  bloQuery
//
//  Created by rick m on 8/3/15.
//  Copyright (c) 2015 Bloc. All rights reserved.
//

#import "ProfileViewController.h"
#import <Parse/Parse.h>

@interface StaticProfileViewController : ProfileViewController

@property (nonatomic, strong) PFUser *user;

@end
