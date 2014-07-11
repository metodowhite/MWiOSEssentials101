//
//  ViewController.h
//  Palomo
//
//  Created by metodowhite on 10/07/14.
//  Copyright (c) 2014 metodowhite. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController <CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
- (IBAction)dropPin:(id)sender;
- (IBAction)clearPin:(id)sender;

@end

