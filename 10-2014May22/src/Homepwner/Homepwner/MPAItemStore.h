//
//  MPAItemStore.h
//  Homepwner
//
//  Created by metodowhite on 20/05/14.
//  Copyright (c) 2014 elkraneoteach. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MPAItem;

@interface MPAItemStore : NSObject

@property (nonatomic, readonly) NSArray *allItems;

+ (instancetype)sharedStore;
- (MPAItem *)createItem;

//@property (nonatomic) NSMutableArray *allItems;
//+ (instancetype)sharedStore;

@end
