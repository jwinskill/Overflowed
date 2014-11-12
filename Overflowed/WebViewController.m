//
//  WebViewController.m
//  Overflowed
//
//  Created by Joshua Winskill on 11/11/14.
//  Copyright (c) 2014 Joshua Winskill. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self instantiatePropertiesWithPublicKey:@"pevqfbhFy89t7ULJYHUoXA((" oAuthDomain:@"https://stackexchange.com/oauth/login_success" clientID:@"3833" oAuthURL:@"https://stackexchange.com/oauth/dialog"];
    
    self.webView.delegate = self;
    NSString *loginURL = [[NSString alloc] initWithFormat:@"%@?client_id=%@&redirect_uri=%@&scope=read_inbox", self.oAuthURL, self.clientID, self.oAuthDomain];
    NSURL *url = [NSURL URLWithString:loginURL];
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    if (request) {
        NSString *requestString = request.URL.description;
        NSLog(@"%@", requestString);
        
        if ([requestString containsString:@"access_token"]) {
            NSArray *components = [requestString componentsSeparatedByString:@"="];
            NSArray *tokenComponents = [components[1] componentsSeparatedByString:@"&"];
            NSLog(@"%@", tokenComponents[0]);
            NetworkController *sharedNetworkController =[NetworkController networkController];
            sharedNetworkController.token = tokenComponents[0];
            [[NSUserDefaults standardUserDefaults] setValue:sharedNetworkController.token forKey:@"OAuthToken"];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
    }
    return true;
}

- (void)instantiatePropertiesWithPublicKey:(NSString *)publicKey oAuthDomain: (NSString *) oAuthDomain clientID: (NSString *) clientID oAuthURL: (NSString *) oAuthURL {
    self.publicKey = publicKey;
    self.oAuthDomain = oAuthDomain;
    self.clientID = clientID;
    self.oAuthURL = oAuthURL;
}

@end
