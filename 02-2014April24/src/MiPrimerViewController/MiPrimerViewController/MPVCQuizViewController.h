//
//  MPVCQuizViewController.h
//  MiPrimerViewController
//
//  Created by metodowhite on 24/04/14.
//  Copyright (c) 2014 elkraneoteach. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MPVCQuizViewController : UIViewController

@property (nonatomic) int currentQuestionIndex;

@property (nonatomic, copy) NSArray *questions;
@property (nonatomic, copy) NSArray *answers;

@property (nonatomic, weak) IBOutlet UILabel *questionLabel;
@property (nonatomic, weak) IBOutlet UILabel *answerLabel;

@end
