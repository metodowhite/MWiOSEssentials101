//
//  ViewController.m
//  Baratheon
//
//  Created by metodowhite on 03/07/14.
//  Copyright (c) 2014 metodowhite. All rights reserved.
//

#import "ViewController.h"

#import <Bitlyzer/Bitlyzer.h>
#import <UIAlertView+Blocks/UIAlertView+Blocks.h>

@interface ViewController () <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *urlField;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (nonatomic) NSString *tyrionURL;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView.delegate = self;
    //    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"] isDirectory:NO]]];
    
    //    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"export" ofType:@"pdf"] isDirectory:NO]]];
    
    NSString *filename = [[NSBundle mainBundle] pathForResource:@"export" ofType:@"pdf"];
    NSURL *url = [NSURL fileURLWithPath:filename isDirectory:NO];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loadLocation:(id)sender {
    NSString *urlText = self.urlField.text;
    
    if (![urlText hasPrefix:@"http:"] && ![urlText hasPrefix:@"https:"]) {
        if (![urlText hasPrefix:@"//"]) {
            urlText = [@"//"stringByAppendingString:urlText];
            urlText = [@"http:"stringByAppendingString:urlText];
        }
    }
    
    NSURL *url = [NSURL URLWithString:urlText];
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
}

- (IBAction)shareURL:(id)sender {
    NSURL *url = [NSURL URLWithString:self.urlField.text];
    
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[url] applicationActivities:nil];
    
    [self presentViewController:activityViewController animated:YES completion:nil];
    
}

- (IBAction)shortify:(id)sender {
    Bitlyzer *bitlyzer = [[Bitlyzer alloc] initWithAPIKey:@"R_0d2ee30de47c0e4145a078a4463570d2"
                                                 username:@"elkraneo"];
    
    [bitlyzer shortURL:self.urlField.text succeeded:^(NSString *urlToShorten, NSString *shortenedURL) {
        
        self.tyrionURL = shortenedURL;
        
        //        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Great"
        //                                                            message:_tyrionURL
        //                                                           delegate:self
        //                                                  cancelButtonTitle:@"OK, copy to my clipboard"
        //                                                  otherButtonTitles:nil];
        //        [alertView show];
        
        [UIAlertView showWithTitle:@"Great"
                           message:_tyrionURL
                 cancelButtonTitle:@"OK, copy to my clipboard"
                 otherButtonTitles:nil
                          tapBlock:^(UIAlertView *alertView, NSInteger buttonIndex) {
                              [[UIPasteboard generalPasteboard] setString:_tyrionURL];
                          }];
        
    } fail:^(NSString *urlToShorten, NSError *error) {
        //        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error"
        //                                                            message:error.userInfo[NSLocalizedDescriptionKey]
        //                                                           delegate:nil
        //                                                  cancelButtonTitle:@"OK"
        //                                                  otherButtonTitles:nil];
        //        [alertView show];
        
        [UIAlertView showWithTitle:@"Error"
                           message:error.userInfo[NSLocalizedDescriptionKey]
                 cancelButtonTitle:@"OK"
                 otherButtonTitles:nil
                          tapBlock:nil];
    }];
}

//- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
//    [[UIPasteboard generalPasteboard] setString:_tyrionURL];
//}


- (void)webViewDidFinishLoad:(UIWebView *)webView {
    self.urlField.text = _webView.request.URL.absoluteString;
}


@end












