//
//  CreateQuestionViewController.m
//  bloQuery
//
//  Created by rick m on 7/24/15.
//  Copyright (c) 2015 Bloc. All rights reserved.
//

#import "CreateQuestionViewController.h"
#import <Parse/Parse.h>
#import <PFObject+Subclass.h>

@interface CreateQuestionViewController ()
@property (weak, nonatomic) IBOutlet UITextView *queryTextField;

@end

@implementation CreateQuestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveTapped:(id)sender {
    
    PFObject *question = [PFObject objectWithClassName:@"Question"];
    question[@"questionText"] = self.queryTextField.text;
    
    [question saveEventually];
    
}


@end
