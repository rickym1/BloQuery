//
//  ProfileViewController.m
//  bloQuery
//
//  Created by rick m on 7/30/15.
//  Copyright (c) 2015 Bloc. All rights reserved.
//

#import "ProfileViewController.h"
#import <Parse/Parse.h>

@interface ProfileViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *profileTextField;
@property (nonatomic, strong) UIImage *imgToUpload;
@property (weak, nonatomic) IBOutlet UIImageView *viewImage;

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
    [self presentViewController:imgPicker animated:YES completion:nil];
    
}

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo {
    
    [picker dismissModalViewControllerAnimated:YES];
    self.viewImage.image = image;
    self.imgToUpload = image;
    
}



- (IBAction)saveToProfile:(id)sender {
    
    if (self.profileTextField.text == nil) {
        // nothing
    } else {
        PFUser *user = [PFUser currentUser];
        [user setObject:self.profileTextField.text forKey:@"descriptionText"];
        [user saveInBackground];
    }
    
    if (self.imgToUpload == nil) {
        //nothing
    } else {
        NSData *data = UIImageJPEGRepresentation(self.imgToUpload, 0.3);
        PFFile *imageFile = [PFFile fileWithName:@"img" data:data];
        [imageFile saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error){
            if (succeeded) {
                NSLog(@"image uploaded");
                PFUser *user = [PFUser currentUser];
                [user setObject:imageFile forKey:@"imageFile"];
                [user saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error){
                    if (succeeded) {
                        NSLog(@"saved to imageFile");
                    } else {
                        NSLog(@"not saved to imageFile");
                    }
                }];
            } else {
                NSLog(@"image upload didn't work");
            }
        }];
        
        
        
        
    }
    [self.navigationController popViewControllerAnimated:YES];
    
    
    
}

- (IBAction)logOut:(id)sender {
    
    [PFUser logOut];
    [self performSegueWithIdentifier:@"returnLogin" sender:self];
    
}

@end
