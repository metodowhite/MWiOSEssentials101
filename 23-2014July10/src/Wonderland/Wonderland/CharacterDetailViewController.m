//
//  CharacterDetailViewController.m
//  Wonderland
//
//  Created by metodowhite on 10/07/14.
//  Copyright (c) 2014 metodowhite. All rights reserved.
//

#import "CharacterDetailViewController.h"
#import "Character.h"

@interface CharacterDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextView *description;
@end

@implementation CharacterDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    self.name.text = self.leCurrentCharacter.characterName;
    self.imageView.image = self.leCurrentCharacter.characterImage;
    self.description.text = self.leCurrentCharacter.characterDescription;
}


#pragma mark - Navigation

//// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//    CharacterDetailViewController *detailViewController = [segue destinationViewController];
//    detailViewController.leCurrentCharacter =
//}

@end












