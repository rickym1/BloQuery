//
//  AddAnswerViewController.m
//  bloQuery
//
//  Created by rick m on 7/26/15.
//  Copyright (c) 2015 Bloc. All rights reserved.
//

#import "AddAnswerViewController.h"
#import <Parse/Parse.h>
#import <PFObject+Subclass.h>

@interface AddAnswerViewController ()
@property (weak, nonatomic) IBOutlet UITextView *answerTextField;

@end

@implementation AddAnswerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)submitTapped:(id)sender {
    
    
    
    PFObject *answer = [PFObject objectWithClassName:@"Answer"];
    [answer setObject:self.answerTextField.text forKey:@"answerText"];
    [answer setObject:[PFUser currentUser] forKey:@"author"];
    
    [answer save];
    
    PFRelation *relation = [self.query relationForKey:@"answers"];
    [relation addObject:answer];
    
    [self.query saveInBackground];
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
    
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
