//
//  NetworkController.m
//  Overflowed
//
//  Created by Joshua Winskill on 11/10/14.
//  Copyright (c) 2014 Joshua Winskill. All rights reserved.
//

#import "NetworkController.h"

@implementation NetworkController

# pragma mark - Fetch Methods

- (void) fetchQuestionsWithSearchTerm: (NSString *)searchTerm completionHandler: (void (^)(NSError *, NSMutableArray *))success {
    
    NSString *urlString = [NSString stringWithFormat:@"https://api.stackexchange.com/2.2/search?order=desc&sort=activity&tagged=%@&site=stackoverflow", searchTerm];
    
    NSString *authKey = [[NSUserDefaults standardUserDefaults] valueForKey:@"OAuthToken"];
    if (authKey) {
        NSLog(@"%@", authKey);
        NSString *authParameter = [NSString stringWithFormat: @"&access_token=%@", authKey];
        NSLog(@"the auth parameter is: %@", authParameter);
        NSString *publicKeyParameter = [NSString stringWithFormat: @"&key=%@", kPublicKey];
        NSString *bothParameters = [authParameter stringByAppendingString:publicKeyParameter];
        NSLog(@"Both parameters: %@", bothParameters);
        urlString = [urlString stringByAppendingString:bothParameters];
        NSLog(@"final URL string: %@", urlString);
    }
    
    NSURL *url = [[NSURL alloc] initWithString: urlString];
                  
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    self.urlSession = [NSURLSession sessionWithConfiguration:configuration];
    
    NSURLSessionDataTask *dataTask = [self.urlSession dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error != 0) {
            NSLog(@"%@", error.description);
        } else {
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
            if (httpResponse.statusCode == 200) {
                NSLog(@"fetch successful");
                NSMutableArray *questions = [Question parseJsonIntoQuestions:data];
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    success(nil, questions);
                }];
            } else {
                NSLog(@"fetch was unsuccessful. code: %lu", httpResponse.statusCode);
            }
        }
    }];
    [dataTask resume];
}

- (void) fetchUsersWithSearchTerm: (NSString *)searchTerm completionHandler: (void (^)(NSError *error, NSMutableArray *questions))success {
    
    NSURL *url = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"https://api.stackexchange.com/2.2/users?order=desc&sort=reputation&inname=%@&site=stackoverflow", searchTerm]];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    self.urlSession = [NSURLSession sessionWithConfiguration:configuration];
    
    NSURLSessionDataTask *dataTask = [self.urlSession dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error != 0) {
            NSLog(@"%@", error.description);
        } else {
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
            if (httpResponse.statusCode == 200) {
                NSLog(@"fetch successful");
                NSMutableArray *questions = [Question parseJsonIntoQuestions:data];
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    success(nil, questions);
                }];
            } else {
                NSLog(@"fetch was unsuccessful. code: %lu", httpResponse.statusCode);
            }
        }
    }];
    [dataTask resume];
}

#pragma mark - Singletons

+ (id) networkController {
    static NetworkController *networkController = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        networkController = [[self alloc] init];
    });
    return networkController;
}

                                    

                                      

@end
