//
//  QuestionViewController.m
//  bloQuery
//
//  Created by rick m on 7/25/15.
//  Copyright (c) 2015 Bloc. All rights reserved.
//

#import "QuestionViewController.h"
#import "AddAnswerViewController.h"

@interface QuestionViewController ()
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;

@end

@implementation QuestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.questionLabel.text = [self.query objectForKey:@"questionText"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"addAnswer"]) {
        AddAnswerViewController *addAnswer = (AddAnswerViewController *)segue.destinationViewController;
        addAnswer.query = self.query;
        
    }
}


@end
