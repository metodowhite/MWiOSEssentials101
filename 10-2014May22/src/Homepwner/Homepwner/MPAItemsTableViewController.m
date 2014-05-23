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

// Class Extension
@interface MPAItemsTableViewController ()
@property (nonatomic, strong) IBOutlet UIView *headerView;
@end


@implementation MPAItemsTableViewController

- (instancetype)init {
    
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        for (int i = 0; i < 500; i++) {
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
    
    UIView *header = self.headerView; //[self headerView];
    [self.tableView setTableHeaderView:header];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //    MPAItemStore *miStore = [MPAItemStore sharedStore];
    //    NSArray *misItems = [miStore allItems];
    //    NSUInteger totalItems = [misItems count];
    //    return totalItems;
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

// Lazy Loading
- (UIView *)headerView {
    if (!_headerView) {
        [[NSBundle mainBundle] loadNibNamed:@"HeaderView"
                                      owner:self
                                    options:nil];
    }
    return _headerView;
}


- (IBAction)addNewItem:(id)sender {
    
}

- (IBAction)toggleEditingMode:(id)sender {
    if (self.isEditing) {
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
        [self setEditing:NO animated:YES];
    } else {
        [sender setTitle:@"Done" forState:UIControlStateNormal];
        [self setEditing:YES animated:YES];
    }
}



@end







