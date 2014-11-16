//
//  MyProfileViewController.m
//  Overflowed
//
//  Created by Joshua Winskill on 11/14/14.
//  Copyright (c) 2014 Joshua Winskill. All rights reserved.
//

#import "MyProfileViewController.h"

@interface MyProfileViewController ()

@end

@implementation MyProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (!self.signedIn) {
        UILabel *label = [[UILabel alloc] init];
        label.text = @"Please sign in";
        [label setFont: [UIFont fontWithName:@"Helvetica Neue Thin" size:47]];
        
    }
}

@end
