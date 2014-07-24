//
//  GravityWithCollisionViewController.m
//  MiPrimerUIKitDynamics
//
//  Created by metodowhite on 24/07/14.
//  Copyright (c) 2014 metodowhite. All rights reserved.
//

#import "GravityWithCollisionViewController.h"

@interface GravityWithCollisionViewController () <UICollisionBehaviorDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *ball;
@property (nonatomic) UIDynamicAnimator *animator;
@end

@implementation GravityWithCollisionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[self.ball]];
    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[self.ball]];
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    collisionBehavior.collisionDelegate = self;
    
    [self.animator addBehavior:gravityBehavior];
    [self.animator addBehavior:collisionBehavior];
}

- (void)collisionBehavior:(UICollisionBehavior *)behavior
      beganContactForItem:(id<UIDynamicItem>)item
   withBoundaryIdentifier:(id<NSCopying>)identifier
                  atPoint:(CGPoint)p {
   
    // contacto iniciado
}

- (void)collisionBehavior:(UICollisionBehavior *)behavior
      endedContactForItem:(id<UIDynamicItem>)item
   withBoundaryIdentifier:(id<NSCopying>)identifier {
    
    // contacto terminado
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
