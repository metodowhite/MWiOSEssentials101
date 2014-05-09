//
//  MWHypnosisView.m
//  Hypnosister
//
//  Created by metodowhite on 06/05/14.
//  Copyright (c) 2014 elkraneoteach. All rights reserved.
//

#import "MWHypnosisView.h"

@implementation MWHypnosisView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.*/

// 1
//- (void)drawRect:(CGRect)rect
//{
//    CGRect myBounds = self.bounds;
//    
//    CGPoint myCenter;
//    myCenter.x = myBounds.origin.x + myBounds.size.width / 2.0;
//    myCenter.y = myBounds.origin.y + myBounds.size.height / 2.0;
//    
//    float myRadius = (MIN(myBounds.size.width, myBounds.size.height) / 2.0);
//    
//
//    UIBezierPath *myPath = [[UIBezierPath alloc] init];
//
//    myPath.lineWidth = 10.0;
//    [[UIColor darkGrayColor] setStroke];
//
//    [myPath addArcWithCenter:myCenter
//                      radius:myRadius - myPath.lineWidth / 2.0
//                  startAngle:0.0
//                    endAngle:M_PI * 2.0
//                   clockwise:YES];
//    
//    [myPath stroke];
//}

// 2
//- (void)drawRect:(CGRect)rect
//{
//    CGRect myBounds = self.bounds;
//    
//    CGPoint myCenter;
//    myCenter.x = myBounds.origin.x + myBounds.size.width / 2.0;
//    myCenter.y = myBounds.origin.y + myBounds.size.height / 2.0;
//    
////    float myRadius = (MIN(myBounds.size.width, myBounds.size.height) / 2.0);
//    float maxRadius = hypotf(myBounds.size.width, myBounds.size.height) / 2.0;
//    
//    
//    UIBezierPath *myPath = [[UIBezierPath alloc] init];
//    
//    myPath.lineWidth = 10.0;
//    [[UIColor darkGrayColor] setStroke];
//    
//    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
//        [myPath moveToPoint:CGPointMake(myCenter.x + currentRadius, myCenter.y)];
//        
//        [myPath addArcWithCenter:myCenter
//                          radius:currentRadius
//                      startAngle:0.0
//                        endAngle:M_PI * 2.0
//                       clockwise:YES];
//    }
//
//    
//    [myPath stroke];
//}


// 3
- (void)drawRect:(CGRect)rect
{
    CGRect myBounds = self.bounds;
    
    CGPoint myCenter;
    myCenter.x = myBounds.origin.x + myBounds.size.width / 2.0;
    myCenter.y = myBounds.origin.y + myBounds.size.height / 2.0;
    
    //    float myRadius = (MIN(myBounds.size.width, myBounds.size.height) / 2.0);
    float maxRadius = hypotf(myBounds.size.width, myBounds.size.height) / 2.0;
    
    
    UIBezierPath *myPath = [[UIBezierPath alloc] init];
    
    myPath.lineWidth = 10.0;
    [[UIColor darkGrayColor] setStroke];
    
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
        [myPath moveToPoint:CGPointMake(myCenter.x + currentRadius, myCenter.y)];
        
        [myPath addArcWithCenter:myCenter
                          radius:currentRadius
                      startAngle:0.0
                        endAngle:M_PI * 2.0
                       clockwise:YES];
    }
    [myPath stroke];
    
    
    UIImage *hypnoSapoImage = [UIImage imageNamed:@"Hypnotoad"];
    [hypnoSapoImage drawAtPoint:CGPointZero];
}





@end









