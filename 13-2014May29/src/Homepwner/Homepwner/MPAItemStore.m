//
//  MPAItemStore.m
//  Homepwner
//
//  Created by metodowhite on 20/05/14.
//  Copyright (c) 2014 elkraneoteach. All rights reserved.
//

#import "MPAItemStore.h"
#import "MPAItem.h"
#import "MPAImageStore.h"

@interface MPAItemStore()

@property (nonatomic) NSMutableArray *privateItems;

@end

@implementation MPAItemStore

+ (instancetype)sharedStore {
    static MPAItemStore *sharedStore = nil;
    
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    
    return sharedStore;
}

- (instancetype)init {
    @throw [NSException exceptionWithName:@"Singleton"
                                   reason:@"Use +[MPAItemStore sharedStore]"
                                 userInfo:nil];
}

- (instancetype)initPrivate {
    self = [super init];
    if (self) {
        _privateItems = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSArray *)allItems {
    return [self.privateItems copy];
}

- (MPAItem *)createItem {
    MPAItem *item = [MPAItem randomItem];
    
    [self.privateItems addObject:item];
    
    return item;
}

- (void)removeItem:(MPAItem *)item {
    NSString *key = item.itemKey;
    
    [[MPAImageStore sharedStore] deleteImageForKey:key];
    
    [self.privateItems removeObjectIdenticalTo:item];
}

- (void)moveItemAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex {
    if (fromIndex == toIndex) {
        return;
    }
    
    MPAItem *item = self.privateItems[fromIndex];
    [self.privateItems removeObjectAtIndex:fromIndex];
    [self.privateItems insertObject:item atIndex:toIndex];
}

@end








