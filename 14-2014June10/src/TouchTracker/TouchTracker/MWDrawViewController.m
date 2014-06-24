//
//  MWDrawViewController.m
//  TouchTracker
//
//  Created by metodowhite on 10/06/14.
//  Copyright (c) 2014 metodowhite. All rights reserved.
//

#import "MWDrawViewController.h"
#import "MWDrawView.h"

@implementation MWDrawViewController

- (void)loadView {
    self.view = [[MWDrawView alloc] initWithFrame:CGRectZero];
}

@end
