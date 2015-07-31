//
//  ProfileViewController.m
//  bloQuery
//
//  Created by rick m on 7/30/15.
//  Copyright (c) 2015 Bloc. All rights reserved.
//

#import "ProfileViewController.h"
#import <Parse/Parse.h>

@interface ProfileViewController ()
@property (weak, nonatomic) IBOutlet UITextField *profileTextField;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)getImage:(id)sender {
    
    UIImagePickerController *imgPicker = [[UIImagePickerController alloc] init];
    imgPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imgPicker.delegate = self;
    [self.navigationController presentModalViewController:imgPicker animated:YES];
    
}



- (IBAction)saveToProfile:(id)sender {
    
    if (self.profileTextField.text == nil) {
        // nothing
    } else {
        PFUser *user = [PFUser currentUser];
        [user setObject:self.profileTextField.text forKey:@"descriptionText"];
        [user saveInBackground];
    }
    
    if (myimage == nil) {
        //nothing
    } else {
        NSData *data = UIImagePNGRepresentation(chicken.png, 0.5f);
        PFFile *imageFile = [PFFile fileWithName:@"img" data:data];
        [imageFile saveInBackground];
        
        PFUser *user = [PFUser currentUser];
        [user setObject:imageFile forKey:@"imageFile"];
        [self.navigationController popViewControllerAnimated:YES];
    }
    
    
    
    
}

- (IBAction)logOut:(id)sender {
    
    [PFUser logOut];
    [self performSegueWithIdentifier:@"returnLogin" sender:self];
    
}

@end
