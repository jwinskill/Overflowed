//
//  UsersViewController.m
//  Overflowed
//
//  Created by Joshua Winskill on 11/14/14.
//  Copyright (c) 2014 Joshua Winskill. All rights reserved.
//

#import "UsersViewController.h"

@interface UsersViewController ()

@end

@implementation UsersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.hidden = YES;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.users.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"USER_CELL"];
    User *userForCell = self.users[indexPath.row];
    cell.textLabel.text = userForCell.name;
    return cell;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [[NetworkController networkController] fetchUsersWithSearchTerm:self.searchBar.text completionHandler:^(NSError *error, NSMutableArray *users) {
        if (error != nil) {
            NSLog(@"%@", error.description);
        } else {
            self.users = users;
            [self.searchBar resignFirstResponder];
            self.tableView.separatorColor = [UIColor whiteColor];
            [self.tableView reloadData];
            self.tableView.hidden = NO;
        }
    }];
}

@end
