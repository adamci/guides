//
//  BNRItemStore.h
//  Homepwner
//
//  Created by Adam Cimpeanu on 6/25/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BNRItem;

@interface BNRItemStore : NSObject
+ (instancetype)sharedStore;

@property (nonatomic, readonly) NSArray *allItems;

- (BNRItem *)createItem;
- (void)removeItem:(BNRItem *)item;
- (void)moveItemAtIndex:(NSUInteger)fromIndex
                toIndex:(NSUInteger)toIndex;
- (BOOL)saveChanges;
- (NSArray *)allAssetTypes;

@end
