//
//  BNRItem.m
//  RandomItems
//
//  Created by metodowhite on 25/04/14.
//  Copyright (c) 2014 elkraneoteach. All rights reserved.
//

#import "MPAItem.h"

@implementation MPAItem

//2
- (NSString *)description {
    NSString *descriptionString = [[NSString alloc] initWithFormat:@"%@ (%@): Vale €%d, salvado el %@",
                                   _itemName,
                                   _serialNumber,
                                   _valueInEuros,
                                   _dateCreated];
    return descriptionString;
}


//3
-(instancetype)initWithItemName:(NSString *)itemName valueInEuros:(int)value serialNumber:(NSString *)sNumber {
    self = [super init];
    if (self) {
        _itemName = itemName;
        _serialNumber = sNumber;
        _valueInEuros = value;
        
        _dateCreated = [[NSDate alloc] init];
    }
    
    return self;
}




+ (instancetype)randomItem {
    NSArray *randomAdjectiveList = @[@"Fluffy", @"Rusty", @"Shiny"];
    NSArray *randomNounList = @[@"Bear", @"Spork", @"Mac"];
    
    NSInteger adjectiveIndex = arc4random() % [randomAdjectiveList count];
    NSInteger nounIndex = arc4random() % [randomNounList count];
    
    //    NSString *randomName = [NSString stringWithFormat:@"%@ %@",
    //                            [randomNounList objectAtIndex:nounIndex],
    //                            [randomAdjectiveList objectAtIndex:adjectiveIndex]];
    
    NSString *randomName = [NSString stringWithFormat:@"%@ %@",
                            randomNounList[nounIndex],
                            randomAdjectiveList[adjectiveIndex]];
    
    int randomValue = arc4random() % 100;
    
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",
                                    '0' + arc4random() % 10,
                                    'A' + arc4random() % 28,
                                    '0' + arc4random() % 10,
                                    'A' + arc4random() % 28,
                                    '0' + arc4random() % 10];
    
    MPAItem *newItem = [[self alloc] initWithItemName:randomName
                                         valueInEuros:randomValue
                                         serialNumber:randomSerialNumber];
    
    return newItem;
}





@end






