//
//  MPAItemsTableViewController.m
//  Homepwner
//
//  Created by metodowhite on 20/05/14.
//  Copyright (c) 2014 elkraneoteach. All rights reserved.
//

#import "MPAItemsTableViewController.h"
#import "MPAItemStore.h"
#import "MPAItem.h"

@implementation MPAItemsTableViewController

- (instancetype)init {
    
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        for (int i = 0; i < 50000; i++) {
            [[MPAItemStore sharedStore] createItem];
        }
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewStyle)style {
    return [self init];
}

-(void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"leCell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[MPAItemStore sharedStore] allItems] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"leCell"];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"leCell" forIndexPath:indexPath];
    
    NSArray *items = [[MPAItemStore sharedStore] allItems];
    MPAItem *item = items[indexPath.row];
    
    cell.textLabel.text = [item description];
    
    return cell;
}







@end







