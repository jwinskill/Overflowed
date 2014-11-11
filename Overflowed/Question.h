//
//  Question.h
//  Overflowed
//
//  Created by Joshua Winskill on 11/10/14.
//  Copyright (c) 2014 Joshua Winskill. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Question : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *body;
@property (nonatomic, strong) NSArray *tags;

- (Question *)initWithTitle: (NSString *) title body: (NSString *) body tags: (NSArray *) tags;
+ (NSMutableArray *)parseJsonIntoQuestions: (NSData *)rawJsonData;


@end
