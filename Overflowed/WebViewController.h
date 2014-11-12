//
//  WebViewController.h
//  Overflowed
//
//  Created by Joshua Winskill on 11/11/14.
//  Copyright (c) 2014 Joshua Winskill. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NetworkController.h"

@interface WebViewController : UIViewController <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (strong, nonatomic) NSString *publicKey;
@property (strong, nonatomic) NSString *oAuthDomain;
@property (strong, nonatomic) NSString *clientID;
@property (strong, nonatomic) NSString *oAuthURL;

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType;

- (void)instantiatePropertiesWithPublicKey:(NSString *)publicKey oAuthDomain: (NSString *) oAuthDomain clientID: (NSString *) clientID oAuthURL: (NSString *) oAuthURL;

@end
