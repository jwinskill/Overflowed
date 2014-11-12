//
//  Question.m
//  Overflowed
//
//  Created by Joshua Winskill on 11/10/14.
//  Copyright (c) 2014 Joshua Winskill. All rights reserved.
//

#import "Question.h"

@implementation Question

- (instancetype)initWithTitle: (NSString *) title body: (NSString *) body tags: (NSArray *) tags {
    self = [super init];
    if (self) {
        self.title = title;
        self.body = body;
        self.tags = tags;
    }
    return self;
}

+ (NSMutableArray *)parseJsonIntoQuestions: (NSData *)rawJsonData {
    NSError *error = nil;
    if (error != nil) {
        NSLog(@" %@", error.localizedDescription);
    }
    
    NSMutableArray *questions = [[NSMutableArray alloc] init];
    
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:rawJsonData options:0 error:&error];
    NSArray *items = jsonDictionary[@"items"];
    for (NSDictionary *object in items) {
        NSArray *tags = object[@"tags"];
        NSString *title = object[@"title"];
        NSString *body = @"";
        Question *newQuestion = [[Question alloc] initWithTitle:title body:body tags:tags];
        [questions addObject:newQuestion];
    }
    return questions;
}

@end
