//
//  BaseViewController.h
//  Overflowed
//
//  Created by Joshua Winskill on 11/12/14.
//  Copyright (c) 2014 Joshua Winskill. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Transitioner.h"
#import "SearchViewController.h"
#import "UsersViewController.h"
#import "MyProfileViewController.h"
#import "math.h"

@interface BaseViewController : UIViewController

@property (nonatomic, strong) Transitioner *transitioner;

- (IBAction)unwindToBaseController:(UIStoryboardSegue *)sender;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender;

@end
