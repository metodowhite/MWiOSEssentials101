//
//  BNRItem.m
//  RandomItems
//
//  Created by metodowhite on 25/04/14.
//  Copyright (c) 2014 elkraneoteach. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem

- (void)setItemName:(NSString *)str {
    _itemName = str;
}

- (NSString *)itemName {
    return _itemName;
}

- (void)setSerialNumber:(NSString *)str {
    _serialNumber = str;
}

- (NSString *)serialNumber {
    return _serialNumber;
}

- (void)setValueInEuros:(int)v {
    _valueInEuros = v;
}

- (int)valueInEuros {
    return _valueInEuros;
}

- (NSDate *)dateCreated {
    return _dateCreated;
}

@end
