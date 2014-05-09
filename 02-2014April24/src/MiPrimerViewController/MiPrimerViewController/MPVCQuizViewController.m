//
//  MPVCQuizViewController.m
//  MiPrimerViewController
//
//  Created by metodowhite on 24/04/14.
//  Copyright (c) 2014 elkraneoteach. All rights reserved.
//

#import "MPVCQuizViewController.h"

@interface MPVCQuizViewController ()

@end

@implementation MPVCQuizViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.questions = @[@"From what is cognac made?",
                           @"What is 7+7?",
                           @"What is the capital Vermont?"];
        
        self.answers = @[@"Grapes",
                         @"14",
                         @"Montpelier"];
    }
    return self;
}


-(IBAction)showQuestion:(id)sender {
    self.currentQuestionIndex++;
    
    if (self.currentQuestionIndex == [self.questions count]) {
        self.currentQuestionIndex = 0;
    }
    
    NSString *question = self.questions[self.currentQuestionIndex];
    
    self.questionLabel.text = question;
    
    self.answerLabel.text = @"???";
}


-(IBAction)showAnswer:(id)sender {
    NSString *answer = self.answers[self.currentQuestionIndex];
    
    self.answerLabel.text = answer;
}

@end





