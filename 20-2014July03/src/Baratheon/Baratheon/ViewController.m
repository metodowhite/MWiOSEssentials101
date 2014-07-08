//
//  ViewController.m
//  Baratheon
//
//  Created by metodowhite on 03/07/14.
//  Copyright (c) 2014 metodowhite. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
            
@property (weak, nonatomic) IBOutlet UITextField *urlField;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
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

@end












