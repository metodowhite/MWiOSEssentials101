//
//  MWView.m
//  TouchTracker
//
//  Created by metodowhite on 10/06/14.
//  Copyright (c) 2014 metodowhite. All rights reserved.
//

#import "MWDrawView.h"
#import "MWLine.h"

@interface MWDrawView()
//1
//@property (nonatomic, strong) MWLine *currentLine;

//2
@property (nonatomic, strong) NSMutableDictionary *linesInProgress;
@property (nonatomic, strong) NSMutableArray *finishedLines;
@end

@implementation MWDrawView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        //2
        self.linesInProgress = [[NSMutableDictionary alloc] init];
        
        //1
        self.finishedLines = [[NSMutableArray alloc] init]; //[NSMutableArray new];
        self.backgroundColor = [UIColor grayColor];
        //2
        self.multipleTouchEnabled = YES;
    }
    return self;
}

- (void)strokeLine:(MWLine *)line {
    UIBezierPath *bp = [UIBezierPath bezierPath];
    bp.lineWidth = 10;
    bp.lineCapStyle = kCGLineCapRound;
    
    [bp moveToPoint:line.begin];
    [bp addLineToPoint:line.end];
    [bp stroke];
}

- (void)drawRect:(CGRect)rect {
    [[UIColor blackColor] set];
    for (MWLine *line in self.finishedLines) {
        [self strokeLine:line];
    }
    
    //1
    //    if (self.currentLine) {
    //        [[UIColor redColor] set];
    //        [self strokeLine:self.currentLine];
    //    }
    
    //2
    [[UIColor redColor] set];
    for (NSValue *key in self.linesInProgress) {
        [self strokeLine:self.linesInProgress[key]];
    }
}

//1
//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
//    UITouch *t = [touches anyObject];
//
//    CGPoint location = [t locationInView:self];
//
//    self.currentLine = [[MWLine alloc] init];
//    self.currentLine.begin = location;
//    self.currentLine.end = location;
//
//    [self setNeedsDisplay];
//}


//2
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    for (UITouch *t in touches) {
        CGPoint location = [t locationInView:self];
        
        MWLine *line = [[MWLine alloc] init];
        line.begin = location;
        line.end = location;
        
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        self.linesInProgress[key] = line;
    }
    
    [self setNeedsDisplay];
}

//1
//- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
//    UITouch *t = [touches anyObject];
//
//    CGPoint location = [t locationInView:self];
//
//    self.currentLine.end = location;
//    [self setNeedsDisplay];
//}

//2
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *t in touches) {
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        MWLine *line = self.linesInProgress[key];
        
        line.end = [t locationInView:self];
    }
    [self setNeedsDisplay];
}


//1
//- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
//    [self.finishedLines addObject:self.currentLine];
//
//    self.currentLine = nil;
//    [self setNeedsDisplay];
//}


//2
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *t in touches) {
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        MWLine *line = self.linesInProgress[key];
        
        [self.finishedLines addObject:line];
        [self.linesInProgress removeObjectForKey:key];
        
        [self setNeedsDisplay];
    }
}

//2
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *t in touches) {
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        [self.linesInProgress removeObjectForKey:key];
    }
}

@end



























