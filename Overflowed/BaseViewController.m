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
    if ([segue.identifier isEqualToString:@"QUESTIONS_SEGUE"]) {
        SearchViewController *destinationVC = segue.destinationViewController;
        self.transitioner.rotatePointY = 0;
        self.transitioner.rotateAngleIn = -M_PI / 2;
        self.transitioner.rotateAngleOut = -M_PI / 2;
        destinationVC.transitioningDelegate = self.transitioner;
    } else if ([segue.identifier isEqualToString:@"MYPROFILE_SEGUE"]) {
        MyProfileViewController *destinationVC = segue.destinationViewController;
        self.transitioner.rotatePointY = self.view.frame.size.height;
        self.transitioner.rotateAngleIn = M_PI / 2;
        self.transitioner.rotateAngleOut = M_PI / 2;
        destinationVC.transitioningDelegate = self.transitioner;
    }
}

- (IBAction)unwindToBaseController:(UIStoryboardSegue *)sender {
    
}

@end
