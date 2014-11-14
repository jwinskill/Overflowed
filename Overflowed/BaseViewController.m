//
//  BaseViewController.m
//  Overflowed
//
//  Created by Joshua Winskill on 11/12/14.
//  Copyright (c) 2014 Joshua Winskill. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.transitioner = [[Transitioner alloc] init];
    self.navigationController.navigationBarHidden = YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
        SearchViewController *destinationVC = segue.destinationViewController;
        destinationVC.transitioningDelegate = self.transitioner;
}

- (IBAction)unwindToBaseController:(UIStoryboardSegue *)sender {
    
}

@end
