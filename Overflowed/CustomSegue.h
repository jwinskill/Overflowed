//
//  CustomSegue.h
//  Overflowed
//
//  Created by Joshua Winskill on 11/13/14.
//  Copyright (c) 2014 Joshua Winskill. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Transitioner.h"

@interface CustomSegue : UIStoryboardSegue

@property (nonatomic, strong) Transitioner *transitioner;
-(void)perform;

@end
