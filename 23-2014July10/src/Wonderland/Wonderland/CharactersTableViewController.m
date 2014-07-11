//
//  CharactersTableViewController.m
//  Wonderland
//
//  Created by metodowhite on 08/07/14.
//  Copyright (c) 2014 metodowhite. All rights reserved.
//

#import "CharactersTableViewController.h"
#import "Character.h"
#import "CharacterDetailViewController.h"

@interface CharactersTableViewController ()
@property (nonatomic) NSMutableArray *charactersData;
@end


const NSString *kNameKey = @"name";
const NSString *kImageKey = @"image";
const NSString *kDescriptionKey = @"description";

@implementation CharactersTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.charactersData = [[NSMutableArray alloc] init];
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"Characters" ofType:@"plist"];
    
    for (NSDictionary *character in [NSArray arrayWithContentsOfFile:plistPath]) {
        Character *newCharacter = [[Character alloc] init];
        newCharacter.characterName = character[kNameKey];
        newCharacter.characterImage = [UIImage imageNamed:character[kImageKey]];
        newCharacter.characterDescription = character[kDescriptionKey];
        
        [self.charactersData addObject:newCharacter];
    }
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
    
    Character *character = _charactersData[indexPath.row];
    cell.textLabel.text = character.characterName;
    
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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    CharacterDetailViewController *leDetail = [segue destinationViewController];
    leDetail.leCurrentCharacter = _charactersData[[self.tableView indexPathForSelectedRow].row];
}


@end









