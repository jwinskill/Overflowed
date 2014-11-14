//
//  SearchViewController.m
//  Overflowed
//
//  Created by Joshua Winskill on 11/10/14.
//  Copyright (c) 2014 Joshua Winskill. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()

@end

@implementation SearchViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = NO;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar; {
    [[NetworkController networkController] fetchQuestionsWithSearchTerm:self.searchBar.text completionHandler:^(NSError *error, NSMutableArray *questions) {
        if (error != nil) {
            NSLog(@"%@", error.description);
        } else {
            self.questions = questions;
            [self.searchBar resignFirstResponder];
            [self.tableView reloadData];
        }
    }];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
     return self.questions.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"CELL"];
    Question *newQuestion = self.questions[indexPath.row];
    cell.textLabel.text = newQuestion.title;
    return cell;
}



@end