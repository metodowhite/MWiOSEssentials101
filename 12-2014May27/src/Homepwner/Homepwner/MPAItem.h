//
//  BNRItem.h
//  RandomItems
//
//  Created by metodowhite on 25/04/14.
//  Copyright (c) 2014 elkraneoteach. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MPAItem : NSObject

@property (nonatomic, copy) NSString *itemName;
@property (nonatomic, copy) NSString *serialNumber;
@property (nonatomic) int valueInEuros;
@property (nonatomic, readonly) NSDate *dateCreated;

- (instancetype)initWithItemName:(NSString *)itemName
                    valueInEuros:(int)value
                    serialNumber:(NSString *)sNumber;


//- (instancetype)initWithItemName:(NSString *)itemName;

+ (instancetype)randomItem;

@end




