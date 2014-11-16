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
    
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:true];
    self.transitioner = [[Transitioner alloc] init];
    if ([[NSUserDefaults standardUserDefaults] valueForKey:@"OAuthToken"]) {
        self.signInButton.title = @"";
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"WEBVIEW_SEGUE"]) {
        WebViewController *destinationVC = segue.destinationViewController;
        self.transitioner.rotatePointY = self.view.frame.size.height;
        self.transitioner.rotateAngleIn = M_PI / 2;
        self.transitioner.rotateAngleOut = M_PI / 2;
        destinationVC.transitioningDelegate = self.transitioner;
    }
}

@end
