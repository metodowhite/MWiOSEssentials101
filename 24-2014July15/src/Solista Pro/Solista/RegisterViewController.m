//
//  ViewController.m
//  Solista
//
//  Created by metodowhite on 15/07/14.
//  Copyright (c) 2014 metodowhite. All rights reserved.
//

#import "RegisterViewController.h"
#import <Parse/Parse.h>


@interface RegisterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)viewDidAppear:(BOOL)animated {
    PFUser *currentUser = [PFUser currentUser];
    if (currentUser) {
        [self performSegueWithIdentifier:@"userLoggedSegue" sender:self];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doRegister:(id)sender {
    PFUser *newUser = [PFUser user];
    newUser.username = self.usernameField.text;
    newUser.password = self.passwordField.text;
    
    newUser[@"preferencia"] = @"kinki";
    
    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            [self performSegueWithIdentifier:@"userLoggedSegue" sender:self];
        } else {
            NSString *errorString = [error userInfo][@"error"];
            NSLog(@"errorString: %@", errorString);
        }
    }];
}

- (IBAction)doLogin:(id)sender {
    [PFUser logInWithUsernameInBackground:self.usernameField.text password:self.passwordField.text block:^(PFUser *user, NSError *error) {
        if (user) {
            [self performSegueWithIdentifier:@"userLoggedSegue" sender:self];
        }
    }];
}


//- (IBAction)retrieveTestObject:(id)sender {
////    PFQuery *query = [PFQuery queryWithClassName:@"TestObject"];
////    [query whereKey:@"fooBOOL" equalTo:@YES];
//
//
//
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"fooBOOL = %@", @NO];
//    PFQuery *query = [PFQuery queryWithClassName:@"TestObject" predicate:predicate];
//
////    [query whereKey:@"fooBOOL" notEqualTo:@YES];
////    [query whereKey:@"value" greaterThan:@23];
////    query.limit = 10;
////    [query getFirstObject];
////    query.skip = 10;
////    [query orderByAscending:@"value"];
////    [query orderByDescending:@"value"];
//
//    NSArray *skills = @[@"pico", @"piedra"];
//    [query whereKey:@"skills" containedIn:skills];
//
//    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
//        if (objects) {
//            for (PFObject *object in objects) {
//                NSLog(@"%@", object.objectId);
//            }
//        }
//    }];
//}

@end
















