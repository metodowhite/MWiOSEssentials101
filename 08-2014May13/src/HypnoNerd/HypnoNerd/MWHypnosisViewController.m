//
//  MWHypnosisViewController.m
//  HypnoNerd
//
//  Created by metodowhite on 09/05/14.
//  Copyright (c) 2014 elkraneoteach. All rights reserved.
//

#import "MWHypnosisViewController.h"
#import "MWHypnosisView.h"

@implementation MWHypnosisViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        self.tabBarItem.title = @"Hypnotize";
        self.tabBarItem.image = [UIImage imageNamed:@"HypnosisIcon"];
    }
    return self;
}

- (void)loadView {
    MWHypnosisView *backgroundView = [[MWHypnosisView alloc] init];
    self.view = backgroundView;
    
    CGRect textFieldRect = CGRectMake(40, 70, 240, 30);
    UITextField *textField = [[UITextField alloc] initWithFrame:textFieldRect];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"Hypnotize me";
    textField.returnKeyType = UIReturnKeyDone;
    
    // textField.delegate = self;
    [textField setDelegate:self];
    
    [backgroundView addSubview:textField];
}

- (void)drawHypnoticMessage:(NSString *)message {
    for (int i = 0; i < 20; i++) {
        UILabel *messageLabel = [[UILabel alloc] init];
        
        messageLabel.backgroundColor = [UIColor clearColor];
        messageLabel.textColor = [UIColor whiteColor];
        messageLabel.text = message;
        
        [messageLabel sizeToFit];
        
        int width = (int)(self.view.bounds.size.width - messageLabel.bounds.size.width);
        int x = arc4random() % width;
        
        int height = (int)(self.view.bounds.size.height - messageLabel.bounds.size.height);
        int y = arc4random() % height;
        
        CGRect frame = messageLabel.frame;
        frame.origin = CGPointMake(x, y);
        messageLabel.frame = frame;
        
        [self.view addSubview:messageLabel];
    }
}





-(BOOL)textFieldShouldReturn:(UITextField *)textField {
//    NSLog(@"%@", textField.text);
    [self drawHypnoticMessage:textField.text];
    
    textField.text = @"";
    [textField resignFirstResponder];
    return YES;
}



@end







