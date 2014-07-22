//
//  ViewController.m
//  Solista
//
//  Created by metodowhite on 15/07/14.
//  Copyright (c) 2014 metodowhite. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>


@interface ViewController ()

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
//    testObject[@"foo"] = @"bar";
    testObject[@"fooBOOL"] = @(YES);
    [testObject saveInBackground];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)retrieveTestObject:(id)sender {
    PFQuery *query = [PFQuery queryWithClassName:@"TestObject"];
    
    [query getObjectInBackgroundWithId:@"K7yV8hr4iW" block:^(PFObject *leObject, NSError *error) {
        
        // Do something with the returned PFObject in the gameScore variable.
        if (leObject) {
            //Dirty Values
            leObject[@"nombre"] = @"peter";
            leObject[@"valor"] = @1234566.999;
            leObject[@"valor2"] = @1;
            
            [leObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                NSLog(@"%@", leObject);
            }];
        }
    }];
}

- (IBAction)incrementValue:(id)sender {
    PFQuery *query = [PFQuery queryWithClassName:@"TestObject"];

    [query getObjectInBackgroundWithId:@"K7yV8hr4iW" block:^(PFObject *leObject, NSError *error) {
        [leObject incrementKey:@"valor2"];
        [leObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            NSLog(@"%@", leObject);
        }];
    }];
}

- (IBAction)saveArray:(id)sender {
    PFQuery *query = [PFQuery queryWithClassName:@"TestObject"];
    [query getObjectInBackgroundWithId:@"K7yV8hr4iW" block:^(PFObject *leObject, NSError *error) {
        
        [leObject addObjectsFromArray:@[@"paco", @"pico", @"piedra"] forKey:@"skills"];
        [leObject saveInBackground];
    }];
}

- (IBAction)createPost:(id)sender {
    PFObject *myPost = [PFObject objectWithClassName:@"Post"];
    myPost[@"title"] = @"Tengo hambre";
    myPost[@"content"] = @"Pensando donde ir a comer";

    PFObject *myComment = [PFObject objectWithClassName:@"Comment"];
    myComment[@"content"] = @"Vamos a pos Sushi";
    
    //    myComment[@"parent"] = myPost;
    myComment[@"parent2"] = [PFObject objectWithoutDataWithClassName:@"TestObject" objectId:@"K7yV8hr4iW"];
    [myComment saveInBackground];
    
}

@end
















