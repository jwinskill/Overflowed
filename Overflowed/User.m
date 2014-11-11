//
//  User.m
//  Overflowed
//
//  Created by Joshua Winskill on 11/10/14.
//  Copyright (c) 2014 Joshua Winskill. All rights reserved.
//

#import "User.h"

@implementation User

- (instancetype)initWithName: (NSString *) name badgeCounts: (NSDictionary *) badgeCounts accountID: (NSString *) accountID link: (NSString *) link {
    self = [super init];
    if (self) {
        self.name = name;
        self.badgeCounts = badgeCounts;
        self.accountID = accountID;
        self.link = link;
    }
    return self;
}


+ (NSMutableArray *) parseJsonIntoUsers: (NSData *)rawJsonData {
    NSError *error = nil;
    
    
    NSMutableArray *users = [[NSMutableArray alloc] init];
    
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:rawJsonData options:0 error:&error];
    if (error != nil) {
        NSLog(@" %@", error.localizedDescription);
    } else {
        NSArray *items = jsonDictionary[@"items"];
        for (NSDictionary *object in items) {
            NSDictionary *badgeCounts = object[@"badge_counts"];
            NSString *name = object[@"display_name"];
            NSString *accountID = object[@"account_id"];
            NSString *link = object[@"link"];
            User *newUser = [[User alloc] initWithName:name badgeCounts:badgeCounts accountID:accountID link:link];
            [users addObject:newUser];
        }
    }
    if (users) {
        return users;
    } else {
        NSLog(@"no users found");
        return nil;
    }
}

@end
