//
//  main.m
//  RandomItems
//
//  Created by metodowhite on 25/04/14.
//  Copyright (c) 2014 elkraneoteach. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"

int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        
        // insert code here...not really after this…and for this i mean the three points… (…)
        NSLog(@"Hello, World!");
        
        NSMutableArray *items = [[NSMutableArray alloc] init];
        
        [items addObject:@"One"];
        [items addObject:@"Two"];
        [items addObject:@"Three"];
        
        [items insertObject:@"Zero" atIndex:0];
        
        // NSString *myString = @"Hello, World!";
        
        // for (int i = 0; i < [items count]; i++) {
        //     NSString *item = [items objectAtIndex:i];
        //     NSLog(@"%@", item);
        // }
        
        for (NSString *item in items) {
            NSLog(@"%@", item);
        }
        
        // BNRItem *item = [[BNRItem alloc] init];
        
        // [item setItemName:@"Red Sofa"]; //Message
        // item.itemName = @"Red Sofa"; //Dot Notation
        
        // [item setSerialNumber:@"A1B2C"];
        // item.serialNumber = @"A1B2C";
        
        // [item setValueInEuros:100];
        // item.valueInEuros = 100;
        
        // NSLog(@"%@ %@ %@ %d", [item itemName], [item dateCreated], [item serialNumber], [item valueInEuros]);
        // NSLog(@"%@ %@ %@ %d", item.itemName, item.dateCreated, item.serialNumber, item.valueInEuros);
        
        // BNRItem *item = [[BNRItem alloc] initWithItemName:@"Sofa Rojo"];
        
//        BNRItem *item = [[BNRItem alloc] initWithItemName:@"Red Sofa"
//                                             valueInEuros:100
//                                             serialNumber:@"A1B2C"];
//        
//        NSLog(@"%@", item);
//        
//        items = nil;
//        
//        int a = 1;
//        float b = 2.5;
//        char c = 'A';
//        NSLog(@"Integer: %d Float: %f Char: %c", a, b, c);
        
        
        //4
        for (int i = 0; i<30; i++) {
            BNRItem *item = [BNRItem randomItem];
            NSLog(@"%@", item);
        };
    }
    return 0;
}









