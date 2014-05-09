//
//  TCSViewController.m
//  TestClass
//
//  Created by metodowhite on 25/04/14.
//  Copyright (c) 2014 elkraneoteach. All rights reserved.
//

#import "TCSViewController.h"
#import "TCSParty.h"

@interface TCSViewController ()

@end

@implementation TCSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    TCSParty *partyInstance = [[TCSParty alloc] init];
    [partyInstance crearFiestaConPrecio:@22];
    
    partyInstance = nil;
    
    if (partyInstance == nil) {
        //TODO: crear fiesta
    }
    
    if (!partyInstance) {
        //TODO: crear fiesta
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
