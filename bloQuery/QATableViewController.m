//
//  QATableViewController.m
//  bloQuery
//
//  Created by rick m on 7/29/15.
//  Copyright (c) 2015 Bloc. All rights reserved.
//

#import "QATableViewController.h"
#import "AddAnswerViewController.h"
#import "QATableViewCell.h"

@interface QATableViewController ()

@property (nonatomic, strong) NSMutableArray *infoArray;
@property (nonatomic, strong) NSArray *theAnswers;

@end

@implementation QATableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[QATableViewCell class] forCellReuseIdentifier:@"Cell"];
    
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        self.infoArray = [NSMutableArray array];
        
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    PFRelation *relation = [self.query relationForKey:@"answers"];
    PFQuery *findOut = [relation query];
    [findOut findObjectsInBackgroundWithBlock:^(NSArray *results, NSError *error) {
        if (!error) {
            self.theAnswers = results;
            [self.tableView reloadData];
            NSLog(@"Retrieved %d answers", self.theAnswers.count);

        } else {
            // whatever
        }
        
        // results contain all answers to question
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return self.theAnswers.count + 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    QATableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    if (indexPath.row == 0) {
        cell.textLabel.text = [self.query objectForKey:@"questionText"];
    } else {
        PFObject *finalAnswer = [self.theAnswers objectAtIndex:indexPath.row -1];
        cell.textLabel.text = [finalAnswer objectForKey:@"answerText"];
    }
    
    return cell;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"addAnswer"]) {
        AddAnswerViewController *addAnswer = (AddAnswerViewController *)segue.destinationViewController;
        addAnswer.query = self.query;
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
