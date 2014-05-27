//
//  MPADetailViewController.h
//  Homepwner
//
//  Created by metodowhite on 27/05/14.
//  Copyright (c) 2014 elkraneoteach. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MPAItem;

@interface MPADetailViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic, strong) MPAItem *item;

@end
