//
//  CharactersTableViewController.m
//  Wonderland
//
//  Created by metodowhite on 08/07/14.
//  Copyright (c) 2014 metodowhite. All rights reserved.
//

#import "CharactersTableViewController.h"

@interface CharactersTableViewController ()
@property (nonatomic) NSArray *charactersData;
@end


const NSString *kNameKey = @"name";

@implementation CharactersTableViewController

//#define kNameKey @"name"
//#define kImageKey @"image"
//#define kDescriptionKey @"description"

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // NSURL *dataURL = [[NSBundle mainBundle] URLForResource:@"Characters" withExtension:@"nsarray"];
    // self.charactersData = [NSArray arrayWithContentsOfURL:dataURL];
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"Characters" ofType:@"plist"];
    self.charactersData = [NSArray arrayWithContentsOfFile:plistPath];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return _charactersData.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"leCell" forIndexPath:indexPath];
    
    NSDictionary *characterInfo = _charactersData[indexPath.row];
    cell.textLabel.text = characterInfo[kNameKey];
    
    return cell;
}


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
