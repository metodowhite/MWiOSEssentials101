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

#import "MPADetailViewController.h"

// Class Extension
@interface MPAItemsTableViewController ()
@property (nonatomic, strong) IBOutlet UIView *headerView;
@end


@implementation MPAItemsTableViewController

- (instancetype)init {
    
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        UINavigationItem *navItem = self.navigationItem;
        navItem.title = @"Homepwner";
        
        UIBarButtonItem *bbi = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                             target:self
                                                                             action:@selector(addNewItem:)];
        
        navItem.rightBarButtonItem = bbi;
        
        navItem.leftBarButtonItem = self.editButtonItem;
        [navItem.leftBarButtonItem setEnabled:NO];
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
    return [[[MPAItemStore sharedStore] allItems] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"leCell" forIndexPath:indexPath];
    
    NSArray *items = [[MPAItemStore sharedStore] allItems];
    
    MPAItem *item = [items objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [item description];
    
    return cell;
}

// Lazy Loading
//- (UIView *)headerView {
//    if (!_headerView) {
//        [[NSBundle mainBundle] loadNibNamed:@"HeaderView"
//                                      owner:self
//                                    options:nil];
//    }
//    return _headerView;
//}


- (IBAction)addNewItem:(id)sender {
    [self.navigationItem.leftBarButtonItem setEnabled:YES];
    
    MPAItem *newItem = [[MPAItemStore sharedStore] createItem];
    
    NSInteger lastRow = [[[MPAItemStore sharedStore] allItems] indexOfObject:newItem];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:lastRow inSection:0];
    
    [self.tableView insertRowsAtIndexPaths:@[indexPath]
                          withRowAnimation:UITableViewRowAnimationTop];
}

//- (IBAction)toggleEditingMode:(id)sender {
//    if (self.isEditing) {
//        [sender setTitle:@"Edit" forState:UIControlStateNormal];
//        [self setEditing:NO animated:YES];
//    } else {
//        [sender setTitle:@"Done" forState:UIControlStateNormal];
//        [self setEditing:YES animated:YES];
//    }
//}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSArray *items = [[MPAItemStore sharedStore]  allItems];
        MPAItem *item = items[indexPath.row];
        [[MPAItemStore sharedStore] removeItem:item];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath]
                         withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    
    [[MPAItemStore sharedStore] moveItemAtIndex:sourceIndexPath.row
                                        toIndex:destinationIndexPath.row];
}





- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    MPADetailViewController *detailViewController = [[MPADetailViewController alloc] init];
    
    NSArray *items = [[MPAItemStore sharedStore] allItems];
    MPAItem *selectedItem = items[indexPath.row];
    
    detailViewController.item = selectedItem;
    
    [self.navigationController pushViewController:detailViewController
                                         animated:YES];
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.tableView reloadData];
}






@end







