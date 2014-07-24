//
//  GravityViewController.m
//  MiPrimerUIKitDynamics
//
//  Created by metodowhite on 24/07/14.
//  Copyright (c) 2014 metodowhite. All rights reserved.
//

#import "GravityViewController.h"

@interface GravityViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *ball;
@property (nonatomic) UIDynamicAnimator *animator;
@end

@implementation GravityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[self.ball]];
    
    [self.animator addBehavior:gravityBehavior];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
