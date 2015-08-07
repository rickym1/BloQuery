//
//  ViewAnswerViewController.m
//  bloQuery
//
//  Created by rick m on 8/6/15.
//  Copyright (c) 2015 Bloc. All rights reserved.
//

#import "ViewAnswerViewController.h"

@interface ViewAnswerViewController ()
@property (weak, nonatomic) IBOutlet UILabel *viewAnswerLabel;
@property (assign, nonatomic) BOOL hasLiked;

@end

@implementation ViewAnswerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    
    NSString *superAnswer = [self.answer objectForKey:@"answerText"];
    self.viewAnswerLabel.text = superAnswer;
    
}
- (IBAction)answerLikeButton:(id)sender {
    
    if (!self.hasLiked) {
    
        [self.answer incrementKey:@"likeCount"];
        [self.answer saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error){
            if (succeeded) {
                NSLog(@"Like count incremented");
            } else {
                NSLog(@"error");
            }
        }];
    
    } else {
        
        [self.answer incrementKey:@"likeCount" byAmount:@(-1)];
        [self.answer saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error){
            if (succeeded) {
                NSLog(@"Like count decremented");
            } else {
                NSLog(@"error");
            }
        }];

        
    }
    self.hasLiked = !self.hasLiked;
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
