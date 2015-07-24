//
//  LoginViewController.m
//  bloQuery
//
//  Created by rick m on 7/23/15.
//  Copyright (c) 2015 Bloc. All rights reserved.
//

#import "LoginViewController.h"
#import <Parse/Parse.h>

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.hidesBackButton = YES;
    
}
- (IBAction)loginTapped:(id)sender {
    
    PFUser *user = [PFUser user];
    user.username = self.usernameTextField.text;
    user.password = self.passwordTextField.text;
    
    [PFUser logInWithUsernameInBackground:user.username password:user.password
        block:^(PFUser *user, NSError *error) {
        if (user) {
            [self.navigationController popToRootViewControllerAnimated:YES];
        // Do stuff after successful login.
        } else {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Hey!" message:@"Your login was unsuccessful. Check your username/password and try again!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            
            [alertView show];
        // The login failed. Check error to see why.
        }
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
