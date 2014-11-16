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
@property (nonatomic, strong) NSString *votes;
@property (nonatomic, strong) NSString *answers;
@property (nonatomic, strong) NSString *questionURL;

- (instancetype)initWithTitle: (NSString *)title body: (NSString *)body tags: (NSArray *)tags votes: (NSString *)votes answers: (NSString *)answers questionURL: (NSString *)questionURL;
+ (NSMutableArray *)parseJsonIntoQuestions: (NSData *)rawJsonData;


@end
