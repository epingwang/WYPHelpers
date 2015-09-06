//
//  IBAssociator.m
//  WYPHelpers
//
//  Created by 王易平 on 15/5/11.
//  Copyright (c) 2015年 王易平. All rights reserved.
//

#import "IBAssociator.h"
#import <objc/runtime.h>

@implementation IBAssociator

- (void)setOwner:(id)owner
{
    if (_owner != owner) {
        [self releaseLifetimeFromObject:_owner];
        _owner = owner;
        [self bindLifetimeToObject:_owner];
    }
}

- (void)bindLifetimeToObject:(id)object
{
    objc_setAssociatedObject(object, (__bridge void *)self, self, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)releaseLifetimeFromObject:(id)object
{
    objc_setAssociatedObject(object, (__bridge void *)self, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
