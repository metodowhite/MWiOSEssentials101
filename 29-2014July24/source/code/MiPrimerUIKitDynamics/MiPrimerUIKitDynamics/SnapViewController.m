//
//  SnapViewController.m
//  MiPrimerUIKitDynamics
//
//  Created by metodowhite on 24/07/14.
//  Copyright (c) 2014 metodowhite. All rights reserved.
//

#import "SnapViewController.h"

@interface SnapViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *ball;
@property (nonatomic) UIDynamicAnimator *animator;
@end

@implementation SnapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)handleGestureRecognizer:(UITapGestureRecognizer *)sender {
    CGPoint point = [sender locationInView:self.view];
    
    if ([self.animator behaviors]) {
        [self.animator removeAllBehaviors];
    }
    
    UISnapBehavior *snapBehavior = [[UISnapBehavior alloc] initWithItem:_ball snapToPoint:point];
    [self.animator addBehavior:snapBehavior];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
