//
//  NetworkController.h
//  Overflowed
//
//  Created by Joshua Winskill on 11/10/14.
//  Copyright (c) 2014 Joshua Winskill. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Question.h"
#import "Constants.h"

@interface NetworkController : NSObject

@property (nonatomic, strong) NSURLSession *urlSession;
@property (nonatomic, strong) NSString *token;

- (void) fetchQuestionsWithSearchTerm: (NSString *)searchTerm completionHandler: (void (^)(NSError *error, NSMutableArray *questions))success;

- (void) fetchUsersWithSearchTerm: (NSString *)searchTerm completionHandler: (void (^)(NSError *error, NSMutableArray *questions))success;

+ (id) networkController;

@end
