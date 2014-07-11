//
//  ViewController.m
//  Palomo
//
//  Created by metodowhite on 10/07/14.
//  Copyright (c) 2014 metodowhite. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <MKMapViewDelegate>

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [_mapView setUserTrackingMode:MKUserTrackingModeFollow];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)mapView:(MKMapView *)mapView didChangeUserTrackingMode:(MKUserTrackingMode)mode animated:(BOOL)animated {
    
    if (mode == MKUserTrackingModeNone) {
        [mapView setUserTrackingMode:MKUserTrackingModeFollow];
    }
}

@end
