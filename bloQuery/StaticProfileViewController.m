//
//  StaticProfileViewController.m
//  bloQuery
//
//  Created by rick m on 8/3/15.
//  Copyright (c) 2015 Bloc. All rights reserved.
//

#import "StaticProfileViewController.h"
#import <Parse/Parse.h>

@interface StaticProfileViewController ()
@property (weak, nonatomic) IBOutlet UILabel *profileNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *profileDescriptionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;

@end

@implementation StaticProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setUser:(PFUser *)user {
    
    user = self.carriedUser;

    PFFile *file = user[@"imageFile"];
    if (file) {
        [file getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
            UIImage *image = [UIImage imageWithData:data];
            self.profileImageView.image = image;
            NSLog(@"image found");
        }];
    }
    
    self.profileNameLabel.text = user[@"username"];
    self.profileDescriptionLabel.text = user[@"username"];
    
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
