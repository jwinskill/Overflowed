//
//  Question.m
//  Overflowed
//
//  Created by Joshua Winskill on 11/10/14.
//  Copyright (c) 2014 Joshua Winskill. All rights reserved.
//

#import "Question.h"

@implementation Question

- (instancetype)initWithTitle: (NSString *)title body: (NSString *)body tags: (NSArray *)tags votes: (NSString *)votes answers: (NSString *)answers questionURL: (NSString *)questionURL {
    self = [super init];
    if (self) {
        self.title = title;
        self.body = body;
        self.tags = tags;
        self.votes = votes;
        self.answers = answers;
        self.questionURL = questionURL;
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
        id votesInt = object[@"score"];
        NSString *votes = [NSString stringWithFormat:@"%@", votesInt];
        id answersInt = object[@"answer_count"];
        NSString *answers = [NSString stringWithFormat:@"%@", answersInt];
        NSString *questionURL = object[@"link"];
        Question *newQuestion = [[Question alloc] initWithTitle:title body:body tags:tags votes:votes answers:answers questionURL:questionURL];
        [questions addObject:newQuestion];
    }
    return questions;
}

@end
