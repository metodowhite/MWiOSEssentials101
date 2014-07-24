//
//  ViewController.m
//  MiPrimerUIKitDynamics
//
//  Created by metodowhite on 24/07/14.
//  Copyright (c) 2014 metodowhite. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong) UIImageView *ball;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // UIImage *ballImage = [[UIImage alloc] init];
    UIImage *ballImage = [UIImage new];
    ballImage = [UIImage imageNamed:@"ball"];
    
    self.ball = [[UIImageView alloc] initWithImage:ballImage];
    // [self.ball setImage:[UIImage imageNamed:@"ball"]];
    
    // self.ball.frame = CGRectMake(self.view.frame.size.width/2 - 44.0f, 20.0f, 44.0f, 44.0f);
    self.ball.frame = CGRectMake(CGRectGetWidth(self.view.frame)/2 - 11.0f,
                                 11.0f,
                                 22.0f,
                                 22.0f);
    self.ball.alpha = 0.0f;
    [self.view addSubview:self.ball];
    
    [UIView animateWithDuration:3.0f animations:^{
        
        self.ball.frame = CGRectMake(CGRectGetWidth(self.view.frame)/2 - 22.0f,
                                     CGRectGetHeight(self.view.frame) - 44.0f,
                                     44.0f,
                                     44.0f);
        self.ball.alpha = 1.0f;
        
    } completion:^(BOOL finished) {
        NSLog(@"Animation Finished");
        [self startRotationOfBall];
    }];
}

- (void)startRotationOfBall {
    [UIView animateWithDuration:1.5f animations:^{
        
        self.ball.transform = CGAffineTransformMakeRotation(M_PI);
        
    } completion:^(BOOL finished) {
        NSLog(@"Rotation Finished");
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}







@end

















