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
    
        
        NSMutableArray *items = [[NSMutableArray alloc] init];
    
        for (int i = 0; i<30; i++) {
            BNRItem *item = [BNRItem randomItem];
            [items addObject:item];
        };
        
        for (NSString *item in items) {
            NSLog(@"%@", item);
        }
        
//        id lastObj = [items lastObject];
//        [lastObj count];

    }
    return 0;
}










