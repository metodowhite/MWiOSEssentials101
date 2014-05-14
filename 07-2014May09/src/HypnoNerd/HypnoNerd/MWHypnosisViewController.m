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

- (void)loadView {
    MWHypnosisView *backgroundView = [[MWHypnosisView alloc] init];
    self.view = backgroundView;
}

@end
