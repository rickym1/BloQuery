//
//  InBoxTableViewController.m
//  bloQuery
//
//  Created by rick m on 7/22/15.
//  Copyright (c) 2015 Bloc. All rights reserved.
//

#import "InBoxTableViewController.h"
#import "QueryTableViewCell.h"
#import "QuestionViewController.h"


@interface InBoxTableViewController ()

@property (nonatomic, strong) NSMutableArray *questionsArray;
@property (nonatomic, strong) NSArray *questions;

@end

@implementation InBoxTableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self performSegueWithIdentifier:@"showLogin" sender:self];
    
    [self.navigationItem setHidesBackButton:YES animated:YES];
    
    [self.tableView registerClass:[QueryTableViewCell class] forCellReuseIdentifier:@"Cell"];
    
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        self.questionsArray = [NSMutableArray array];
        
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Question"];
    [query whereKey:@"author" equalTo:[PFUser currentUser]];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        
        if (!error) {
            
            self.questions = objects;
            [self.tableView reloadData];
            NSLog(@"Retrieved %d questions", self.questions.count);
            
        } else {
            // Maybe add later
        }
        
    }];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return self.questions.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    QueryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    PFObject *question = [self.questions objectAtIndex:indexPath.row];
    cell.textLabel.text = [question objectForKey:@"questionText"];
    
    self.selectedQuestion = cell.textLabel.text;
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cell = @"showQuestion";
    [self performSegueWithIdentifier:cell sender:self];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showQuestion"]) {
        QuestionViewController *questionViewController = (QuestionViewController *)segue.destinationViewController;
        questionViewController.query = self.selectedQuestion;

    }
    
}


- (IBAction)logout:(id)sender {
    [PFUser logOut];
    [self performSegueWithIdentifier:@"showLogin" sender:self];
}
@end
