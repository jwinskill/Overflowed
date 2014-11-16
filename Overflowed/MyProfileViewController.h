//
//  MyProfileViewController.h
//  Overflowed
//
//  Created by Joshua Winskill on 11/14/14.
//  Copyright (c) 2014 Joshua Winskill. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Transitioner.h"
#import "WebViewController.h"
#import "math.h"

@interface MyProfileViewController : UIViewController

@property BOOL signedIn;
@property (strong, nonatomic) Transitioner *transitioner;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *signInButton;

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender;

@end
