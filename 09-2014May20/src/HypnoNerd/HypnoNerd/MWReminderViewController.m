//
//  MWReminderViewController.m
//  HypnoNerd
//
//  Created by metodowhite on 09/05/14.
//  Copyright (c) 2014 elkraneoteach. All rights reserved.
//

#import "MWReminderViewController.h"

@implementation MWReminderViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        self.tabBarItem.title = @"Reminder";
        self.tabBarItem.image = [UIImage imageNamed:@"ReminderIcon"];
    }
    return self;
}

- (IBAction)addReminder:(id)sender {
    NSDate *date = self.datePicker.date;
    NSLog(@"Setting a reminder for %@", date);
    
    UILocalNotification *note = [[UILocalNotification alloc] init];
    note.alertBody = @"Hypnotize me!";
    note.fireDate = date;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"MWReminderViewController loaded its view.");
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.datePicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:60];
}

@end











