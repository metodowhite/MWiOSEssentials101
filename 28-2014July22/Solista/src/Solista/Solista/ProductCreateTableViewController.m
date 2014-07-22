//
//  ProductCreateTableViewController.m
//  Solista
//
//  Created by metodowhite on 20/07/14.
//  Copyright (c) 2014 metodowhite. All rights reserved.
//

#import "ProductCreateTableViewController.h"
#import <Parse/Parse.h>


@interface ProductCreateTableViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextView *tagsTextView;
@property (weak, nonatomic) IBOutlet UIImageView *photoView;
@property (weak, nonatomic) IBOutlet UITextField *priceField;
@property (weak, nonatomic) IBOutlet UITextField *quantityField;
@end

@implementation ProductCreateTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveAndDismiss:(id)sender {
    // PFFile *photoFile = [PFFile fileWithData:UIImagePNGRepresentation(self.photoView.image)];
    
    PFObject *newProduct = [[PFObject alloc] initWithClassName:@"Products"];
    newProduct[@"name"] = self.nameField.text;
    newProduct[@"tags"] = self.tagsTextView.text;
    newProduct[@"image"] = [PFFile fileWithData:UIImagePNGRepresentation(self.photoView.image)];
    newProduct[@"price"] = self.priceField.text;
    newProduct[@"quantity"] = self.quantityField.text;
    
    [newProduct saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        [self dismiss];
    }];
}

- (IBAction)cancelAndDismiss:(id)sender {
    [self dismiss];
}

- (void)dismiss {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

/*
 #pragma mark - Table view data source
 
 - (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
 #warning Potentially incomplete method implementation.
 // Return the number of sections.
 return 0;
 }
 
 - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
 #warning Incomplete method implementation.
 // Return the number of rows in the section.
 return 0;
 }
 
 
 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
 
 // Configure the cell...
 
 return cell;
 }
 */

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
