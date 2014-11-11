//
//  User.h
//  Overflowed
//
//  Created by Joshua Winskill on 11/10/14.
//  Copyright (c) 2014 Joshua Winskill. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSDictionary *badgeCounts;
@property (strong, nonatomic) NSString *accountID;
@property (strong, nonatomic) NSString *link;

- (instancetype)initWithName: (NSString *) name badgeCounts: (NSDictionary *) badgeCounts accountID: (NSString *) accountID link: (NSString *) link;
+ (NSMutableArray *) parseJsonIntoUsers: (NSData *)rawJsonData;


@end
