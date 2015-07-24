//
//  InBoxTableViewController.m
//  bloQuery
//
//  Created by rick m on 7/22/15.
//  Copyright (c) 2015 Bloc. All rights reserved.
//

#import "InBoxTableViewController.h"
#import <Parse/Parse.h>

@interface InBoxTableViewController ()

@end

@implementation InBoxTableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self performSegueWithIdentifier:@"showLogin" sender:self];
    
    [self.navigationItem setHidesBackButton:YES animated:YES];
    
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)logout:(id)sender {
    [PFUser logOut];
    [self performSegueWithIdentifier:@"showLogin" sender:self];
}
@end
